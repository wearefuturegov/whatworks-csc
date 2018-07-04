$.fn.embedVlogs = function() {

  if (this.length === 0) { return false; }
  
  var $links = $(this).find('a[href^="https:\/\/www.youtube"]')
  
  var getId = function(url){
    var regExp = /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/;
    var match = url.match(regExp);
    return (match&&match[7].length==11)? match[7] : false;
  }
  
  $.each($links, function() {
    var id = getId(this.href)
    var $iframe = $('<iframe>', {
      src: 'https://www.youtube.com/embed/'+ id +'?feature=oembed',
      width: '100%',
      height: '56.25vw',
      allowfullscreen: 'allowfullscreen',
      frameborder: 0
    })
    
    $(this).replaceWith($iframe);
  })

};
