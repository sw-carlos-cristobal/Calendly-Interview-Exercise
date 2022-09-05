Feature: Tic Tac Toe 5x5

  Scenario: 5x5 Grid
    Given the webpage "https://codepen.io/CalendlyQA/full/KKPQLmV" is loaded
    When "5" is input into the text field
    And the Play button is clicked
    Then the grid should be accurately displayed