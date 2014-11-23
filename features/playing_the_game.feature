Feature: Playing the game
  In order to play Rock, Paper, Scissors
  As a registered player
  I want to be able choose an object

  Scenario: Choosing an object to play
    Given I have registered
    And I choose "Rock"
    And I click "Submit"
    Then I should see the message "Round Two"
