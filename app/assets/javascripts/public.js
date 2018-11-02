$(document).on('turbolinks:load', function() {
  $('#alerts').alerts();
  $('.sub_nav ul').reorderSubpages('li');
  $('.sub_pages').reorderSubpages('.single_sub_page');
  $('.blog_content').embedVlogs('.blog_content');
  $('.accordion').each(function() { $(this).accordion() });

  // var maxHeight = 0;
  // $('.collection.border .single h3').each(function(){
  //    maxHeight = $(this).height() > maxHeight ? $(this).height() : maxHeight;
  // });
  // $('section.collection.border h3').css('min-height', maxHeight);
});
