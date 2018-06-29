require 'rails_helper'
require 'features/steps/contentful_steps'

RSpec.describe Contributor, type: :model, vcr: true do
  include ContentfulSteps

  let(:contributor) { create_contributor('mr-contributor', 'Contributor Name') }
  
  it 'has the correct fields' do
    expect(contributor.name).to eq('Contributor Name')
    expect(contributor.slug).to eq('mr-contributor')
  end
  
end
