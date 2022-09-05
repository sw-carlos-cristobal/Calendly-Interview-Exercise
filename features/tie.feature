Feature: A Tie Occurs

  Scenario: A Tie Announcement Should Occur
    Given the webpage "https://codepen.io/CalendlyQA/full/KKPQLmV" is loaded
    And "3" is input into the text field
    And the Play button is clicked
    When the game ends in a tie
    Then a tie is announced