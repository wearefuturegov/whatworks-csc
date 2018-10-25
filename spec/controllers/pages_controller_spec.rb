require 'rails_helper'
require 'features/steps/contentful_steps'

RSpec.describe PagesController, type: :controller, vcr: true, contentful: true, cache: true do
  include ContentfulSteps

  describe '#show' do
    let(:page) { create_page('some-page') }
    let(:slug) { page.slug }
            
    it 'gets a page' do
      get :show, params: { section_id: page.section.slug, id: page.slug }
      expect(assigns(:page)).to be_a(Page)
      expect(assigns(:page).title).to eq(page.title)
    end
    
    context 'when page is research topics' do
      let(:page) { create_page('research-topics') }
      let!(:research_reports) { Array.new(2) { create_research_report } }
      
      it 'gets reports' do
        get :show, params: { section_id: page.section.slug, id: page.slug }
        expect(assigns(:research_reports).to_a).to match_array(research_reports)
      end
    end
    
    context 'when page is co-designing with partners' do
      let(:page) { create_page('co-designing-with-partners') }
      let!(:prototypes) { Array.new(3) { create_prototype } }
      
      it 'gets prototypes' do
        get :show, params: { section_id: page.section.slug, id: page.slug }
        expect(assigns(:prototypes).to_a).to match_array(prototypes)
      end
    end
  end
end
