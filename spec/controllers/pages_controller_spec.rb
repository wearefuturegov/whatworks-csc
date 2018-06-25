require 'rails_helper'

RSpec.describe PagesController, type: :controller, vcr: true, contenful: true do
  describe '#show' do
    let(:section) { Section.create(title: 'Some section', slug: 'some-section', content: 'Blah').publish }
    let(:page) { Page.create(title: 'Some page', slug: 'some-page', content: 'Blah', section: Section.find(section.id)).publish }
    let(:slug) { page.slug }
            
    it 'gets a page' do
      get :show, params: { section_id: section.slug, id: page.slug }
      expect(assigns(:page)).to be_a(Page)
      expect(assigns(:page).title).to eq('Some page')
    end
  end
end
