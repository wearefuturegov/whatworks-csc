# frozen_string_literal: true

step 'I access the blog post index page' do
  visit blog_posts_path
end

step 'I access the blog post :text' do |slug|
  @slug = slug
  visit blog_post_path(@slug)
end
