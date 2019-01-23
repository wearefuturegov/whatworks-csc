# require 'rails_helper'
# require 'features/steps/contentful_steps'

# RSpec.describe MeetTheTeamController, type: :controller, vcr: true, contentful: true, cache: true do
#   describe '#show' do
#     include ContentfulSteps

#     let!(:team_members) { Array.new(2) { create_team_member } }

#     let(:page) { Page.create(title: 'Meet the team', slug: 'meet-the-team', content: 'Blah').publish }
#     let(:slug) { page.slug }

#     it 'gets the correct page' do
#       get :show
#       expect(assigns(:page)).to be_a(Page)
#       expect(assigns(:page).title).to eq('Meet the team')
#     end

#     it 'gets associated content' do
#       get :show
#       expect(assigns(:team_members).to_a).to include(*team_members)
#     end

#   end
# end
