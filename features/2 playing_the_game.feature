Feature: Playing the game
  In order to play Rock, Paper, Scissors
  As a registered player
  I want to be able choose an object

  Scenario: Choosing an object to play
    Given I have registered
    And I have played a round
    Then I should see the message "Round 2"

  Scenario: Finishing the gam
    Given I have registered
    And I have played a round
    And I play two more rounds
    Then I should see the message "Game over!"
