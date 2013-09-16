$('.tweet-image').livequery(function() {
  var tweetImageWrapper = $(this).find('.tweet-image-wrapper'),
      tweetToggle = $(this).find('.tweet-image-toggle');

  tweetToggle.click(function() {
    tweetImageWrapper.toggle()
  });
});

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
