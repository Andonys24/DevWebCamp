<?php

namespace Controllers;

use Model\Categoria;
use Model\Dia;
use Model\Evento;
use Model\Hora;
use MVC\Router;

class EventosController
{
    public static function index(Router $router)
    {
        $alertas = [];
        $mensaje = $_GET['mensaje'] ?? null;
        if ($mensaje) {
            Evento::setAlerta('exito', mensajeAlerta($mensaje, 'Evento'));
        }

        $alertas = Evento::getAlertas();

        $router->render('admin/eventos/index', [
            'titulo' => 'Conferencias y Workshops',
            'alertas' => $alertas
        ]);
    }

    public static function crear(Router $router)
    {
        $alertas = [];
        $categorias = Categoria::all('ASC');
        $dias = Dia::all('ASC');
        $horas = Hora::all('ASC');

        $evento = new Evento;

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $evento->sincronizar($_POST);
            $alertas = $evento->validar();

            if (empty($alertas)) {
                $resultado = $evento->guardar();

                if ($resultado) {
                    header('Location: /admin/eventos?mensaje=1');
                }
            }
        }

        $router->render('admin/eventos/crear', [
            'titulo' => 'Crear Evento',
            'alertas' => $alertas,
            'categorias' => $categorias,
            'dias' => $dias,
            'horas' => $horas,
            'evento' => $evento
        ]);
    }
}
