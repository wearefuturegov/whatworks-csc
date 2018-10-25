require 'rails_helper'
require 'features/steps/contentful_steps'

RSpec.describe ResearchReportsController, type: :controller, vcr: true do
  include ContentfulSteps
  
  describe '#show' do
    
    let(:report) { create_research_report }
    
    it 'gets the report' do
      get :show, params: { id: report.slug }
      expect(assigns(:research_report)).to be_a(ResearchReport)
      expect(assigns(:research_report).title).to eq(report.title)
    end
  end
end
