if (document.querySelector("#mapa")) {
	// 14.087517, -87.188949
	const lat = 14.087517;
	const lng = -87.188949;
	const zoom = 16;

	const map = L.map("mapa").setView([lat, lng], zoom);

	L.tileLayer("https://tile.openstreetmap.org/{z}/{x}/{y}.png", {
		attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
	}).addTo(map);

	L.marker([lat, lng])
		.addTo(map)
		.bindPopup(
			`
        <h2 class="mapa__heading">DevWebCamp</h2>
        <p class="mapa__texto">Bo. Universidad Metropolitana de Honduras</p>
        `
		)
		.openPopup();
}
