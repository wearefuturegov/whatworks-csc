$.fn.reorderSubpages = function(childElements) {

  if (this.length === 0) { return false; }

  var $target = $(this);
  var children = $target.find(childElements).toArray();
  var subnavs = {
    'about-us': 0,
    'setting-up-the-centre': 1,
    'governance': 2,
    'meet-the-team': 3,
    'our-research-partners': 4,
    'contact-us': 5,
    'working-with': 0,
    'whos-involved': 1,
    'what-you-told-us': 2,
    'co-designing-with-partners': 3,
    'evidence': 0,
    'research': 1,
    'standard': 2,
    'outcomes-framework': 3,
    'evidence-store': 4,
    'current-research': 5,
    'published-research': 6
  }

  $.each(subnavs, function(k, v) {
    $item = $target.find(childElements +'.' + k)
    if ($item.length > 0) {
      children[v] = $item
    }

    if (k == 'current-research' || k == 'published-research') {
      $item.hide();
    }
  })

  $target.find(childElements).remove();

  $.each(children, function(){
    $target.append(this);
  });

}
