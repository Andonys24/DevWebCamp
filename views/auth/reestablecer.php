<main class="auth">
    <h2 class="auth__heading"><?php echo $titulo; ?></h2>
    <p class="auth__texto">Coloca tu nuevo Password</p>

    <?php include_once __DIR__ . '/../templates/alertas.php' ?>

    <?php
    if ($token_valido) {
    ?>
        <form method="post" class="formulario">
            <div class="formulario__campo">
                <label for="password" class="formulario__label">Nuevo Password</label>
                <input type="password" id="password" name="password" placeholder="Tu Nuevo Password" class="formulario__input">
            </div>

            <input type="submit" value="Actualizar Password" class="formulario__submit">
        </form>
    <?php
    }
    ?>

    <div class="acciones">
        <a href="/login" class="acciones__enlace">¿Ya tienes cuenta? Iniciar Sesión</a>
        <a href="/registro" class="acciones__enlace">¿Aún no tienes cuenta? Obtener Una</a>
    </div>
</main>