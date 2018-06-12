@vcr
Feature: Commenting

  Background:
    Given I want to comment on an article

  Scenario: Commenting on a blog post
    Given I access the blog post 'wanted-pioneer-partners-for-the-what-works-centre'
    And I leave a comment
    Then the comment should be stored as a draft
