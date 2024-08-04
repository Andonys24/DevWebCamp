(function () {
	const ctx = document.getElementById("ingresos-grafica");
	const total = document.getElementById("total");
	

	if (ctx) {
		obtenerDatos();
		async function obtenerDatos() {
			const url = "/api/ingresos";
			const respuesta = await fetch(url);
			const resultado = await respuesta.json();

			total.textContent = `$ ${resultado.total.toFixed(2)}`;
			

			new Chart(ctx, {
				type: "bar",
				data: {
					labels: Object.keys(resultado),
					datasets: [
						{
							label: "Eventos con Menos lugares Disponibles",
							data: Object.values(resultado),
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
