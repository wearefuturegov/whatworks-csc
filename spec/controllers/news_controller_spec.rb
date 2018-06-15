require 'rails_helper'

RSpec.describe NewsController, type: :controller, vcr: true do
    
  describe '#show' do
    it_behaves_like 'contenful controller #show', 'news', News, 'some-news-article'
  end
  
  describe '#index' do
    it_behaves_like 'contenful controller #index', 'news', News
  end
  
end
