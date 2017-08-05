Feature: Add leads to lead base

In order to improve my campaign planning and automation,
as a Marketing Manager,
I want to add leads to my lead base.


Background: Given I am at the "Base de Leads" page

Scenario: Add a lead to the base
  When I add a lead to the base
  Then I should see it on the leads list

Scenario: Add a company to the base
  When I add a company to the base
  Then I should see it on the companies list

@edit_lead
Scenario: Edit a lead
  When I edit a lead
  Then I should see the new information on the lead

Scenario: Edit a lead information when adding it a second time
  When I add a lead that already exists
  Then I should see the most recently added information on the lead

@link_company
Scenario: Add a company to a lead
  When I link a company to a lead
  Then I should see the company name on the lead page

Scenario: Searching for a lead
  When I search for a lead using "Pedroso"
  Then I should see only the leads with "Pedroso" on the list

@filter_by_seg
Scenario: Filter a lead by segmentation
  When I filter a lead by segmentation
  Then I should only see leads that belong to that segmentation

Scenario: Add a tag to filtered leads
  When I add a tag to the filtered leads
  Then I should see the tag on the filtered leads

Scenario: Remove a tag from filtered leads
  When I remove a tag from the filtered leads
  Then I should not the the tag on the leads

Scenario: Order leads by a parameter
  When I order the leads list by a parameter
  Then I should see the leads in that order

Scenario: Export lead table
  When I export the leads
  Then I should receive a file with all the leads

Scenario: Import lead file
  When I import a file with leads
  Then the leads should appear on the leads list
