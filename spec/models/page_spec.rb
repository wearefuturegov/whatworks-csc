require 'rails_helper'

RSpec.describe Page, type: :model, vcr: true, contentful: true do
  let(:sub_pages) { [] }
  let(:page) { Page.create(title: 'Some page', slug: 'some-page', content: 'Blah', sub_pages: sub_pages).publish }
  let(:subject) { Page.find(page.id) }
  
  it 'has the right fields' do
    expect(page.title).to eq('Some page')
    expect(page.slug).to eq('some-page')
    expect(page.content).to eq('Blah')
  end
  
  context 'with subpages' do
    let(:sub_pages) do
      Array.new(3) do |i|
        sub_page = Page.create(title: "Some page #{i}", slug: "some-page-#{i}", content: 'Blah').publish
        Page.find(sub_page.id)
      end
    end
    
    it 'can have many subpages' do
      expect(subject.sub_pages.count).to eq(3)
    end
  end
  
end
