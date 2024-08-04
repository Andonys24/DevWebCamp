-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: devwebcamp
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Conferencias'),(2,'Workshops');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dias`
--

DROP TABLE IF EXISTS `dias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dias`
--

LOCK TABLES `dias` WRITE;
/*!40000 ALTER TABLE `dias` DISABLE KEYS */;
INSERT INTO `dias` VALUES (1,'Viernes'),(2,'Sabado');
/*!40000 ALTER TABLE `dias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_general_ci,
  `disponibles` int DEFAULT NULL,
  `categoria_id` int DEFAULT NULL,
  `dia_id` int DEFAULT NULL,
  `hora_id` int DEFAULT NULL,
  `ponente_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_eventos_categorias_idx` (`categoria_id`),
  KEY `fk_eventos_dias1_idx` (`dia_id`),
  KEY `fk_eventos_horas1_idx` (`hora_id`),
  KEY `fk_eventos_ponentes1_idx` (`ponente_id`),
  CONSTRAINT `eventos_ponentes_FK` FOREIGN KEY (`ponente_id`) REFERENCES `ponentes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_eventos_dias1` FOREIGN KEY (`dia_id`) REFERENCES `dias` (`id`),
  CONSTRAINT `fk_eventos_horas1` FOREIGN KEY (`hora_id`) REFERENCES `horas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (1,'Next.js - Aplicaciones con gran performance','Next.js es un framework para React que optimiza el rendimiento de las aplicaciones web con renderizado del lado del servidor (SSR), generación de sitios estáticos (SSG) y una carga de recursos eficiente. Ofrece características como enrutamiento automático, optimización de imágenes y soporte para API, asegurando aplicaciones rápidas y escalables.',50,2,2,1,1),(2,'MongoDB - Base de Datos a gran escala','MongoDB es una base de datos NoSQL orientada a documentos, ideal para aplicaciones a gran escala. Ofrece flexibilidad en el esquema, escalabilidad horizontal y alto rendimiento en la gestión de grandes volúmenes de datos. Su diseño permite manejar datos complejos y consultas rápidas, adaptándose a diversas necesidades de desarrollo.',49,2,2,2,2),(3,'Tailwind y Figma','Tailwind CSS y Figma trabajan juntos para optimizar el diseño web. Figma facilita la creación de prototipos visuales y maquetas interactivas, mientras que Tailwind CSS convierte esos diseños en código con utilidades CSS predefinidas. Juntos, simplifican la transición del diseño a la implementación, asegurando consistencia y eficiencia en el desarrollo.',49,1,1,2,3),(4,'MERN - MongoDB Express React y Node.js - Ejemplo Real','El stack MERN combina MongoDB, Express, React y Node.js para construir aplicaciones web completas. Por ejemplo, una plataforma de comercio electrónico: **MongoDB** almacena productos y usuarios, **Express** maneja las rutas del backend, **React** crea una interfaz de usuario dinámica, y **Node.js** ejecuta el servidor. Juntos, proporcionan una solución robusta y escalable para aplicaciones web interactivas.',30,1,2,4,8),(5,'Vue.js con Django para gran Performance','Combinar Vue.js con Django proporciona una solución poderosa para aplicaciones web de alto rendimiento. **Django** maneja el backend con una arquitectura robusta y segura, mientras que **Vue.js** ofrece una interfaz de usuario reactiva y fluida en el frontend. Esta integración permite crear aplicaciones escalables y rápidas, optimizando tanto el procesamiento en el servidor como la experiencia del usuario en el cliente.',49,2,1,1,4),(6,'DevOps - Primeros Pasos','DevOps es una metodología que integra el desarrollo de software y las operaciones para mejorar la colaboración y la eficiencia. Los primeros pasos incluyen la automatización de la integración y despliegue continuo (CI/CD), la implementación de herramientas de gestión de configuración y monitoreo, y la adopción de prácticas ágiles. Empezar con estas prácticas ayuda a reducir errores, acelerar el desarrollo y mejorar la calidad del software.',19,1,1,1,5),(7,'WordPress y React - Gran Performance a costo 0','Integrar WordPress con React permite aprovechar un CMS robusto junto con una interfaz de usuario dinámica y rápida. Utilizando WordPress como backend y React para el frontend, puedes obtener gran rendimiento y una experiencia de usuario fluida. Además, esta combinación es coste-efectiva, ya que ambas tecnologías son de código abierto, reduciendo gastos de licencias y desarrollo.',10,2,1,2,6),(8,'React, Angular y Svelte - Creando un Proyecto','Comparar React, Angular y Svelte al crear un proyecto revela sus fortalezas únicas:',15,1,1,3,7),(9,'Laravel y Next.js - Aplicaciones Full Stack en Tiempo Record','Combinar Laravel y Next.js permite desarrollar aplicaciones full stack de alta calidad de manera eficiente. **Laravel** maneja el backend con su potente sistema de gestión de bases de datos, autenticación y lógica de servidor, mientras que **Next.js** se encarga del frontend con renderizado del lado del servidor y generación estática. Juntos, optimizan el tiempo de desarrollo y proporcionan una solución robusta y escalable para aplicaciones web completas.',40,1,2,1,8),(10,'Remix - El Nuevo Framework de React','Remix es un framework moderno para React que optimiza el desarrollo web con renderizado del lado del servidor y generación de sitios estáticos. Ofrece una experiencia de desarrollo fluida al manejar la carga de datos, el enrutamiento y la gestión de estados de manera eficiente. Remix se enfoca en mejorar el rendimiento y la escalabilidad, proporcionando una solución robusta y fácil de usar para aplicaciones React.',30,2,1,3,9),(11,'TailwindCSS - Crear Sitios Accesibles','TailwindCSS facilita la creación de sitios web accesibles mediante su enfoque de utilidades. Ofrece clases predefinidas para un diseño consistente y adaptativo, simplificando la implementación de prácticas de accesibilidad como contrastes adecuados, tamaños de fuente legibles y estructura semántica. Su enfoque modular y personalizable permite ajustar el diseño para cumplir con los estándares de accesibilidad y mejorar la experiencia del usuario.',21,1,1,4,10),(12,'TypeScript en React','TypeScript en React mejora el desarrollo al agregar tipado estático al código JavaScript. Esto permite detectar errores antes de tiempo, mejorar la autocompletación y la documentación, y facilitar la refactorización. TypeScript proporciona interfaces y tipos para los props y el estado de los componentes, lo que hace el código más robusto y fácil de mantener en aplicaciones React.',29,2,2,3,11),(13,'Presente y Futuro del Frontend','**Presente del Frontend:** El desarrollo frontend se centra en tecnologías como **React**, **Vue.js** y **Angular** para construir interfaces interactivas. Se utilizan **CSS frameworks** como **TailwindCSS** y herramientas de optimización como **Webpack** para mejorar el diseño y rendimiento.',30,2,2,8,12),(14,'Extiende la API de WordPress con PHP','Extender la API de WordPress con PHP permite personalizar y añadir nuevas funcionalidades a tu sitio. Puedes crear endpoints personalizados para exponer datos específicos o realizar acciones, modificar endpoints existentes para incluir información adicional, y asegurar la validación y sanitización de datos. Esto se logra añadiendo funciones en el archivo `functions.php` de tu tema o en un plugin, permitiendo una integración más flexible y adaptada a tus necesidades.',20,1,1,8,13),(15,'Node y Vue.js - Proyecto Práctico','Combinar **Node.js** y **Vue.js** en un proyecto práctico te permite construir aplicaciones web completas y eficientes. **Node.js** se encarga del backend, proporcionando un servidor para manejar solicitudes y gestionar datos, mientras que **Vue.js** se utiliza para el frontend, creando interfaces de usuario interactivas y dinámicas. ',30,1,2,2,14),(16,'GraphQL y Flutter - Gran Performance para Android y iOS','**GraphQL y Flutter** juntos ofrecen una solución potente para aplicaciones móviles de alto rendimiento. **GraphQL** optimiza la gestión de datos al permitir consultas precisas, mientras que **Flutter** proporciona una interfaz de usuario fluida y rápida para Android e iOS. Juntos, mejoran la eficiencia y la experiencia del usuario en aplicaciones móviles.',27,1,1,5,15),(17,'REST API\'s - Backend para Web y Móvil','**REST APIs** son interfaces que permiten la comunicación entre aplicaciones y servicios mediante HTTP. Actúan como el backend para aplicaciones web y móviles, facilitando el intercambio de datos y funcionalidades de manera estandarizada y escalable. Utilizan métodos como GET, POST, PUT y DELETE para manejar datos de forma eficiente y estructurada.',20,2,1,4,16),(18,'JavaScript - Apps para Web, Desktop y Escritorio','**JavaScript** es un lenguaje versátil que permite desarrollar aplicaciones para web, escritorio y móvil. En la web, es esencial para interfaces interactivas. Con **Electron** y **NW.js**, JavaScript también se usa para crear aplicaciones de escritorio multiplataforma. Además, frameworks como **React Native** permiten desarrollar aplicaciones móviles nativas, haciendo de JavaScript una herramienta clave en el desarrollo de software moderno.',49,2,1,8,17),(19,'Flutter y React Native - ¿Cómo elegir?','Flutter y React Native son frameworks populares para desarrollar aplicaciones móviles. Flutter, de Google, ofrece un rendimiento superior y una experiencia consistente en iOS y Android gracias a su motor de renderizado propio. React Native, de Facebook, se basa en componentes nativos y facilita la integración con código existente. La elección depende de tus necesidades específicas: rendimiento y diseño consistente (Flutter) o integración con aplicaciones nativas y comunidad establecida (React Native).',40,2,1,6,18),(20,'Laravel y Flutter - Creando Un Proyecto Real','Laravel y Flutter son ideales para crear proyectos reales con backend y frontend robustos. Laravel proporciona un backend sólido con características avanzadas como autenticación, manejo de bases de datos y API REST. Flutter ofrece una interfaz de usuario rápida y atractiva para aplicaciones móviles y web. Usar Laravel para el backend y Flutter para el frontend permite desarrollar aplicaciones completas, escalables y con un rendimiento excelente en múltiples plataformas.',30,1,2,5,18),(21,'Laravel y React Native - Creando un Proyecto Real','Laravel y React Native son una combinación eficaz para desarrollar aplicaciones móviles completas. Laravel gestiona el backend con robustez, proporcionando características como autenticación, manejo de bases de datos y API REST. React Native permite crear interfaces de usuario nativas y fluidas para Android e iOS. Juntos, permiten construir un proyecto real con un backend potente y un frontend móvil interactivo, optimizando tanto la funcionalidad como la experiencia del usuario.',50,1,2,7,18),(22,'PHP 8 - ¿Qué es Nuevo y que cambió?','Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sodales condimentum magna fringilla egestas. In non pellentesque magna, at mollis velit. Morbi nec dapibus diam. Phasellus ante neque, blandit eget tortor a, cursus molestie turpis. Aenean placerat aliquet nibh, et interdum ipsum finibus at. Nulla sit amet faucibus leo, vel blandit urna. Curabitur dictum euismod sem, eget euismod magna pulvinar et. Nam semper aliquet nunc eu ornare. ',50,2,1,7,1),(23,'MEVN Stack - Mongo Express  Vue.js y Node.js','MEVN Stack combina MongoDB, Express, Vue.js y Node.js para desarrollar aplicaciones web completas. MongoDB actúa como la base de datos NoSQL, Express maneja las rutas y la lógica del servidor, Vue.js crea interfaces de usuario interactivas, y Node.js ejecuta el entorno del servidor. Juntos, proporcionan una solución integral y escalable para aplicaciones web modernas.',50,2,1,5,2),(24,'Introducción a TailwindCSS','TailwindCSS es un framework de CSS basado en utilidades que permite crear diseños personalizados de manera rápida y eficiente. En lugar de proporcionar componentes predefinidos, TailwindCSS ofrece clases utilitarias que se aplican directamente en el HTML para ajustar el diseño y el estilo. Su enfoque modular facilita la creación de interfaces responsive y personalizables sin necesidad de escribir CSS adicional, promoviendo una mayor consistencia y un desarrollo más ágil.\n\n\n\n',30,2,2,4,3),(25,'WPGraphQL y GatsbyJS - Headless WordPress','WPGraphQL y GatsbyJS permiten usar WordPress como un CMS headless. WPGraphQL expone una API GraphQL para acceder a los datos de WordPress, mientras que GatsbyJS utiliza esta API para generar sitios web estáticos rápidos y optimizados. Juntos, ofrecen una solución potente para crear sitios modernos con WordPress en el backend y Gatsby en el frontend, combinando la flexibilidad de un CMS con el rendimiento de los sitios estáticos.',40,2,2,5,6),(26,'Svelte - El Nuevo Framework de JS ','Svelte es un moderno framework de JavaScript que simplifica el desarrollo web al compilar componentes a código altamente eficiente en lugar de usar un virtual DOM. Esto resulta en aplicaciones más rápidas y ligeras. Svelte ofrece una sintaxis intuitiva y reactividad integrada, lo que facilita la creación de interfaces interactivas con menos código y mejor rendimiento en comparación con otros frameworks.',40,2,2,6,7),(27,'Next.js - El Mejor Framework para React','Next.js es un framework para React que optimiza el desarrollo de aplicaciones web con renderizado del lado del servidor (SSR) y generación de sitios estáticos (SSG). Ofrece características como enrutamiento automático, optimización de imágenes y soporte para API. Next.js facilita el desarrollo de aplicaciones rápidas, escalables y con excelente rendimiento, convirtiéndolo en una de las mejores opciones para proyectos en React.\n\n\n\n',40,2,2,7,8),(28,'React 18 - Una Introducción Práctica','React 18 introduce nuevas características que mejoran el rendimiento y la experiencia de desarrollo. Destaca el renderizado concurrente, que permite actualizaciones más rápidas y suaves, y transiciones automáticas para manejar cambios en la interfaz de usuario sin bloqueos. También introduce useId para manejar identificadores únicos de manera más sencilla. Estas mejoras hacen que React 18 sea más eficiente y flexible para construir interfaces de usuario interactivas y responsivas.',26,1,1,6,9),(29,'Vue.js - Composition API','Vue.js Composition API es una nueva forma de organizar el código en componentes, introducida en Vue 3. Permite agrupar lógica reactiva en funciones reutilizables, mejorando la modularidad y la reutilización del código. A diferencia del enfoque basado en opciones, la Composition API facilita el manejo de estados y efectos secundarios con funciones como ref y computed, y ofrece una mayor flexibilidad y control sobre la lógica del componente. Esto hace que el desarrollo en Vue.js sea más intuitivo y escalable.',20,1,1,7,14),(30,'Vue.js - Pinia para reemplazar Vuex','Pinia es una biblioteca de gestión de estado para Vue.js, diseñada como una alternativa moderna a Vuex. Ofrece una API más simple y flexible, mejor rendimiento, y soporte para composición y TypeScript, facilitando el manejo del estado en aplicaciones Vue.js con una configuración más intuitiva.',25,1,2,3,14),(31,'GraphQL - Introducción Práctica','GraphQL es un lenguaje de consulta para APIs que permite solicitar solo los datos necesarios en una sola solicitud. Ofrece flexibilidad al definir el formato de los datos y facilita la evolución de la API sin afectar a los clientes. Ideal para aplicaciones con requisitos complejos de datos y múltiples fuentes de información.',30,1,2,8,15),(32,'React y TailwindCSS - Frontend Moderno','React es una biblioteca de JavaScript para construir interfaces de usuario interactivas y reutilizables mediante componentes. Junto con TailwindCSS, un framework de utilidades para CSS, facilita el diseño rápido y responsivo sin necesidad de escribir CSS personalizado. Juntos, permiten desarrollar aplicaciones web modernas con una experiencia de usuario fluida y estilizada.',30,1,2,6,17);
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos_registros`
--

DROP TABLE IF EXISTS `eventos_registros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos_registros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `evento_id` int DEFAULT NULL,
  `registro_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `evento_id` (`evento_id`),
  KEY `registro_id` (`registro_id`),
  CONSTRAINT `eventos_registros_ibfk_1` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `eventos_registros_ibfk_2` FOREIGN KEY (`registro_id`) REFERENCES `registros` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos_registros`
--

LOCK TABLES `eventos_registros` WRITE;
/*!40000 ALTER TABLE `eventos_registros` DISABLE KEYS */;
INSERT INTO `eventos_registros` VALUES (1,3,1),(2,11,1),(8,3,1),(9,11,1),(10,5,2),(11,18,2),(12,7,3),(13,14,3),(14,22,3),(15,28,3),(16,1,8),(18,16,6),(19,21,8),(20,27,15),(22,6,5),(23,12,5),(24,17,12),(25,23,5),(26,30,5),(27,4,6),(28,9,6),(30,19,6),(31,26,10),(32,3,27),(33,6,27),(34,11,27);
/*!40000 ALTER TABLE `eventos_registros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horas`
--

DROP TABLE IF EXISTS `horas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hora` varchar(13) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horas`
--

LOCK TABLES `horas` WRITE;
/*!40000 ALTER TABLE `horas` DISABLE KEYS */;
INSERT INTO `horas` VALUES (1,'10:00 - 10:55'),(2,'11:00 - 11:55'),(3,'12:00 - 12:55'),(4,'13:00 - 13:55'),(5,'16:00 - 16:55'),(6,'17:00 - 17:55'),(7,'18:00 - 18:55'),(8,'19:00 - 19:55');
/*!40000 ALTER TABLE `horas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paquetes`
--

DROP TABLE IF EXISTS `paquetes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paquetes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paquetes`
--

LOCK TABLES `paquetes` WRITE;
/*!40000 ALTER TABLE `paquetes` DISABLE KEYS */;
INSERT INTO `paquetes` VALUES (1,'Presencial'),(2,'Virtual'),(3,'Gratis');
/*!40000 ALTER TABLE `paquetes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ponentes`
--

DROP TABLE IF EXISTS `ponentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ponentes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `apellido` varchar(60) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ciudad` varchar(60) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pais` varchar(60) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `imagen` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tags` varchar(220) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `redes` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ponentes`
--

LOCK TABLES `ponentes` WRITE;
/*!40000 ALTER TABLE `ponentes` DISABLE KEYS */;
INSERT INTO `ponentes` VALUES (1,' Julian','Muñoz','Madrid','España','6764a74ccf2b4b5b74e333016c13388a','React,PHP,Laravel','{\"facebook\":\"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628\",\"twitter\":\"https://twitter.com/codigoconjuan\",\"youtube\":\"\",\"instagram\":\"https://instagram.com/codigoconjuan\",\"tiktok\":\"\",\"github\":\"https://github.com/codigoconjuan\"}'),(2,' Israel','González','CDMX','México','6497c66bcc464e26871c046dd5bb86c8','Vue,Node.js,MongoDB','{\"facebook\":\"\",\"twitter\":\"\",\"youtube\":\"https://youtube.com/codigoconjuan\",\"instagram\":\"https://instagram.com/codigoconjuan\",\"tiktok\":\"https://tiktok.com/@codigoconjuan\",\"github\":\"https://github.com/codigoconjuan\"}'),(3,' Isabella','Tassis','Buenos Aires','Argentina','55c7866df31370ec3299eed6eb63daa1','UX / UI,HTML,CSS,TailwindCSS','{\"facebook\":\"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628\",\"twitter\":\"\",\"youtube\":\"https://youtube.com/codigoconjuan\",\"instagram\":\"\",\"tiktok\":\"https://tiktok.com/@codigoconjuan\",\"github\":\"\"}'),(4,' Jazmín','Hurtado','CDMX','México','de6e3fa0cde8402de4c28e6be0903ada','Django,React, Vue.js','{\"facebook\":\"\",\"twitter\":\"https://twitter.com/codigoconjuan\",\"youtube\":\"\",\"instagram\":\"https://instagram.com/codigoconjuan\",\"tiktok\":\"\",\"github\":\"https://github.com/codigoconjuan\"}'),(5,' María Camila','Murillo','Guadalajara','México','cec8c9d7bcb4c19e87d1164bce8fe176','Devops,Git,CI CD','{\"facebook\":\"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628\",\"twitter\":\"https://twitter.com/codigoconjuan\",\"youtube\":\"https://youtube.com/codigoconjuan\",\"instagram\":\"\",\"tiktok\":\"\",\"github\":\"\"}'),(6,' Tomas','Aleman','Bogotá','Colombia','5332118b8d7690a1b992431802eafab1','WordPress,PHP,React','{\"facebook\":\"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628\",\"twitter\":\"https://twitter.com/codigoconjuan\",\"youtube\":\"\",\"instagram\":\"https://instagram.com/codigoconjuan\",\"tiktok\":\"\",\"github\":\"https://github.com/codigoconjuan\"}'),(7,' Lucía','Velázquez','Buenos Aires','Argentina','90956ece4adbd9f9ccb8f4ae80dc1537','React,Angular,Svelte','{\"facebook\":\"\",\"twitter\":\"\",\"youtube\":\"https://youtube.com/codigoconjuan\",\"instagram\":\"https://instagram.com/codigoconjuan\",\"tiktok\":\"https://tiktok.com/@codigoconjuan\",\"github\":\"https://github.com/codigoconjuan\"}'),(8,' Catarina','Pardo','Lima','Perú','9886ffc0d31e4c20a04acc1464630527','Next.js,Laravel,MERN','{\"facebook\":\"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628\",\"twitter\":\"\",\"youtube\":\"https://youtube.com/codigoconjuan\",\"instagram\":\"\",\"tiktok\":\"https://tiktok.com/@codigoconjuan\",\"github\":\"\"}'),(9,' Raquel','Ros','Madrid','España','d697f6c454c36252d70abacd7599566c','Next.js,Remix,Vue.js','{\"facebook\":\"\",\"twitter\":\"https://twitter.com/codigoconjuan\",\"youtube\":\"\",\"instagram\":\"https://instagram.com/codigoconjuan\",\"tiktok\":\"\",\"github\":\"https://github.com/codigoconjuan\"}'),(10,' Sofía','Amengual','Santiago','Chile','414ffd61380bbf0e9f45cbde4d0cbb7f','UX / UI,Figma,TailwindCSS','{\"facebook\":\"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628\",\"twitter\":\"https://twitter.com/codigoconjuan\",\"youtube\":\"https://youtube.com/codigoconjuan\",\"instagram\":\"\",\"tiktok\":\"\",\"github\":\"\"}'),(11,' María José','Leoz','NY','Estados Unidos','c8b3a77bce7a6efb6e6872db67cfa553','React,TypeScript,JavaScript','{\"facebook\":\"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628\",\"twitter\":\"https://twitter.com/codigoconjuan\",\"youtube\":\"\",\"instagram\":\"https://instagram.com/codigoconjuan\",\"tiktok\":\"\",\"github\":\"https://github.com/codigoconjuan\"}'),(12,' Alexa','Mina','Bogotá','Colombia','6eac63d88743bbb9ee0bfd8c60cf4186','HTML,CSS,React,TailwindCSS','{\"facebook\":\"\",\"twitter\":\"\",\"youtube\":\"https://youtube.com/codigoconjuan\",\"instagram\":\"https://instagram.com/codigoconjuan\",\"tiktok\":\"https://tiktok.com/@codigoconjuan\",\"github\":\"https://github.com/codigoconjuan\"}'),(13,' Jesus','López','Madrid','España','e481bca0c512f5b4d8f76ccea2548f0d','PHP,WordPress,HTML,CSS','{\"facebook\":\"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628\",\"twitter\":\"\",\"youtube\":\"https://youtube.com/codigoconjuan\",\"instagram\":\"\",\"tiktok\":\"https://tiktok.com/@codigoconjuan\",\"github\":\"\"}'),(14,' Irene ','Dávalos','CDMX','México','6727e8ee7f6c642026247fe0556d866d','Node.js,Vue.js,Angular','{\"facebook\":\"\",\"twitter\":\"https://twitter.com/codigoconjuan\",\"youtube\":\"\",\"instagram\":\"https://instagram.com/codigoconjuan\",\"tiktok\":\"\",\"github\":\"https://github.com/codigoconjuan\"}'),(15,' Brenda',' Ocampo','Santiago','Chile','40e01f5c023c7e74c9c372a8126edd97','Laravel,Next.js,GraphQL,Flutter','{\"facebook\":\"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628\",\"twitter\":\"https://twitter.com/codigoconjuan\",\"youtube\":\"https://youtube.com/codigoconjuan\",\"instagram\":\"\",\"tiktok\":\"\",\"github\":\"\"}'),(16,' Julián ','Noboa','Las Vegas','EU','6d4629dacbed2e4f5a344282ec2f4f76','iOS,Figma,REST API\'s','{\"facebook\":\"\",\"twitter\":\"\",\"youtube\":\"https://youtube.com/codigoconjuan\",\"instagram\":\"https://instagram.com/codigoconjuan\",\"tiktok\":\"https://tiktok.com/@codigoconjuan\",\"github\":\"https://github.com/codigoconjuan\"}'),(17,' Vicente ','Figueroa','CDMX','México','2a41a781d8ae8f0f7a1969c766276b08','React,Tailwind,JavaScript,TypeScript,Node','{\"facebook\":\"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628\",\"twitter\":\"https://twitter.com/codigoconjuan\",\"youtube\":\"https://youtube.com/codigoconjuan\",\"instagram\":\"\",\"tiktok\":\"\",\"github\":\"\"}'),(18,' Nico ','Fraga','Buenos Aires','Argentina','222dc6502643afa2f4a55acaecd93221','PHP,Laravel,Flutter,React Native','{\"facebook\":\"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628\",\"twitter\":\"https://twitter.com/codigoconjuan\",\"youtube\":\"https://youtube.com/codigoconjuan\",\"instagram\":\"\",\"tiktok\":\"\",\"github\":\"\"}');
/*!40000 ALTER TABLE `ponentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regalos`
--

DROP TABLE IF EXISTS `regalos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regalos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regalos`
--

LOCK TABLES `regalos` WRITE;
/*!40000 ALTER TABLE `regalos` DISABLE KEYS */;
INSERT INTO `regalos` VALUES (1,'Paquete Stickers'),(2,'Camisa Mujer - Chica'),(3,'Camisa Mujer - Mediana'),(4,'Camisa Mujer - Grande'),(5,'Camisa Mujer - XL'),(6,'Camisa Hombre - Chica'),(7,'Camisa Hombre - Mediana'),(8,'Camisa Hombre - Grande'),(9,'Camisa Hombre - XL'),(10,'Memoria USB 64GB'),(11,'USB de 128GB');
/*!40000 ALTER TABLE `regalos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros`
--

DROP TABLE IF EXISTS `registros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `paquete_id` int DEFAULT NULL,
  `pago_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `token` varchar(8) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `usuario_id` int DEFAULT NULL,
  `regalo_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuarioId` (`usuario_id`),
  KEY `paquete_id` (`paquete_id`),
  KEY `registros_regalos_FK` (`regalo_id`),
  CONSTRAINT `registros_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `registros_ibfk_2` FOREIGN KEY (`paquete_id`) REFERENCES `paquetes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `registros_regalos_FK` FOREIGN KEY (`regalo_id`) REFERENCES `regalos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros`
--

LOCK TABLES `registros` WRITE;
/*!40000 ALTER TABLE `registros` DISABLE KEYS */;
INSERT INTO `registros` VALUES (1,1,'6TL6357235141635P','429f5803',4,7),(2,2,'0FC82525AA300433H','5616deca',3,NULL),(3,3,'','2a838a98',2,NULL),(5,2,'5B8C3D1E6H9742J4M','z2a3b4c5',18,11),(6,1,'4D0E1B7C4F2537E3G','a4b5c6d7',8,3),(8,3,NULL,'c1d2e3f4',15,9),(10,2,'5C3D7E2F8G9246H3K','h1i2j3k4',19,7),(11,1,'2A3B6D4E9G8356H4M','i5j6k7l8',6,10),(12,3,NULL,'f4g5h6i7',13,4),(13,2,'7F9G1E2D8H7463K5L','j8k9l0m1',10,5),(15,3,NULL,'g7h8i9j0',14,11),(17,1,'3F5G8D2A1H9746J4N','o6p7q8r9',9,2),(18,3,NULL,'h8i9j0k1',17,6),(20,1,'7B3D4E1F2H9648K5M','q2r3s4t5',5,7),(24,2,'5D9E1F8A3H9476J2M','t8u9v0w1',12,4),(25,1,'8F2G6D3C4H9357K1L','u1v2w3x4',16,8),(27,1,'9C4D7E2F1H8365K3M','w4x5y6z7',7,4),(29,2,'6F3D1E8C4H9542J7K','x8y9z0a1',11,6),(31,3,NULL,'k1l2m3n4',21,3);
/*!40000 ALTER TABLE `registros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `apellido` varchar(60) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(60) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `confirmado` tinyint(1) DEFAULT NULL,
  `token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,' Andoni','Hernandez','andonys24@gmail.com','$2y$10$5h6mjm.OFVfGnu0Bb/jqtukqAY2RJBZZnKbgArqG1q/pbK/g6xXqi',1,'',1),(2,' Juan','Pérez','juan.perez@example.com','$2y$10$ijSPsSqbTTSQS477VEA5de3dV5HqK53WC.5EZK6zbu2C5Jkn5jWtS',1,'',0),(3,' María','García','maria.garcia@testmail.com','$2y$10$oZp1bLIqgBxQ9kosFQ3S3OZr9f67Yty31Eujs1Wq7DhgkWtDffqZm',1,'',0),(4,' Jonathan','Perez','jonathan50@gmail.com','$2y$10$BjCBi4H2m0.jWQ5kLRuIk.d40wAVzzdV3UhebXlJW8qynM/j9ZRY.',1,'',0),(5,' Andonys','Jr','mjr521250@gmail.com','$2y$10$H9XujZYpJkRJZrFcBuOwHu3PsORfk8RN5QxYcI1cqml0qvktwLHhq',1,'',0),(6,'Pedro','Ramirez','pedro@pedro.com','$2y$10$PlF5WleJpr0zuYvMOH/RoOTHlhYef3LeghTsY7gx3zF75fFZ8cjp6',1,'',0),(7,'Ana','Gonzalez','ana.gonzalez@example.com','$2y$10$3p6PSDo4XZ42STkCTw3Elue9hXUvCvEinN/vccXSs6rcYrGSIFJ2u',1,'',0),(8,'Luis','Martinez','luis.martinez@example.com','$2y$10$GD2BQYK/H4I.s/X.plidFudVsO47STeDnUm4EAKiUncEglxV1B9I6',1,'',0),(9,'Maria','Fernandez','maria.fernandez@example.com','$2y$10$GD2BQYK/H4I.s/X.plidFudVsO47STeDnUm4EAKiUncEglxV1B9I6',1,'',0),(10,'Javier','Lopez','javier.lopez@example.com','$2y$10$GD2BQYK/H4I.s/X.plidFudVsO47STeDnUm4EAKiUncEglxV1B9I6',1,'',0),(11,'Isabel','Hernandez','isabel.hernandez@example.com','$2y$10$GD2BQYK/H4I.s/X.plidFudVsO47STeDnUm4EAKiUncEglxV1B9I6',1,'',0),(12,'Carlos','García','carlos.garcia@example.com','$2y$10$GD2BQYK/H4I.s/X.plidFudVsO47STeDnUm4EAKiUncEglxV1B9I6',1,'',0),(13,'Laura','Jimenez','laura.jimenez@example.com','$2y$10$GD2BQYK/H4I.s/X.plidFudVsO47STeDnUm4EAKiUncEglxV1B9I6',1,'',0),(14,'Fernando','Ramirez','fernando.ramirez@example.com','$2y$10$GD2BQYK/H4I.s/X.plidFudVsO47STeDnUm4EAKiUncEglxV1B9I6',1,'',0),(15,'Patricia','Mendez','patricia.mendez@example.com','$2y$10$GD2BQYK/H4I.s/X.plidFudVsO47STeDnUm4EAKiUncEglxV1B9I6',1,'',0),(16,'Andres','Torres','andres.torres@example.com','$2y$10$GD2BQYK/H4I.s/X.plidFudVsO47STeDnUm4EAKiUncEglxV1B9I6',1,'',0),(17,'Beatriz','Pérez','beatriz.perez@example.com','$2y$10$GD2BQYK/H4I.s/X.plidFudVsO47STeDnUm4EAKiUncEglxV1B9I6',1,'',0),(18,'Ricardo','Castro','ricardo.castro@example.com','$2y$10$GD2BQYK/H4I.s/X.plidFudVsO47STeDnUm4EAKiUncEglxV1B9I6',1,'',0),(19,'Carmen','Sánchez','carmen.sanchez@example.com','$2y$10$GD2BQYK/H4I.s/X.plidFudVsO47STeDnUm4EAKiUncEglxV1B9I6',1,'',0),(21,'Elena','Vargas','elena.vargas@example.com','$2y$10$GD2BQYK/H4I.s/X.plidFudVsO47STeDnUm4EAKiUncEglxV1B9I6',1,'',0);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'devwebcamp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-04  4:12:47
