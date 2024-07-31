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

function mensajeAlerta($codigo, $entidad = 'Elemento')
{
    $acciones = [
        '1' => 'registrado',
        '2' => 'actualizado',
        '3' => 'eliminado'
    ];

    if (isset($acciones[$codigo])) {
        return "El $entidad fue {$acciones[$codigo]} correctamente";
    } else {
        return "Código de mensaje no válido";
    }
}
