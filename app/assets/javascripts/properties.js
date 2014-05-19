$(document).ready(function() {
  
  //=============================================================
  // Form State
  //=============================================================
  
  $('#property_name').change(function() {
    console.log('test1');
    $("#cancel").attr("data-reveal-id","unsaved-modal");
  });
  
  //=============================================================
  //Check form for errors
  //=============================================================
  
  $('#property_form')
  .on('invalid', function () {
    var invalid_fields = $(this).find('[data-invalid]');
    console.log(invalid_fields);
  })
  .on('valid', function () {
    console.log('valid!');
  });
  
  //=============================================================
  // Map functions
  //=============================================================
  
  function updateMap(){
    map.setView([$('#lat').val(), $('#lng').val()], $('#zoom').val());
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

      marker.addTo(map);
  } 
  
  //=============================================================
  // Geo Dropdowns
  //=============================================================
  
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
  
  //=============================================================
  // Sliders
  //=============================================================
  
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
  
  //=============================================================
  // Maps
  //=============================================================
  
  // New Property
  if (document.getElementById("new-property-map")) {
    var map = L.mapbox.map('new-property-map', 'steverdrew.i8d4kj32').setView([$('#lat').val(), $('#lng').val()],           $('#zoom').val());
  }

  // Edit Property
  if (document.getElementById("edit-property-map")) {
    var map = L.mapbox.map('edit-property-map', 'steverdrew.i8d4kj32').setView([$('#lat').val(), $('#lng').val()], $('#zoom').val());
  }
  
});


