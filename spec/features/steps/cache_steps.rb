# frozen_string_literal: true

module CacheSteps
  def cache_data
    Rails.cache.instance_variable_get(:@data)
  end

  def cache_data_for(path)
    cache_data[path]
  end
  
  def get_topic(method)
    {
      'update' => 'ContentManagement.Entry.publish',
      'delete' => 'ContentManagement.Entry.delete',
      'unpublish' => 'ContentManagement.Entry.unpublish',
      'save' => 'ContentManagement.Entry.save'
    }[method]
  end

  step 'the data for the blog post index page should be cached' do
    expect(cache_data_for('views/www.example.com/whats-new')).to_not be_nil
  end

  step 'the data for the blog post :text should be cached' do |slug|
    expect(cache_data_for("views/www.example.com/whats-new/blog/#{slug}")).to_not be_nil
  end

  step 'the data for the blog post :text is cached' do |slug|
    visit blog_posts_path
    visit blog_post_path(slug)
  end
  
  step 'the data for the page is cached' do
    visit section_page_path(@page.section.slug, @page.slug)
  end
  
  step 'the index cache should be left alone' do
    # We're not actually testing anything here, this step is just here for
    # readability
  end

  step 'I :text my :text :text' do |method, content_type, slug|
    @slug = slug
    rack_test_session_wrapper = Capybara.current_session.driver
    rack_test_session_wrapper.header('X-Contentful-Topic', get_topic(method))
    rack_test_session_wrapper.submit :post, '/expire_cache',
                                     sys: {
                                       contentType: {
                                         sys: {
                                           id: content_type.camelize
                                         }
                                       }
                                     },
                                     fields: {
                                       slug: {
                                         foo: slug
                                       }
                                     }
  end

  step 'the cache should be cleared' do
    expect(cache_data_for('views/www.example.com/whats-new')).to be_nil
    expect(cache_data_for("views/www.example.com/whats-new/blog/#{@slug}")).to be_nil
  end
  
  step 'the cache should not be cleared' do
    expect(cache_data_for('views/www.example.com/whats-new')).to_not be_nil
    expect(cache_data_for("views/www.example.com/whats-new/blog/#{@slug}")).to_not be_nil
  end
  
  step 'the content should not be cached' do
    expect(cache_data_for("views/www.example.com/whats-new/blog/#{@slug}")).to be_nil
  end
end

RSpec.configure do |config|
  config.include CacheSteps
end
