require 'rails_helper'

describe WhatWorksCentre::Twitter, vcr: true do
  
  let(:subject) { WhatWorksCentre::Twitter.instance }
  
  it 'gets the latest tweet' do
    expect(subject.latest_tweet.attrs[:full_text]).to eq("RT @FutureGov: Calling all Senior Service Designers in London &amp; the North - we're hiring passionate people who want to change public servic…")
  end
  
end
