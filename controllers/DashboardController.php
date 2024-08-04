<?php

namespace Controllers;

use Model\Ponente;
use Model\Registro;
use Model\Usuario;
use MVC\Router;

class DashboardController
{
    public static function index(Router $router)
    {
        // totales
        $registros = Registro::total();
        $ponentes = Ponente::total();


        $router->render('admin/dashboard/index', [
            'titulo' => 'Panel de Administración',
            'registros' => $registros,
            'ponentes' => $ponentes
        ]);
    }
}
