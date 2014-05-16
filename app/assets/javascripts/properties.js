
$(document).ready(function() {
    
   $('#property_country_id').change(function() {
    $.ajax({
      url: "/properties/update_regions",
      data: {
      country_id: $('#property_country_id').val()
      },
      dataType: "script"
    });
  });
  
  $('#property_region_id').change(function() {
    $.ajax({
      url: "/properties/update_places",
      data: {
      region_id: $('#property_region_id').val()
      },
      dataType: "script"
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
  
});