(function () {
	const tagsInput = document.getElementById("tags_input");

	if (tagsInput) {
		const tagsDiv = document.getElementById("tags");
		const tagsInputHidden = document.querySelector("[name='tags']");
		let tags = new Set();

		tagsInput.addEventListener("keypress", guardarTag);

		function guardarTag(e) {
			if (e.key === ",") {
				if (e.target.value.trim() === "" || e.target.value < 1) {
					return;
				}

				e.preventDefault();

				const newTags = e.target.value.split(", ").filter((tag) => tag.trim() !== "");

				newTags.forEach((tag) => {
					const formattedTag = tag.charAt(0).toUpperCase() + tag.slice(1).toLowerCase();
					tags.add(formattedTag);
				});

				tagsInput.value = "";

				mostrarTags();
				actualizarInputHidden();
			}
		}

		function mostrarTags() {
			tagsDiv.textContent = "";

			tags.forEach((tag) => {
				const etiqueta = document.createElement("li");
				etiqueta.classList.add("formulario__tag");
				etiqueta.textContent = tag;
				etiqueta.ondblclick = eliminatag;
				tagsDiv.appendChild(etiqueta);
			});

			actualizarInputHidden();
		}

		function actualizarInputHidden() {
			tagsInputHidden.value = Array.from(tags).toString();
		}

		function eliminatag(e) {
			const tag = e.target.textContent;
			tags.delete(tag);
			mostrarTags();
		}
	}
})();
