Feature: Page Refresh

  Scenario: Old Board is Cleared Upon Refresh
    Given the webpage "https://codepen.io/CalendlyQA/full/KKPQLmV" is loaded
    And "3" is input into the text field
    And the Play button is clicked
    When the page is refreshed
    Then the grid should be empty