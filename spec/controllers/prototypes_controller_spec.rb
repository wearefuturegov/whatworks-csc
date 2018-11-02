require 'rails_helper'
require 'features/steps/contentful_steps'

RSpec.describe PrototypesController, type: :controller, vcr: true do
  include ContentfulSteps
  
  describe '#show' do
    
    let(:prototype) { create_prototype }
    
    it 'gets the prototype' do
      get :show, params: { id: prototype.slug }
      expect(assigns(:prototype)).to be_a(Prototype)
      expect(assigns(:prototype).title).to eq(prototype.title)
    end
  end
end
