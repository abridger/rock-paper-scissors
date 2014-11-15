Feature: Starting the game
  In order to play Rock, Paper, Scissors
  As a single player
  I want to be able to start a new game

  Scenario: Visiting the site
    Given I am on the homepage
    Then I should see the message "Please enter a username"

  Scenario: Registering as a player
    Given I am on the homepage
    And I enter a username
    And I click "Register"
    Then I should see the message "What would you like to choose?"