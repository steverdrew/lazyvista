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
  
  //=============================================================
  //Form update
  //=============================================================
  $('#email').on('change', function () {
    document.getElementById('edit_submit_button').disabled = false;
  });
  
});