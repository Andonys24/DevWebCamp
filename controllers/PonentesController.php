<?php

namespace Controllers;

use MVC\Router;
use Model\Ponente;
use Classes\Paginacion;
use Intervention\Image\ImageManagerStatic as Image;

class PonentesController
{
    public static function index(Router $router)
    {

        if (!is_admin()) {
            header('Location: /login');
            return;
        }

        $pagina_actual = $_GET['page'] ?? null;
        $pagina_actual = filter_var($pagina_actual, FILTER_VALIDATE_INT);
        if (!$pagina_actual || $pagina_actual < 1) {
            header('Location: /admin/ponentes?page=1');
        }

        $registros_por_pagina = 10;
        $total = Ponente::total();
        $paginacion = new Paginacion($pagina_actual, $registros_por_pagina, $total);

        if ($paginacion->total_paginas() < $pagina_actual) {
            header('Location: /admin/ponentes?page=' . $paginacion->total_paginas());
        }

        $ponentes = Ponente::paginar($registros_por_pagina, $paginacion->offset());

        $alertas = [];
        $mensaje = $_GET['mensaje'] ?? null;

        if ($mensaje) {
            Ponente::setAlerta('exito', mensajeAlerta($mensaje, 'Ponente'));
        }

        $alertas = Ponente::getAlertas();
        $router->render('admin/ponentes/index', [
            'titulo' => 'Ponentes / Conferencistas',
            'alertas' => $alertas,
            'ponentes' => $ponentes,
            'paginacion' => $paginacion->paginacion()
        ]);
    }

    public static function crear(Router $router)
    {
        if (!is_admin()) {
            header('Location: /login');
            return;
        }

        $alertas = [];
        $ponente = new Ponente();

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {

            if (!is_admin()) {
                header('Location: /login');
                return;
            }

            if (!empty($_FILES['imagen']['tmp_name'])) {

                $carpeta_imagenes = '../public/img/speakers';

                // Crear carpeta si no existe
                if (!is_dir($carpeta_imagenes)) {
                    mkdir($carpeta_imagenes, 0777, true);
                }

                $imagen_png = Image::make($_FILES['imagen']['tmp_name'])->fit(800, 800)->encode('png', 80);
                $imagen_webp = Image::make($_FILES['imagen']['tmp_name'])->fit(800, 800)->encode('webp', 80);

                $nombre_imagen = md5(uniqid(rand(), true));
                $_POST['imagen'] = $nombre_imagen;
            }

            $_POST['redes'] = json_encode($_POST['redes'], JSON_UNESCAPED_SLASHES);

            $ponente->sincronizar($_POST);


            // validar
            $alertas = $ponente->validar_ponente();


            if (empty($alertas)) {
                // guardar las imagenes
                $imagen_png->save($carpeta_imagenes . "/" . $nombre_imagen . ".png");
                $imagen_webp->save($carpeta_imagenes . "/" . $nombre_imagen . ".webp");
                $resultado = $ponente->guardar();

                if ($resultado) {
                    header('Location: /admin/ponentes?page=1&mensaje=1');
                }
            }
        }

        $router->render('admin/ponentes/crear', [
            'titulo' => 'Registrar Ponente',
            'alertas' => $alertas,
            'ponente' => $ponente,
            'redes' => json_decode($ponente->redes)
        ]);
    }

    public static function editar(Router $router)
    {
        if (!is_admin()) {
            header('Location: /login');
            return;
        }

        $alertas = [];
        // Validar ID
        $id = $_GET['id'];
        // Validar si el id es un entero
        $id = filter_var($id, FILTER_VALIDATE_INT);

        if (!$id) {
            // Redireccionar
            header('Location: /admin/ponentes');
        }

        // Obtener el ponente a editar
        $ponente = Ponente::find($id);

        if (!$ponente) {
            header('Location: /admin/ponentes');
            return;
        }

        $ponente->imagen_actual = $ponente->imagen;

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {

            if (!is_admin()) {
                header('Location: /login');
                return;
            }

            if (!empty($_FILES['imagen']['tmp_name'])) {

                $carpeta_imagenes = '../public/img/speakers';

                // Crear carpeta si no existe
                if (!is_dir($carpeta_imagenes)) {
                    mkdir($carpeta_imagenes, 0777, true);
                }

                $imagen_png = Image::make($_FILES['imagen']['tmp_name'])->fit(800, 800)->encode('png', 80);
                $imagen_webp = Image::make($_FILES['imagen']['tmp_name'])->fit(800, 800)->encode('webp', 80);

                $nombre_imagen = md5(uniqid(rand(), true));

                $_POST['imagen'] = $nombre_imagen;
            } else {
                $_POST['imagen'] = $ponente->imagen_actual;
            }

            $_POST['redes'] = json_encode($_POST['redes'], JSON_UNESCAPED_SLASHES);
            $ponente->sincronizar($_POST);

            $alertas = $ponente->validar_ponente();

            if (empty($alertas)) {
                if (isset($nombre_imagen)) {
                    $imagen_png->save($carpeta_imagenes . "/" . $nombre_imagen . ".png");
                    $imagen_webp->save($carpeta_imagenes . "/" . $nombre_imagen . ".webp");
                }

                $resultado = $ponente->guardar();

                if ($resultado) {
                    header('Location: /admin/ponentes?page=1&mensaje=2');
                }
            }
        }

        $router->render('admin/ponentes/editar', [
            'titulo' => 'Actualizar Ponente',
            'alertas' => $alertas,
            'ponente' => $ponente,
            'redes' => json_decode($ponente->redes)
        ]);
    }

    public static function eliminar(Router $router)
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            if (!is_admin()) {
                header('Location: /login');
                return;
            }

            $id = $_POST['id'];
            $ponente = Ponente::find($id);
            if (!isset($ponente)) {
                header('Location: /admin/ponentes');
            }
            $resultado = $ponente->eliminar();
            if ($resultado) {
                header('Location: /admin/ponentes?page=1&mensaje=3');
            }
        }
    }
}
