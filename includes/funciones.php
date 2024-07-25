<?php

function debuguear($variable): string
{
    echo "<pre>";
    var_dump($variable);
    echo "</pre>";
    exit;
}
function s($html): string
{
    $s = htmlspecialchars($html);
    return $s;
}

function pagina_actual($path)
{
    return str_contains($_SERVER['PATH_INFO'], $path) ? true : false;
}

function mensajeAlerta($variable)
{
    switch ($variable) {
        case '1':
            $mensaje = 'Tu password ha sido actualizado correctamente';
            break;
        case '2':
            $mensaje = 'El ponente fue registrado correctamente';
            break;
    }
    return $mensaje;
}