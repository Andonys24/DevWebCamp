import Swal from "sweetalert2";

(function () {
	let eventos = [];

	const eventosBtn = document.querySelectorAll(".evento__agregar");
	const resumen = document.querySelector("#registro-resumen");

	if (resumen) {
		eventosBtn.forEach((boton) => boton.addEventListener("click", seleccionarEvento));

		const formularioRegistro = document.querySelector("#registro");
		formularioRegistro.addEventListener("submit", submitFormulario);

		mostrarEventos();

		function seleccionarEvento({ target }) {
			if (eventos.length < 5) {
				// Deshabilitar el evento seleccionado
				target.disabled = true;

				eventos = [
					...eventos,
					{
						id: target.dataset.id,
						titulo: target.parentElement.querySelector(".evento__nombre").textContent.trim(),
						btn: target.textContent,
					},
				];

				target.textContent = "Seleccionado";
			} else {
				Swal.fire({
					icon: "error",
					title: "Error...",
					text: "Solo puedes seleccionar hasta 5 eventos",
					confirmButtonText: "Ok",
					customClass: {
						popup: "swal2-popup",
						title: "swal2-title",
						text: "swal2-text",
					},
				});
			}

			mostrarEventos();
		}

		function mostrarEventos() {
			// Limpiar el HTML previo
			limpiarEventos();
			if (eventos.length > 0) {
				eventos.forEach((eventos) => {
					const eventoDOM = document.createElement("div");
					eventoDOM.classList.add("registro__evento");

					const titulo = document.createElement("h3");
					titulo.classList.add("registro__nombre");
					titulo.textContent = eventos.titulo;

					const btnEliminar = document.createElement("button");
					btnEliminar.classList.add("registro__eliminar");
					btnEliminar.innerHTML = `<i class="fa-solid fa-trash"></i>`;
					btnEliminar.onclick = function () {
						eliminarEvento(eventos.id);
					};

					// Renderizar en el HTML
					eventoDOM.appendChild(titulo);
					eventoDOM.appendChild(btnEliminar);
					resumen.appendChild(eventoDOM);
				});
			} else {
				const noRegistro = document.createElement("p");
				noRegistro.textContent = "No hay eventos seleccionados, Puedes seleccionar hasta 5 eventos";
				noRegistro.classList.add("registro__texto");
				resumen.appendChild(noRegistro);
			}
		}

		function eliminarEvento(id) {
			const evento = eventos.find((evento) => evento.id === id);
			eventos = eventos.filter((evento) => evento.id !== id);

			const btnAgregar = document.querySelector(`[data-id="${id}"]`);
			btnAgregar.disabled = false;
			btnAgregar.textContent = evento.btn;

			Swal.fire({
				position: "top-end",
				icon: "success",
				title: "Evento eliminado",
				showConfirmButton: false,
				timer: 1500,
				customClass: {
					popup: "swal2-popup",
					title: "swal2-title",
					text: "swal2-text",
				},
			});

			// Mostrar el contenido original del boton antes de cambiarlo a seleccionado
			mostrarEventos();
		}

		function limpiarEventos() {
			while (resumen.firstChild) {
				resumen.removeChild(resumen.firstChild);
			}
		}

		async function submitFormulario(e) {
			e.preventDefault();

			// Obtener el regalo
			const regaloId = document.querySelector("#regalo").value;

			const eventosId = eventos.map((evento) => evento.id);

			if (eventosId.length === 0 || regaloId === "") {
				Swal.fire({
					icon: "error",
					title: "Error...",
					text: "Elige almenos un evento y un regalo",
					confirmButtonText: "Ok",
					customClass: {
						popup: "swal2-popup",
						title: "swal2-title",
						text: "swal2-text",
					},
				});
				return;
			}

			// Objeto de FormData
			const datos = new FormData();
			datos.append("eventos", eventosId);
			datos.append("regalo_id", regaloId);

			const url = "/finalizar-registro/conferencias";
			const respuesta = await fetch(url, {
				method: "POST",
				body: datos,
			});
			const resultado = await respuesta.json();
			if (resultado.resultado) {
				Swal.fire({
					title: "Accion completada",
					text: resultado.mensaje,
					icon: "success",
					confirmButtonText: "Ok",
				}).then(() => (location.href = `/boleto?id=${resultado.token}`));
			} else {
				Swal.fire({
					title: "Error",
					text: resultado.mensaje,
					icon: "error",
					confirmButtonText: "Ok",
				}).then(() => locacion.reload());
			}
		}
	}
})();
