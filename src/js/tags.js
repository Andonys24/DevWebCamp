/**
 * Este módulo maneja la funcionalidad de gestionar etiquetas en un campo de entrada.
 * Escucha los cambios en el campo de entrada, almacena las etiquetas en un conjunto y actualiza la interfaz de usuario en consecuencia.
 */
(function () {
	// Obtener el elemento de entrada de etiquetas
	const tagsInput = document.getElementById("tags_input");

	if (tagsInput) {
		// Obtener el elemento contenedor de etiquetas y el campo de entrada oculto para almacenar las etiquetas
		const tagsDiv = document.getElementById("tags");
		const tagsInputHidden = document.querySelector("[name='tags']");

		// Crear un conjunto para almacenar las etiquetas
		let tags = new Set();

		// Escuchar eventos de pulsación de teclas en el campo de entrada de etiquetas
		tagsInput.addEventListener("keypress", guardarTag);

		/**
		 * Función para manejar el guardado de una etiqueta cuando el usuario presiona la tecla de coma (código de tecla 44)
		 * @param {KeyboardEvent} e - El objeto de evento de pulsación de tecla
		 */
		function guardarTag(e) {
			if (e.keyCode === 44) {
				// Verificar si el valor de entrada está vacío o tiene menos de 1 caracter
				if (e.target.value.trim() === "" || e.target.value < 1) {
					return;
				}

				e.preventDefault();

				// Dividir el valor de entrada por comas y filtrar cualquier etiqueta vacía
				const newTags = e.target.value.split(",").filter((tag) => tag.trim() !== "");

				// Formatear cada etiqueta capitalizando la primera letra y convirtiendo el resto en minúsculas
				newTags.forEach((tag) => {
					const formattedTag = tag.charAt(0).toUpperCase() + tag.slice(1).toLowerCase();
					tags.add(formattedTag);
				});

				// Limpiar el campo de entrada
				tagsInput.value = "";

				// Actualizar la interfaz de usuario para mostrar las etiquetas
				mostrarTags();
			}
		}

		/**
		 * Función para mostrar las etiquetas en la interfaz de usuario
		 */
		function mostrarTags() {
			// Limpiar el contenedor de etiquetas
			tagsDiv.textContent = "";

			// Crear un elemento de lista para cada etiqueta y agregarlo al contenedor de etiquetas
			tags.forEach((tag) => {
				const etiqueta = document.createElement("li");
				etiqueta.classList.add("formulario__tag");
				etiqueta.textContent = tag;
				etiqueta.ondblclick = eliminatag;
				tagsDiv.appendChild(etiqueta);
			});

			// Actualizar el campo de entrada oculto con las etiquetas
			actualizarInputHidden();
		}

		/**
		 * Función para actualizar el campo de entrada oculto con las etiquetas
		 */
		function actualizarInputHidden() {
			tagsInputHidden.value = Array.from(tags).toString();
		}

		/**
		 * Función para manejar la eliminación de una etiqueta cuando se hace doble clic
		 * @param {MouseEvent} e - El objeto de evento de doble clic
		 */
		function eliminatag(e) {
			const tag = e.target.textContent;
			tags.delete(tag);
			console.log(tags);
			mostrarTags();
		}
	}
})();
