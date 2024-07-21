<main class="auth">
    <h2 class="auth__heading"><?php echo $titulo; ?></h2>
    <p class="auth__texto">Inicia sesion en DevWebCamp</p>

    <?php include_once __DIR__ . '/../templates/alertas.php' ?>

    <form action="/login" method="post" class="formulario">
        <div class="formulario__campo">
            <label for="email" class="formulario__label">Email</label>
            <input type="email" id="email" name="email" placeholder="Tu email" class="formulario__input" value="<?php echo s($usuario->email); ?>">
        </div>
        <div class="formulario__campo">
            <label for="password" class="formulario__label">Password</label>
            <input type="password" id="password" name="password" placeholder="Tu Password" class="formulario__input">
        </div>

        <input type="submit" value="Iniciar Sesión" class="formulario__submit">
    </form>

    <div class="acciones">
        <a href="/registro" class="acciones__enlace">¿Aún no tienes cuenta? Obtener Una</a>
        <a href="/olvide" class="acciones__enlace">¿Olvidaste tu password?</a>
    </div>
</main>