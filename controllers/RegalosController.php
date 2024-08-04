<?php

namespace Controllers;

use MVC\Router;
use Model\Regalo;
use Classes\Paginacion;

class RegalosController
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
            header('Location: /admin/regalos?page=1');
        }

        $registros_por_pagina = 10;
        $total = Regalo::total();
        $paginacion = new Paginacion($pagina_actual, $registros_por_pagina, $total);

        if ($paginacion->total_paginas() < $pagina_actual) {
            header('Location: /admin/regalos?page=' . $paginacion->total_paginas());
        }

        $regalos = Regalo::paginar($registros_por_pagina, $paginacion->offset());

        $alertas = [];
        $mensaje = $_GET['mensaje'] ?? null;

        if ($mensaje) {
            Regalo::setAlerta('exito', mensajeAlerta($mensaje, 'Regalo'));
        }

        $alertas = Regalo::getAlertas();

        $router->render('admin/regalos/index', [
            'titulo' => 'Regalos',
            'alertas' => $alertas,
            'regalos' => $regalos,
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
        $regalo = new Regalo();

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {

            if (!is_admin()) {
                header('Location: /login');
                return;
            }
            $regalo->sincronizar($_POST);


            // validar
            $alertas = $regalo->validar_regalo();


            if (empty($alertas)) {
                $resultado = $regalo->guardar();

                if ($resultado) {
                    header('Location: /admin/regalos?page=1&mensaje=1');
                }
            }
        }

        $router->render('admin/regalos/crear', [
            'titulo' => 'Registrar Ponente',
            'alertas' => $alertas,
            'regalos' => $regalo
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
        $regalo = Regalo::find($id);

        if (!$regalo) {
            header('Location: /admin/regalos');
            return;
        }

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {

            if (!is_admin()) {
                header('Location: /login');
                return;
            }

            $regalo->sincronizar($_POST);

            $alertas = $regalo->validar_regalo();

            if (empty($alertas)) {

                $resultado = $regalo->guardar();

                if ($resultado) {
                    header('Location: /admin/regalos?page=1&mensaje=2');
                }
            }
        }

        $router->render('admin/regalos/editar', [
            'titulo' => 'Actualizar Ponente',
            'alertas' => $alertas,
            'regalo' => $regalo,
        ]);
    }

    public static function eliminar()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            if (!is_admin()) {
                header('Location: /login');
                return;
            }

            $id = $_POST['id'];
            $regalo = Regalo::find($id);
            if (!isset($regalo)) {
                header('Location: /admin/regalos');
            }
            $resultado = $regalo->eliminar();
            if ($resultado) {
                header('Location: /admin/regalos?page=1&mensaje=3');
            }
        }
    }
}
