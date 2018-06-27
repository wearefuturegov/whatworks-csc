@cache @vcr @contentful
Feature: Caching pages

  Background:
    Given there is a blog post with the title 'example-blog-post'
  
  Scenario: Index page is cached
    When I access the blog post index page
    Then the data for the blog post index page should be cached
  
  Scenario: Blog post is cached
    When I access the blog post 'example-blog-post'
    Then the data for the blog post 'example-blog-post' should be cached
  
  Scenario: Cache is cleared after update
    Given the data for the blog post 'example-blog-post' is cached
    And I update my blogPost 'example-blog-post'
    Then the cache should be cleared
    
  Scenario: Cache is cleared after delete
    Given the data for the blog post 'example-blog-post' is cached
    And I delete my blogPost 'example-blog-post'
    Then the cache should be cleared

  Scenario: Cache is cleared after unpublish
    Given the data for the blog post 'example-blog-post' is cached
    And I unpublish my blogPost 'example-blog-post'
    Then the cache should be cleared
    
  Scenario: Cache is not cleared after save
    Given the data for the blog post 'example-blog-post' is cached
    And I save my blogPost 'example-blog-post'
    Then the cache should not be cleared
    
  Scenario: Index cache gets ignored for pages
    Given there is a page called 'some-page'
    And the data for the page is cached
    Then the index cache should be left alone
    When I update my page 'some-page'
