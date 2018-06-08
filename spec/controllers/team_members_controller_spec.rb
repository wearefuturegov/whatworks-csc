require 'rails_helper'

RSpec.describe TeamMembersController, type: :controller, vcr: true do
    
  describe '#show' do
    it_behaves_like 'contenful controller #show', 'team_member', TeamMember, 'some-person'
  end
  
  
end
