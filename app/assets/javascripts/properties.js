$(document).ready(function() {
  
  //=============================================================
  // TODO MORE : Form State
  //=============================================================
  
  $('#property_name').change(function() {
    $("#cancel").attr("data-reveal-id","unsaved-modal");
  });
  $('#property_name').change(function() {
    $("#cancel").attr("data-reveal-id","unsaved-modal");
  });
  
  //=============================================================
  // Promo Image Update
  //=============================================================
  $('#promo-image-upload').change(function() {
    var e = document.getElementById("promo-upload-form");
    console.log(e.id);
    
    $("#promo-upload-form").submit();
    console.log('complete');
    this.disabled = true;
     $("#overlay").fadeIn();  
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
    console.log('valid!!!!');
  });
  
  //=============================================================
  // Map functions
  //=============================================================
  
  function updateMap()
  {
    var v = $('#lat').val();
    if(v){
      map.setView([$('#lat').val(), $('#lng').val()], $('#zoom').val());
    }   
  } 
  
  function createMarker()
  {
    updateMap();
    setMarker();
  } 
  
    
  function setMarker()
  {
    var marker = L.marker(new L.LatLng($('#lat').val(),$('#lng').val()), {
                icon: L.mapbox.marker.icon({'marker-size': 'large','marker-color': 'CC0033'}),
      draggable: true
            });
      
      marker.bindPopup('This marker is draggable! Move it around.');
      marker.addTo(map);
     
    // track where the marker is dragged to
      marker.on('dragend', function(e){
        $('#lat').val(e.target._latlng.lat);
        $('#lng').val(e.target._latlng.lng);       
      });
      
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
  
  //Update intitial values
  $('#bedroom-slider').attr('data-slider',$('#bedroom-input').val());
  $('#capacity-slider').attr('data-slider',$('#capacity-input').val()); 
  
  $('#bedroom-slider').on('change', function(){
    var v = $('#bedroom-slider').attr('data-slider');
    $('#bedroom-input').val(v);
  });
  
  $('#capacity-slider').on('change', function(){
    var v = $('#capacity-slider').attr('data-slider');
    $('#capacity-input').val(v);
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
    var map = L.mapbox.map('edit-property-map', 'steverdrew.i8d4kj32').setView([$('#lat').val(), $('#lng').val()],         $('#zoom').val());
    createMarker();
  }
  
  
  
});



