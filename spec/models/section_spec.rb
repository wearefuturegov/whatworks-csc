require 'rails_helper'

RSpec.describe Section, type: :model, vcr: true, contentful: true do
  
  let(:section) { Section.create(title: 'Some section', slug: 'some-section', content: 'Blah').publish }
  let(:subject) { Section.find(section.id) }
  
  it 'can have many pages' do
    3.times { |i| Page.create(title: "Some page #{i}", slug: "some-page-#{i}", content: 'Blah', section: section).publish }
    expect(subject.pages.count).to eq(3)
  end
end
