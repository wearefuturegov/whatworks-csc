Feature: Sending Contact Form

  Background:
    Given I want to contact the centre
  
  Scenario: Successful contact form
    And I submit a contact form
    Then the contact email address should recieve an email with the correct content
    
  Scenario: Missing field
    When I miss the email field
    And I submit a contact form
    Then I should see an error relating to the email field
    And the contact email address should not recieve an email
