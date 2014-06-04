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
  $('#name').on('change', function () {
    document.getElementById('general_submit_button').disabled = false;
  });
  
  $('#email').on('change', function () {
    document.getElementById('email_submit_button').disabled = false;
  });
  
  $('#new_password').on('change', function () {
    document.getElementById('password_submit_button').disabled = false;
  });
  
  
});