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
    map.setView([$('#lat').val(), $('#lng').val()], 9);
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
    var map = L.mapbox.map('map', 'steverdrew.i8d4kj32').setView([$('#lat').val(), $('#lng').val()], $('#zoom').val());
  } 
  
});