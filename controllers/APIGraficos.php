<?php

namespace Controllers;

use Model\Evento;
use Model\Regalo;
use Model\Registro;

class APIGraficos
{

    public static function regalos()
    {
        if (!is_admin()) {
            echo json_encode([]);
            return;
        }

        $regalos = Regalo::all();

        foreach ($regalos as $regalo) {
            $regalo->total = Registro::totalArray(['regalo_id' => $regalo->id, 'paquete_id' => 1]);
        }
        echo json_encode($regalos);
        return;
    }

    public static function eventos()
    {
        if (!is_admin()) {
            echo json_encode([]);
            return;
        }

        // Obtener eventos con mas o menos lugares disponibles
        $menos_disponibles = Evento::ordenarLimite('disponibles', 'ASC', 6);
        $mas_disponibles = Evento::ordenarLimite('disponibles', 'DESC', 6);
        $total = Evento::total();

        $respuesta  = [
            'menos_disponibles' => $menos_disponibles,
            'mas_disponibles' => $mas_disponibles,
            'total' => $total
        ];

        echo json_encode($respuesta);
        return;
    }

    public static function ingresos()
    {
        if (!is_admin()) {
            echo json_encode([]);
            return;
        }

        // Calcular los ingresos
        $virtuales = Registro::total('paquete_id', 2);
        $presenciales = Registro::total('paquete_id', 1);

        $ingresos_v = ($virtuales * 46.30);
        $ingresos_p = ($presenciales * 188.95);
        $tot_ingresos = $ingresos_v + $ingresos_p;

        $respuesta  = [
            'virtuales' => $ingresos_v,
            'presenciales' => $ingresos_p,
            'total' => $tot_ingresos
        ];

        echo json_encode($respuesta);
        return;
    }
}
