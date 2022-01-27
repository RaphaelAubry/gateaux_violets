const initMapBox = () => {

  const map = document.getElementById("map")

  if (map !=null){

    mapboxgl.accessToken = process.env.MAPBOX_API_KEY;
    const map = new mapboxgl.Map({
      container: 'map', // container ID
      style: 'mapbox://styles/raphaelaubry/ckysqyrs76zzn14tfc3s3rw33', // style URL
      center: [-74.5, 40], // starting position [lng, lat]
      zoom: 15, // starting zoom
      attributionControl: false
    });

    map.addControl(new mapboxgl.FullscreenControl());
  }
}


export { initMapBox }
