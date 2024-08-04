(function () {
	const ctx = document.getElementById("menos_disponibles-grafica");
	const ctx2 = document.getElementById("mas_disponibles-grafica");
	const totalEventos = document.getElementById("total-eventos");

	if (ctx && ctx2) {
		obtenerDatos();
		async function obtenerDatos() {
			const url = "/api/eventos";
			const respuesta = await fetch(url);
			const resultado = await respuesta.json();
			

			const menosEventos = resultado.menos_disponibles;
			const masEventos = resultado.mas_disponibles;
			totalEventos.textContent = resultado.total;

			new Chart(ctx, {
				type: "bar",
				data: {
					labels: menosEventos.map((evento) => evento.nombre),
					datasets: [
						{
							label: "Eventos con Menos lugares Disponibles",
							data: menosEventos.map((evento) => evento.disponibles),
							backgroundColor: [
								"#ea580c",
								"#84cc16",
								"#22d3ee",
								"#a855f7",
								"#ef4444",
								"#14b8a6",
								"#db2777",
								"#e11d48",
								"#7e22ce",
							],
							borderWidth: 1,
						},
					],
				},
				options: {
					scales: {
						y: {
							beginAtZero: true,
						},
					},
					plugins: {
						legend: {
							display: false,
						},
					},
				},
			});

			new Chart(ctx2, {
				type: "bar",
				data: {
					labels: masEventos.map((evento) => evento.nombre),
					datasets: [
						{
							label: "Eventos con Menos lugares Disponibles",
							data: masEventos.map((evento) => evento.disponibles),
							backgroundColor: [
								"#ea580c",
								"#84cc16",
								"#22d3ee",
								"#a855f7",
								"#ef4444",
								"#14b8a6",
								"#db2777",
								"#e11d48",
								"#7e22ce",
							],
							borderWidth: 1,
						},
					],
				},
				options: {
					scales: {
						y: {
							beginAtZero: true,
						},
					},
					plugins: {
						legend: {
							display: false,
						},
					},
				},
			});
		}
	}
})();
