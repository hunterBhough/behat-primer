Feature: Every Try Counts Text Signups
  In order to sign up for text programs
  As a website user
  I need to have signup forms that posts data to mobile commons

Background:
  Given I visit "/everytrycounts/index.html"

Scenario: User looks for text signup buttons on Every Try Counts page.
  Then I should see the button "TRY DAILY CHALLENGES"
  And I should see the button "PRACTICE QUITTING"
  And I should see the button "QUIT FOR GOOD"
  And I should see the heading "Try Something New"
  And I should see "Quitting smoking takes skills. And building skills takes practice. Try a text message program to build the skills and confidence you need to quit for good."
  And I should see "CHOOSE THE PROGRAM THAT’S RIGHT FOR YOU" in the "p.bold" element

@javascript
Scenario: User opens signup form for Daily Challenges signup.
  When I press "programChallengeButton"
  Then I should see the heading "TRY DAILY CHALLENGES"
  And I should see an "#programChallenge" element
  And I should see "Get a new challenge at 9 a.m. every day for a week to build skills without quitting." in the "#programChallenge" element
  And I should see "Try to resist 2 cigarette cravings today for 10 minutes each. Go for a walk or call someone. Cravings usually last only 5 to 10 minutes." in the "#programChallenge" element
  And I should see "To unsubscribe text STOP to 47848" in the "#programChallenge" element
  And I should see the button "Sign Up"
  And I should see an "#programchallengephone" element

@javascript
Scenario: User signs up with a valid phone number for Daily Challenges.
  When I press "programChallengeButton"
  And I wait for "4" seconds
  When I fill in "programchallengephone" with "5555555555"
  And I press "Sign Up"
  And I wait for AJAX to finish
  Then I should see "Check your phone for a text message from 47848. Respond to the questions to complete enrollment."
  And I should not see the button "Sign Up"
  And I should not see an "#programchallengephone" element

@javascript
Scenario: User opens signup form for Practice Quitting signup.
  When I press "programPracticeButton"
  Then I should see the heading "PRACTICE QUITTING"
  And I should see an "#programPractice" element
  And I should see "Practice quitting for 1, 3, or 5 days at a time and build up to quitting for good." in the "#programPractice" element
  And I should see "You're 24 hours into your practice! That is a MAJOR milestone! Be sure to reward yourself. Say, do, or get something nice to celebrate your success." in the "#programPractice" element
  And I should see "To unsubscribe text STOP to 47848" in the "#programPractice" element
  And I should see the button "Sign Up"
  And I should see an "#programpracticephone" element

@javascript
Scenario: User signs up with a valid phone number for Practice Quitting.
  When I press "programPracticeButton"
  And I wait for "4" seconds
  When I fill in "programpracticephone" with "5555555555"
  And I press "Sign Up"
  And I wait for AJAX to finish
  Then I should see "Check your phone for a text message from 47848. Respond to the questions to complete enrollment."
  And I should not see the button "Sign Up"
  And I should not see an "#programpracticephone" element

