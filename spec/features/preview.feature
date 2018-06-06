@cache @vcr @preview
Feature: Previewing pages
  
  Scenario: Preview unpublished page
    When I visit the preview link for the blog post 'wanted-pioneer-partners-for-the-what-works-centre'
    Then I should see the draft content
    And the content should not be cached
