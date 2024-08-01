<main class="devwebcamp">
    <h2 class="devwebcamp__heading"><?php echo $titulo; ?></h2>
    <p class="devwebcamp__descripcion">Conoce la conferencia mas importante de latinoamerica</p>

    <div class="devwebcamp__grid">
        <div <?php aos_animacion() ?> class="devwebcamp__imagen">
            <picture>
                <source srcset="build/img/sobre_devwebcamp.avif" type="image/avif">
                <source srcset="build/img/sobre_devwebcamp.webp" type="image/webp">
                <img loading="lazy" width="200" height="200" src="build/img/sobre_devwebcamp.jpg" alt="Imagen DevWebCamp">
            </picture>
        </div>
        <div class="devwebcamp__contenido">
            <p <?php aos_animacion() ?> class="devwebcamp__texto">DevWepCamp es la conferencia de desarrolladores más destacada en Latinoamérica, reuniendo a los principales talentos y expertos en tecnología de la región. Nuestro objetivo es proporcionar un espacio donde los profesionales del desarrollo web y software puedan compartir conocimientos, explorar nuevas tendencias y establecer conexiones valiosas dentro de la industria.</p>

            <p <?php aos_animacion() ?> class="devwebcamp__texto">En DevWepCamp, ofrecemos una variedad de charlas, talleres y paneles de discusión dirigidos por líderes del sector, abordando temas cruciales como las últimas innovaciones en desarrollo web, mejores prácticas y estrategias para enfrentar los desafíos tecnológicos actuales. Únete a nosotros para impulsar tu carrera y colaborar con una comunidad apasionada por la tecnología.
            </p>
        </div>
    </div>
</main>