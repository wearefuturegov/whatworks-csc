$.fn.reorderSubpages = function(childElements) {
  
  if (this.length === 0) { return false; }
  
  var $target = $(this);
  var children = $target.find(childElements).toArray();
  var subnavs = {
    'about-us': 0,
    'setting-up-the-centre': 1,
    'who-we-are': 2,
    'contact-us': 3,
    'working-with': 0,
    'whos-involved': 1,
    'what-you-told-us': 2,
    'co-designing-with-partners': 3,
    'evidence': 0,
    'research-topics': 1,
    'standard': 2,
    'outcomes-framework': 3,
    'evidence-store': 4
  }
  
  $.each(subnavs, function(k, v) {
    $item = $target.find(childElements +'.' + k)
    if ($item.length > 0) {
      children[v] = $item
    }
  })
    
  $target.find(childElements).remove();
  
  $.each(children, function(){
    $target.append(this);
  });
      
}
