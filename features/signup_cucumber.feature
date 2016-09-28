Feature: Register new user
  As a new user
  I want our register my detail
  So that  i dont have to enter my details every time

  Scenario: I am trying to register with valid details
    When I go to the signup page
    And  I enter the details and press submit button
    Then I should be registered

  Scenario: I am trying to register with invalid details
    When I go to the signup page
    And  I enter invalid details and press submit button
    Then I should not be registered