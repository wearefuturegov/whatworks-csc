# require 'rails_helper'
# require 'features/steps/contentful_steps'

# RSpec.describe GovernanceController, type: :controller, vcr: true, contentful: true, cache: true do
#   describe '#show' do
#     include ContentfulSteps

#     let!(:board_members) { Array.new(3) { create_board_member } }
#     let!(:stakeholder_panels) { Array.new(4) { create_stakeholder_panel } }

#     let(:page) { Page.create(title: 'Governance', slug: 'governance', content: 'Blah').publish }
#     let(:slug) { page.slug }

#     it 'gets the correct page' do
#       get :show
#       expect(assigns(:page)).to be_a(Page)
#       expect(assigns(:page).title).to eq('Governance')
#     end

#     it 'gets associated content' do
#       get :show
#       expect(assigns(:board_members).to_a).to include(*board_members)
#       expect(assigns(:stakeholder_panels).to_a).to include(*stakeholder_panels)
#     end

#   end
# end
