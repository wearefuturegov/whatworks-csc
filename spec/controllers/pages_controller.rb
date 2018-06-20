require 'rails_helper'

RSpec.describe PagesController, type: :controller, vcr: true, contenful: true do

  describe '#show' do
    let(:page) { Page.create(title: 'Some page', slug: 'some-page', content: 'Blah', sub_pages: sub_pages).publish }
    let(:slug) { page.slug }

    context 'without a subsection' do
      let(:sub_pages) { [] }
            
      it 'gets a page' do
        get :show, params: { id: slug }
        expect(assigns(:page)).to be_a(Page)
        expect(assigns(:page).title).to eq('Some page')
      end
    end
    
    context 'with a subsection' do
      let(:sub_pages) { [Page.create(title: 'Some subpage', slug: 'some-subpage', content: 'Blah').publish] }
      let(:sub_page) { sub_pages.first }
      
      it 'gets a page' do
        get :show, params: { page_id: slug, id: sub_page.slug }
        expect(assigns(:page)).to be_a(Page)
        expect(assigns(:page).title).to eq('Some subpage')
        expect(assigns(:parent_page)).to be_a(Page)
        expect(assigns(:parent_page).title).to eq('Some page')
      end
    end
    
  end
  
end
