require 'rails_helper'

RSpec.describe PersonDecorator, :vcr do
  
  let(:slug) { 'person' }
  let(:subject) { BoardMember.find_by(slug: slug).load.first.decorate }
  
  describe '#decorate_image' do
        
    context 'with image' do
      
      before { stub_api_response(slug, 'board_member/with_image') }
      
      it 'returns an image' do
        expect(subject.decorate_image).to eq('<img src="//example.com/image.jpg?w=200&amp;h=200&amp;f=face&amp;fit=thumb" />')
      end
      
    end
    
    context 'without image' do
      
      before { stub_api_response(slug, 'board_member/without_image') }
      
      it 'returns nil' do
        expect(subject.decorate_image).to eq(nil)
      end
      
    end
    
  end
  
end
