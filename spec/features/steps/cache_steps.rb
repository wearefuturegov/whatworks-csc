module CacheSteps

  def cache_data
    Rails.cache.instance_variable_get(:@data)
  end

  def cache_data_for(path)
    cache_data[path]
  end

  step 'the data for the blog post index page should be cached' do
    expect(cache_data_for('views/www.example.com/blog')).to_not be_nil
  end
  
  step 'the data for the blog post \':text\' should be cached' do |slug|
    expect(cache_data_for("views/www.example.com/blog/#{slug}")).to_not be_nil
  end
  
  step 'the data for the blog post \':text\' is cached' do |slug|
    visit '/blog'
    visit "/blog/#{slug}"
  end
  
  step 'I update my the blog post \':text\'' do |slug|
    @slug = slug
    rack_test_session_wrapper = Capybara.current_session.driver
    rack_test_session_wrapper.header('X-Contentful-Topic', 'ContentManagement.Entry.publish')
    rack_test_session_wrapper.submit :post, '/expire_cache', {
      sys: {
        contentType: {
          sys: {
            id: 'blogPost'
          }
        }
      },
      fields: {
        slug: {
          foo: slug
        }
      }
    }
  end
  
  step 'the cache should be cleared' do
    expect(cache_data_for('views/www.example.com/blog')).to be_nil
    expect(cache_data_for("views/www.example.com/blog/#{@slug}")).to be_nil
  end

end

RSpec.configure do |config|
  config.include CacheSteps
end
