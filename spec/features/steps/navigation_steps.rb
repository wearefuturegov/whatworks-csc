# frozen_string_literal: true

step 'I access the blog post index page' do
  visit '/blog'
end

step 'I access the blog post :text' do |slug|
  @slug = slug
  visit "/blog/#{@slug}"
end
