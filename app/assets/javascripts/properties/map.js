$(document).ready(function() {
 
  var CLIENT_ID = 'LPJDOEJG40K4CNF2WL5Q3F12PUVJ01BPBVCE2QYR14Z41OKX';
  var CLIENT_SECRET = '11V332DGYUQYEYJLRM03CDYVFV5EZVN2XA4KTPO0YTR5UUQW';
    
  
  //=============================================================
  // Maps
  //=============================================================
  
  // New Property
  if (document.getElementById("new_property_map")) {
    var map = L.mapbox.map('new_property_map', 'steverdrew.i8d4kj32').setView([$('#lat').val(), $('#lng').val()], $('#zoom').val());
  }

  // Edit Property
    
  if (document.getElementById("edit_property_map")) {
    var editMap = L.mapbox.map('edit_property_map', 'steverdrew.i8d4kj32').setView([$('#lat').val(), $('#lng').val()], $('#zoom').val());
    console.log('map');
    createMarker(editMap, true);
  }

  // Show & Preview Property
    
  if (document.getElementById("preview_property_map")) {
    var previewMap = L.mapbox.map('preview_property_map', 'steverdrew.i8d4kj32', {
  zoomControl: false
}).setView([$('#lat').val(), $('#lng').val()], $('#zoom').val());
    createMarker(previewMap,false);
  }

  if (document.getElementById("show_property_map")) {
    var showMap = L.mapbox.map('show_property_map', 'steverdrew.i8d4kj32').setView([$('#lat').val(), $('#lng').val()], $('#zoom').val());
    console.log('show-map');
    createMarker(showMap, false);
    getFoursquarePlaces(showMap);
  }

  
  //=============================================================
  // Foursquare functions
  //=============================================================
  
 
  function getFoursquarePlaces(map){
    

    populateMap(map, 'coffee');
    
    var json = $.getJSON("test.json",  
   function(response, status, jqXHR){
           // do stuff
           console.log(jqXHR.responseText);
       }
);

    
  }
  
  function populateMap(map, amenity){
    
    var API_ENDPOINT = 'https://api.foursquare.com/v2/venues/search' +
    '?client_id=CLIENT_ID' +
    '&client_secret=CLIENT_SECRET' +
    '&v=20130815' +
    '&ll=LATLON' +
    '&query=' + amenity +
    '&callback=?';
    
    console.log(amenity);
    // Keep our place markers organized in a nice group.
    var foursquarePlaces = L.layerGroup().addTo(map);
    
    
    $.getJSON(API_ENDPOINT
    .replace('CLIENT_ID', CLIENT_ID)
    .replace('CLIENT_SECRET', CLIENT_SECRET)
    .replace('LATLON', map.getCenter().lat +
        ',' + map.getCenter().lng), function(result, status) {

      if (status !== 'success') return alert('Request to Foursquare failed');

      // Transform each venue result into a marker on the map.
      for (var i = 0; i < result.response.venues.length; i++) {
        var venue = result.response.venues[i];
        var latlng = L.latLng(venue.location.lat, venue.location.lng);
        var marker = L.marker(latlng, {
            icon: L.mapbox.marker.icon({
              'marker-color': '#BE9A6B',
              'marker-symbol': 'cafe',
              'marker-size': 'large'
            })
          })
        .bindPopup('<strong><a href="https://foursquare.com/v/' + venue.id + '">' +
          venue.name + '</a></strong>')
          .addTo(foursquarePlaces);
    }

  });
  }
  
  //=============================================================
  // Map functions
  //=============================================================
  
  function updateMap(map){
    var v = $('#lat').val();
    if(v){
      map.setView([$('#lat').val(), $('#lng').val()], $('#zoom').val());
    }   
  } 
  
  function createMarker(map, draggable)
  {
    updateMap(map);
    setMarker(map, draggable);
  } 
  
    
  function setMarker(map, draggable)
  {
    var marker = L.marker(new L.LatLng($('#lat').val(),$('#lng').val()), {
                icon: L.mapbox.marker.icon({'marker-size': 'large','marker-color': 'CC0033'}),
      draggable: draggable
            });
      
      marker.bindPopup('This marker is draggable! Move it around.');
      marker.addTo(map);
     
    // track where the marker is dragged to
      marker.on('dragend', function(e){
        $('#lat').val(e.target._latlng.lat);
        $('#lng').val(e.target._latlng.lng);
        $("#location_form").submit();
      });
      
  }
 });