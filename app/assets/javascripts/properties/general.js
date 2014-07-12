$(document).ready(function() {
  
  //=============================================================
  //Check form for errors - foundation abide
  //=============================================================
 
  $('#property_form').on('invalid', function () {
    var invalid_fields = $(this).find('[data-invalid]');
    console.log(invalid_fields);
  })
  .on('valid', function () {
    console.log('valid');
  });
  
  
 
  
    
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
    console.log(v);
    
  });
  
  $('#capacity-slider').on('change', function(){
    var v = $('#capacity-slider').attr('data-slider');
    $('#capacity-input').val(v);
    console.log(v);
  });
  
  $("#promo-image-upload").on("click", function() {
    //console.log('and again!');
  });
    
  $("#promo-image-upload").on("change", function() {
    var e = document.getElementById("promo-upload-form");
    //$(e).submit();
    //$("#overlay").fadeIn();  
  });
  
  
  
  //=============================================================
  // General Section Update
  //=============================================================
  $('#property_name').change(function() {
    //var e = document.getElementById("general-form");
    //$('#general_form').submit();
    //console.log('!!!!!');
  });
  $('#property_property_type_id').change(function() {
    //$('#general_form').submit();
    //console.log('!!!!!');
  });
  $('#property_description').change(function() {
    //$('#general_form').submit();
    //console.log('!!!!!');
  });
  

});



