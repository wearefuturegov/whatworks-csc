require 'rails_helper'

describe WhatWorksCentre::Twitter, vcr: true do
  
  let(:subject) { WhatWorksCentre::Twitter.instance }
  
  it 'gets the latest tweet' do
    expect(subject.latest_tweet).to eq('Yes our very own @ThatGirlVim will be live on @DigiLeaders at 5pm today: Meet the young disruptors… https://t.co/YLiTQRb0hi')
  end
  
end
