step 'I visit the preview link for the blog post :text' do |slug|
  @slug = slug
  visit "/blog/#{@slug}?preview_token=#{ENV['PREVIEW_TOKEN']}"
end

step 'I should see the draft content' do
  expect(a_request(:get, /preview.contentful.com/)).to have_been_made.at_least_once
end
