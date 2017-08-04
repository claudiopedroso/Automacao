Feature: Add leads to lead base

In order to improve my campaign planning and automation,
as a Marketing Manager, 
I want to add leads to my lead base.


Background
Given I am at the "Base de Leads" page

Scenario: Add a lead to the base
  When I add a lead to the base
  Then I should see it on the leads list

Scenario: Add a company to the base
  When I add a company to the base
  Then I should see it on the companies list

@create_lead
Scenario: Edit a lead
  When I edit a lead
  Then I should see the new information on the lead
  
Scenario: Add a company to a lead
  When I link a company to a lead
  Then I should see the lead name on the company page
  
Scenario: Searching for a lead
  When I search for a lead using "expression"
  Then I should see only the leads with the "expression" on the list
  
Scenario: Filter a lead by segmentation
  When I filter a lead by "segmentation"
  Then I should only see leads that belong to "segmentation"

Scenario: Add a tag to filtered leads
  When I add a tag to the filtered leads
  Then I should see the tag on the filtered leads

Scenario: Remove a tag from filtered leads
  When I remove a tag from the filtered leads
  Then I should not the the tag on the leads
  
Scenario: Order lead by
  When I order the leads list by "parameter"
  Then I should see the leads in that order
  
Scenario: Export lead table
  When I export the leads
  Then I should receive a file with all the leads