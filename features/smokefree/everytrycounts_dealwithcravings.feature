Feature: Every Try Counts Deal With Cravings
  In order to get tips on quitting smoking
  As a website user
  I need to have a slider I can use to navigate through tips

Background:
  Given I visit "/everytrycounts/index.html"

@javascript
Scenario: User looks at the Deal With Cravings section of EveryTryCounts.
  Then I should see the heading "DEAL WITH CRAVINGS"
  And I should see "Cravings can make quitting hard, but they typically last only 5 to 10 minutes. It might be uncomfortable, but you can wait them out."
  And I should see "FIGHT CRAVINGS WITH THESE TIPS"
  And I should see 1 ".grayBox" element
  And I should see "TIP 1/3" in the ".grayBox" element
  And I should see 3 ".grayBox img" elements
  And I should see "Next"
  And I should see "previous"
  And I should see a ".tipContent" element
  And The ".grayBox img" element should not be broken

@javascript
Scenario: User navigates the Deal With Cravings section of EveryTryCounts.
  When I click "Next"
  Then I should see "TIP 2/3" in the ".grayBox" element
  When I click "Next"
  Then I should see "TIP 3/3" in the ".grayBox" element
  When I click "Next"
  Then I should see "TIP 1/3" in the ".grayBox" element
  When I click "Previous"
  Then I should see "TIP 3/3" in the ".grayBox" element
  When I click "Previous"
  Then I should see "TIP 2/3" in the ".grayBox" element
  When I click "Previous"
  Then I should see "TIP 1/3" in the ".grayBox" element
  When I click "Previous"
  Then I should see "TIP 3/3" in the ".grayBox" element

