$(document).ready(function() {
  
  $('#property_form')
  .on('invalid', function () {
    var invalid_fields = $(this).find('[data-invalid]');
    console.log(invalid_fields);
  })
  .on('valid', function () {
    console.log('valid!');
  });
  
  function updateMap(){
    console.log('1');
    map.setView([$('#lat').val(), $('#lng').val()], $('#zoom').val());
    console.log('2');
  } 
  
  function createMarker(){
    updateMap();
    setMarker();
  } 
  
    
  function setMarker(){
    console.log('!!!');
    var marker = L.marker(new L.LatLng($('#lat').val(),$('#lng').val()), {
                icon: L.mapbox.marker.icon({'marker-color': 'CC0033'}),
                draggable: true
            });

      marker.bindPopup('This marker is draggable! Move it around.');
      marker.addTo(map);
  } 
  
  $('#property_country_id').change(function() {
    $.ajax({
      url: "/properties/update_regions",
      data: {
      country_id: $('#property_country_id').val()
      },
      dataType: "script",
      success : updateMap
    });
  });
  
  $('#property_region_id').change(function() {
    $.ajax({
      url: "/properties/update_places",
      data: {
      region_id: $('#property_region_id').val()
      },
      dataType: "script",
      success : updateMap
    });
  });
  
  $('#property_place_id').change(function() {
    $.ajax({
      url: "/properties/update_map",
      data: {
      place_id: $('#property_place_id').val()
      },
      dataType: "script",

      success : createMarker
    });
  });
  
    
  
  $('#bedroom-slider').on('change', function(){
    //console.log('Bedrooms');
    var v = $('#bedroom-slider').attr('data-slider');
    $('#bedrooms-input').val(v);
    var s = $('#bedrooms-input').val();
  });
  
  $('#capacity-slider').on('change', function(){
    //console.log('Bedrooms');
    var v = $('#capacity-slider').attr('data-slider');
    $('#capacity-input').val(v);
    var s = $('#capacity-input').val();
  });
  
  // display map if required
  if (document.getElementById("map")) {
    console.log('1');
    var map = L.mapbox.map('map', 'steverdrew.i8d4kj32').setView([$('#lat').val(), $('#lng').val()], $('#zoom').val());
    console.log('2');
    
  } 
  
});