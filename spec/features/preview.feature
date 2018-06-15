@cache @vcr @preview
Feature: Previewing pages

  Background:
    Given there is a blog post with the title 'example-blog-post'
  
  Scenario: Preview unpublished page
    When I visit the preview link for the blog post 'example-blog-post'
    Then I should see the draft content
    And the content should not be cached
