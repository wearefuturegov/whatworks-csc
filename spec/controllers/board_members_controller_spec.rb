require 'rails_helper'

RSpec.describe BoardMembersController, type: :controller, vcr: true do
    
  describe '#show' do
    it_behaves_like 'contenful controller #show', 'board_member', BoardMember, 'some-person'
  end
  
end
