@vcr @contentful
Feature: Commenting

  Background:
    Given there is a blog post with the title 'example-blog-post'
    And I want to comment on an article

  Scenario: Commenting on a blog post
    Given I access the blog post 'example-blog-post'
    And I leave a comment
    Then the comment should be stored as a draft
    And the contact email address should recieve a comment alert
      
  Scenario: Missing required field
    Given I access the blog post 'example-blog-post'
    And I leave my email blank
    And I leave a comment
    Then the comment should not be stored
    And I should see an error message
  
  Scenario: Comments are published under a blog post
    Given I have commented on the blog post 'my-amazing-blog-post'
    And the comment is approved
    Then my comment should show underneath the blog post
