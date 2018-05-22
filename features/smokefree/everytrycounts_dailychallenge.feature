Feature: Every Try Counts Daily Challenge
  In order to get challenges to help quit smoking
  As a website user
  I need a widget to scroll through challenges and add them to my calendar

Background:
  Given I visit "/everytrycounts/index.html"

@javascript
Scenario: User looks at the Daily Challenges section of EveryTryCounts.
  Then I should see the heading "CONQUER YOUR DAILY CHALLENGE"
  And I should see "Daily challenges are small steps that help you build the skills and knowledge you need to quit. Try a challenge today and come back again for another one."
  And I should see the button "NEXT CHALLENGE"
  And I should see a "#flipCard" element
  And I should see "CHALLENGE 1/7" in the "#flipCard" element
  And I should see "Add to My Calendar" in the "#flipCard" element
  And I should see "Delay a Cigarette" in the "#flipCard" element
  And I should see "Delay your first cigarette by 1.5 hours today. Make a plan for that time, and stick to it. If you already smoked today, delay the next cigarette for 1.5 hours." in the "#flipCard" element

@javascript
Scenario: User scrolls through the Daily Challenges section of EveryTryCounts.
  Given I wait for "2" seconds
  Given I press "NEXT CHALLENGE"
  And I wait for "2" seconds
  Then I should see "CHALLENGE 2/7" in the "#flipCard" element
  And I should see "Add to My Calendar" in the "#flipCard" element
  And I should see "Smokefree Coffee" in the "#flipCard" element
  And I should see "Try having your morning coffee without a cigarette." in the "#flipCard" element
  Given I press "NEXT CHALLENGE"
  And I wait for "2" seconds
  Then I should see "CHALLENGE 3/7" in the "#flipCard" element
  And I should see "Add to My Calendar" in the "#flipCard" element
  And I should see "Smokefree Ride" in the "#flipCard" element
  And I should see "The next time you drive to and from work, have a smokefree ride." in the "#flipCard" element
  Given I press "NEXT CHALLENGE"
  And I wait for "2" seconds
  Then I should see "CHALLENGE 4/7" in the "#flipCard" element
  And I should see "Add to My Calendar" in the "#flipCard" element
  And I should see "Stay Hydrated" in the "#flipCard" element
  And I should see "Drink water the next time a craving hits, instead of smoking a cigarette." in the "#flipCard" element
  Given I press "NEXT CHALLENGE"
  And I wait for "2" seconds
  Then I should see "CHALLENGE 5/7" in the "#flipCard" element
  And I should see "Add to My Calendar" in the "#flipCard" element
  And I should see "Delay a Cigarette" in the "#flipCard" element
  And I should see "Choose one cigarette that you normally smoke, and delay it for 2 hours. The craving may come and go, so practice different distractions to get through it." in the "#flipCard" element
  Given I press "NEXT CHALLENGE"
  And I wait for "2" seconds
  Then I should see "CHALLENGE 6/7" in the "#flipCard" element
  And I should see "Add to My Calendar" in the "#flipCard" element
  And I should see "Visualize Your Triggers" in the "#flipCard" element
  And I should see "What is one trigger that is particularly hard for you? Visualize yourself overcoming it to become smokefree." in the "#flipCard" element
  Given I press "NEXT CHALLENGE"
  And I wait for "2" seconds
  Then I should see "CHALLENGE 7/7" in the "#flipCard" element
  And I should see "Add to My Calendar" in the "#flipCard" element
  And I should see "Don't Miss Out" in the "#flipCard" element
  And I should see "Think of social situations where you missed out by smoking. Tell yourself \"it can wait,\" when you get an urge today around other people." in the "#flipCard" element
  And I should see the button "START OVER"