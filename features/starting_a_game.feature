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

  Scenario: Revisiting the site
    Given I have registered
    And I am on the homepage
    Then I should see the message "Welcome back"
    And I should see the message "Ready to play again?"

  Scenario: Resetting the game
    Given I have registered
    And I am on the homepage
    And I click "Start a New Game"
    Then I should see the message "Please enter a username"