$(document).ready(function() {
  
  var item = sessionStorage.getItem('sub-menu-item'); 
  if(item){                                   
    console.log(item);
    $('#'+item).click();
    sessionStorage.setItem('sub-menu-item',null); 
  }
  else{
    $('#general_link').click();
  }
  

  
  
  //=============================================================
  //Form update
  //=============================================================
  $('#promo_image_upload').on('change', function () {
    $('#promo_image_form').submit();
    $('#overlay').fadeIn();
  });
  
   $('#property_name').on('change', function () {
    document.getElementById('edit_submit_button').disabled = false;
  });

  $('#property_property_type_id').on('change', function () {
    document.getElementById('edit_submit_button').disabled = false;
  });

  $('#property_bedrooms').on('change', function () {
    document.getElementById('edit_submit_button').disabled = false;
  });

  $('#property_capacity').on('change', function () {
    document.getElementById('edit_submit_button').disabled = false;
  });
  
  $('#property_description').on('change', function () {
    document.getElementById('edit_submit_button').disabled = false;
  });
  
  $('#property_sumary').on('change', function () {
    document.getElementById('edit_submit_button').disabled = false;
  });
  
  
  //===========================================
  //Assets
  //===========================================
  
  $('#asset_upload').on('change', function () {
    document.getElementById('asset_upload_submit').disabled = false;
  });
  
  $('#property_description').on('change', function () {
    document.getElementById('edit_submit_button').disabled = false;
  });
  
  $('#asset_upload_submit').on('click', function () {
    $('#overlay').fadeIn();
    sessionStorage.setItem('sub-menu-item','assets_link');
    
  });
  
  
    
  $(document).on('click', 'span', function () {
    alert(this.id);
  });
    
  
});

