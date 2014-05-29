$(document).ready(function() {
  $('#general_link').click();
  
  
  //=============================================================
  //Form update
  //=============================================================
  $('#avatar_upload').on('change', function () {
    console.log('111');
    $('#avatar_form').submit();
    $('#overlay').fadeIn();
  });
  
});