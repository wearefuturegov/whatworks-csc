require 'rails_helper'

RSpec.describe SectionsController, type: :controller, vcr: true, cache: true do
    
  describe '#show' do
    let(:section) { Section.create(title: 'Some section', slug: 'some-section', content: 'Blah').publish }
    let(:slug) { section.slug }
    let(:subject) { get :show, params: { id: slug } }

    it 'returns the section' do
      subject
      expect(assigns(:section)).to be_a(Section)
    end
    
    context 'with pages' do
      before do
        3.times { |i| Page.create(title: "Some page #{i}", slug: "some-page-#{i}", content: 'Blah', section: Section.find(slug)).publish }
      end

      it 'gets pages' do
        subject
        
        subpages = assigns(:pages)
        expect(subpages.count).to eq(3)
        expect(subpages.first.class).to eq(Page)
      end
      
    end
    
  end
  
end
