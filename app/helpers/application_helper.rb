# frozen_string_literal: true

module ApplicationHelper
  def twitter
    tweet = WhatWorksCentre::Twitter.instance.latest_tweet
    return nil unless tweet
    content_tag :div, class: 'twitter' do
      output = content_tag(:span, link_to(tweet.attrs[:full_text], tweet.uri.to_s), id: 'tweet_cont')
      output << content_tag(:span, link_to('View Tweet', tweet.uri.to_s), id: 'tweet_link')
      output
    end
  end
end
