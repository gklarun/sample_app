Feature: Register new user
  As a admin
  I want new user to be verified through confirmation email
  So that  i can be sure that only genuine user are being registered and aslo that they have provided the correct email.

  Scenario: I am trying to register with valid details
    When I go to the signup page
    And  I enter the valid details while register
    Then I  should get a confimarion email

  Scenario: I am trying to register with invalid details
    When I go to the signup page
    And  I enter the Invald details while register
    Then I should not get a confimration email