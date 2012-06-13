function showFlashNotice() {
  var notification = new InfoNotification();
  notification.setMessage("<%= alert || notice %>");
  notification.show();
}

if (window.attachEvent) {
  window.attachEvent('onload', showFlashNotice);
} else {
  window.addEventListener('load', showFlashNotice, false);
}

$(function() {
  setTimeout(function() {
    $('#flash:visible').slideUp();
  }, 3000);
});

$('a.hack-on-twetter').click(function() {
  $('textarea#status').val('@ben_h ');
  $('textarea#status').focus();
  return false;
});
