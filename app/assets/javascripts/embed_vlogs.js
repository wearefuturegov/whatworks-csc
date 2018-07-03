$.fn.embedVlogs = function() {

  if (this.length === 0) { return false; }
  
  var $links = $(this).find('a[href^="https:\/\/www.youtube"]')
  
  $.each($links, function() {
    var link = this
    $.getJSON('https://noembed.com/embed?url=' + link.href, function(data) {
      $(link).replaceWith(data.html);
    })
  })

};
