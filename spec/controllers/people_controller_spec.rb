require 'rails_helper'

RSpec.describe PeopleController, type: :controller, vcr: true do
  
  describe '#show' do
    
    it 'shows a person' do
      get :show, params: { id: 'greg-wilkinson' }
      expect(assigns(:person)).to be_a(Person)
    end
    
  end
  
  
end
