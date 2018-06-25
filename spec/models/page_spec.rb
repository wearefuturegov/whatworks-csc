require 'rails_helper'

RSpec.describe Page, type: :model, vcr: true, contentful: true do
  let(:section) { Section.create(title: 'Some section', slug: 'some-section', content: 'Blah').publish }
  let(:page) { Page.create(title: 'Some page', slug: 'some-page', content: 'Blah', section: section).publish }
  let(:subject) { Page.find(page.id) }
  
  it 'has the right fields' do
    expect(subject.title).to eq('Some page')
    expect(subject.slug).to eq('some-page')
    expect(subject.content).to eq('Blah')
    expect(subject.section.slug).to eq(section.slug)
  end
  
end
