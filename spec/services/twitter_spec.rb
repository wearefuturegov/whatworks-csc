require 'rails_helper'

describe WhatWorksCentre::Twitter, vcr: true do
  
  let(:subject) { WhatWorksCentre::Twitter.instance }
  let(:tweet) { subject.latest_tweet.attrs[:full_text] }
  
  it 'gets the latest tweet' do
    expect(tweet).to match(/Calling all Senior Service Designers in London/)
  end
  
end
