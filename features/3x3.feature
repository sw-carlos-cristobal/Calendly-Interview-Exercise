Feature: Tic Tac Toe 3x3

  Scenario: 3x3 Grid
    Given the webpage "https://codepen.io/CalendlyQA/full/KKPQLmV" is loaded
    When "3" is input into the text field
    And the Play button is clicked
    Then the grid should be accurately displayed