require 'rails_helper'

RSpec.describe WhoWeAreController, type: :controller, vcr: true, contentful: true, cache: true do
  describe '#show' do
    let(:page) { Page.create(title: 'Who we are', slug: 'who-we-are', content: 'Blah').publish }
    let(:slug) { page.slug }
            
    it 'gets the correct page' do
      get :show
      expect(assigns(:page)).to be_a(Page)
      expect(assigns(:page).title).to eq('Who we are')
    end
  end
end
