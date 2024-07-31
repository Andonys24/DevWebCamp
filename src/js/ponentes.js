(function () {
	const ponentesInput = document.getElementById("ponentes");

	if (ponentesInput) {
		let ponentes = [];
		let ponentesFiltrados = [];

		const listadoPonentes = document.getElementById("listado-ponentes");
		const ponenteHidden = document.querySelector("[name='ponente_id']");
		obtenerPonentes();

		ponentesInput.addEventListener("input", buscarPonente);

		async function obtenerPonentes() {
			const url = "/api/ponentes";
			const respuesta = await fetch(url);
			const resultado = await respuesta.json();

			formatearPonentes(resultado);
		}

		function formatearPonentes(arrayPonentes = []) {
			ponentes = arrayPonentes.map((ponente) => {
				return {
					nombre: `${ponente.nombre.trim()} ${ponente.apellido.trim()}`,
					id: ponente.id,
				};
			});
		}

		function buscarPonente(e) {
			const busqueda = e.target.value;

			if (busqueda.length > 3) {
				const expresion = new RegExp(busqueda, "i"); // i -> insensible a mayúsculas y minúsculas

				ponentesFiltrados = ponentes.filter((ponente) => {
					const nombreSinAcentos = removerAcentos(ponente.nombre.toLowerCase());
					if (nombreSinAcentos.search(expresion) !== -1) {
						return ponente;
					}
				});
			} else {
				ponentesFiltrados = [];
			}
			mostrarPonentes();
		}

		function removerAcentos(texto) {
			return texto.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
		}

		function mostrarPonentes() {
			while (listadoPonentes.firstChild) {
				listadoPonentes.removeChild(listadoPonentes.firstChild);
			}

			if (ponentesFiltrados.length > 0) {
				ponentesFiltrados.forEach((ponente) => {
					const ponenteHTML = document.createElement("li");
					ponenteHTML.classList.add("listado-ponentes__ponente");
					ponenteHTML.textContent = ponente.nombre;
					ponenteHTML.dataset.ponenteId = ponente.id;
					ponenteHTML.onclick = seleccionaPonente;

					// agregar al DOM
					listadoPonentes.appendChild(ponenteHTML);
				});
			} else {
				const noResultado = document.createElement("p");
				noResultado.classList.add("listado-ponentes__no-resultado");
				noResultado.textContent = "No hay resultados";
				listadoPonentes.appendChild(noResultado);
			}
		}

		function seleccionaPonente(e) {
			const ponente = e.target;
			// Remover la clase previa
			const ponentePrevio = document.querySelector(".listado-ponentes__ponente--seleccionado");
			if (ponentePrevio) {
				ponentePrevio.classList.remove("listado-ponentes__ponente--seleccionado");
			}
			ponente.classList.add("listado-ponentes__ponente--seleccionado");

			ponenteHidden.value = ponente.dataset.ponenteId;
		}
	}
})();
