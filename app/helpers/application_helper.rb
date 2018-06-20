# frozen_string_literal: true

module ApplicationHelper
  
  def twitter
    tweet = WhatWorksCentre::Twitter.instance.latest_tweet
    content_tag(:div, class: 'twitter') do
      content_tag(:p, tweet)
    end
  end
  
end
