import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const mapElement = document.getElementById('map');

const addMarkers = (map, markers) => {
    markers.forEach((marker) => {
        const popup = new mapboxgl.Popup({
            closeButton: false
        }).setHTML(marker.infoWindow);
        popup.options.closeButton = false;
        // Create a HTML element for your custom marker
        const element = document.createElement('div');
        element.className = 'marker';
        element.style.backgroundImage = `url('${marker.image_url}')`;
        element.style.backgroundSize = 'contain';
        element.style.width = '25px';
        element.style.height = '25px';

        new mapboxgl.Marker(element)
            .setLngLat([ marker.lng, marker.lat ])
            .setPopup(popup)
            .addTo(map);
    });
}


const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const initMapbox = () => {
    if (mapElement) {
        mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
        const map = new mapboxgl.Map({
            container: 'map',
            style: 'mapbox://styles/mapbox/streets-v11',
            zoom: 8
        });
        // Contrôle mis de côté, car utilisation de la search barre
        //map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
        //    mapboxgl: mapboxgl }));
        const markers = JSON.parse(mapElement.dataset.markers);
        if (markers.length > 0) {
            fitMapToMarkers(map, markers);
            addMarkers(map, markers);
        }
        else {
            console.log('markers vides...');
            map.flyTo({
                center: [5.40, 43],
            })
        }
    }
};

export { initMapbox };