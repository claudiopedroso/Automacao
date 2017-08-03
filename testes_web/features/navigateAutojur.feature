Feature: Navigate to Autojur

Scenario: Navigate to Autojur and fill login
  Given I am on the Autojur homepage
  When I fill the username information
  Then I should see it on screen