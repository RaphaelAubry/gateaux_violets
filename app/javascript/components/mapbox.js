const initMapBox = () => {

  const map = document.getElementById("map")

  if (map !=null){

    const GateauVioletCoord = [7.255857425272438, 43.70396954971656]

    mapboxgl.accessToken = process.env.MAPBOX_API_KEY;
    const map = new mapboxgl.Map({
      container: 'map', // container ID
      style: 'mapbox://styles/raphaelaubry/ckysqyrs76zzn14tfc3s3rw33', // style URL
      center: GateauVioletCoord, // starting position [lng, lat]
      zoom: 11, // starting zoom
      attributionControl: false
    });

    map.addControl(new mapboxgl.FullscreenControl());

    const marker = new mapboxgl.Marker({
      color: '#3A1678'
    })
      .setLngLat(GateauVioletCoord)
      .addTo(map);

  }
}



export { initMapBox }