@cache
Feature: Caching pages
  
  Scenario: Index page is cached
    When I access the blog post index page
    Then the data for the blog post index page should be cached
  
  Scenario: Blog post is cached
    When I access the blog post 'hello-world'
    Then the data for the blog post 'hello-world' should be cached
  
  Scenario: Cache is cleared after update
    Given the data for the blog post 'hello-world' is cached
    And I update my blog post 'hello-world'
    Then the cache should be cleared
    
  Scenario: Cache is cleared after delete
    Given the data for the blog post 'hello-world' is cached
    And I delete my blog post 'hello-world'
    Then the cache should be cleared

  Scenario: Cache is cleared after unpublish
    Given the data for the blog post 'hello-world' is cached
    And I unpublish my blog post 'hello-world'
    Then the cache should be cleared
    
  Scenario: Cache is not cleared after save
    Given the data for the blog post 'hello-world' is cached
    And I save my blog post 'hello-world'
    Then the cache should not be cleared
