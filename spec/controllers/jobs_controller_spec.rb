require 'rails_helper'

RSpec.describe JobsController, type: :controller, vcr: true do
    
  describe '#show' do
    it_behaves_like 'contenful controller #show', 'job', Job, 'some-job'
  end
  
  describe '#index', :timecop do
    
    before { Timecop.freeze(Date.parse('2018-06-08')) }

    it 'only gets current jobs' do
      get :index
      expect(WebMock).to have_requested(:get, "https://cdn.contentful.com/spaces/#{ENV['CONTENTFUL_SPACE_ID']}/environments/#{ENV['CONTENTFUL_ENVIRONMENT']}/entries")
        .with(query: { 'fields.closing_date[gte]' => Date.today.to_s, content_type: 'job' }).once
    end
    
  end
  
end
