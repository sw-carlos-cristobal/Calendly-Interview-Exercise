Feature: Correct Winner

  Scenario: The Correct Winner is Announced
    Given the webpage "https://codepen.io/CalendlyQA/full/KKPQLmV" is loaded
    And "3" is input into the text field
    And the Play button is clicked
    When "X" wins the game
    Then the winner is displayed as "X"