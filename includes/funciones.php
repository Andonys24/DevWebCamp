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
        case '3':
            $mensaje = 'El ponente fue actualizado correctamente';
            break;
        case '4':
            $mensaje = 'El ponente fue eliminado correctamente';
            break;
    }
    return $mensaje;
}

function is_auth(): bool
{
    if (!isset($_SESSION)) {
        session_start();
    }
    return isset($_SESSION['nombre']) && !empty($_SESSION);
}

function is_admin(): bool
{
    if (!isset($_SESSION)) {
        session_start();
    }
    return isset($_SESSION['admin']) && !empty($_SESSION['admin']);
}
