require 'rails_helper'
require 'features/steps/contentful_steps'

RSpec.describe ContributorsController, type: :controller, vcr: true do
  include ContentfulSteps
  
  describe '#show' do
    
    before { create_contributor('the-contributor', 'The Contributor Name') }
    
    it 'gets the contributor' do
      get :show, params: { id: 'the-contributor' }
      expect(assigns(:contributor)).to be_a(Contributor)
      expect(assigns(:contributor).slug).to eq('the-contributor')
    end
  end
end
