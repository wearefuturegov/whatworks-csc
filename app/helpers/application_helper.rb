# frozen_string_literal: true

module ApplicationHelper
  
  def twitter
    tweet = WhatWorksCentre::Twitter.instance.latest_tweet
    return nil unless tweet
    content_tag(:div, class: 'twitter') do
      content_tag :p, link_to(tweet.attrs[:full_text], tweet.uri.to_s)
    end
  end
  
end
