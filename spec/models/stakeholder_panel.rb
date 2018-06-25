require 'rails_helper'

RSpec.describe StakeholderPanel, type: :model, vcr: true, contentful: true do
  let(:stakeholder_panel) { StakeholderPanel.create(title: 'Panel', content: 'Blah').publish }
  let(:subject) { StakeholderPanel.find(stakeholder_panel.id) }
  
  it 'has the right fields' do
    expect(subject.title).to eq('Panel')
    expect(subject.content).to eq('Blah')
  end
  
end
