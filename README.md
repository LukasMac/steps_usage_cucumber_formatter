Cucumber formatter
==============================

Custom cucumber formatter (inherited from pretty formatter) for displaying unmatched steps and scenario start time.

```
Feature: Should load homepage
  So that I can see the homepage
  As a user
  I want the hompeage loaded

  Scenario: I sleep for 3 seconds    # features/homepage.feature:6 started at [2014-11-11 09:51:03]
    Given I sleep for 3 seconds      # features/step_definitions/homepage.rb:15

  @1
  Scenario:omepage loads             # features/homepage.feature:10 started at [2014-11-11 09:51:07]
    Given I have the homepage url    # features/step_definitions/homepage.rb:1

NOT MATCHED BY ANY STEPS:
  /^I load the contacts url$/             # features/step_definitions/homepage.rb:5
  /^the homepage should return the menu$/   # features/step_definitions/homepage.rb:10
```
