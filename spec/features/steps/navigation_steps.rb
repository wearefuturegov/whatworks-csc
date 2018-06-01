step 'I access the blog post index page' do
  visit '/blog'
end

step 'I access the blog post \':text\'' do |slug|
  visit "/blog/#{slug}"
end
