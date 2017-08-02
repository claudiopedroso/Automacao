Feature: Find the Crossfit Games Website

Scenario: Search for the website
	Given I am on the Google homepage
	Then I will search for "CrossFit Games"
	Then I should see "Leaderboard"
	Then I will click the Leaderboard link
