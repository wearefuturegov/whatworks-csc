$(document).on('turbolinks:load', function() {
  $('#alerts').alerts();
  $('.sub_nav ul').reorderSubpages('li');
  $('.sub_pages').reorderSubpages('.single_sub_page');
  $('.blog_content').embedVlogs('.blog_content');
  $('.accordion').each(function() { $(this).accordion() });
});
