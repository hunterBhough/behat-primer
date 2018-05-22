@api

Feature: Build Your Quit Plan
  In order to create your quit plan
  As a website user
  I need to be able to view all contents on the build-your-quit-plan page

  Background:
    Given I am on "/build-your-quit-plan"

  Scenario: User looks top section
    Then I should see the heading "Create My Quit Plan"
    Then I should see the text "Quitting is tough, but"
    Then I should see the text "BEING PREPARED"
    Then I should see the text "boosts your chances of success. Build a quit plan to get ready and find out what to expect along the way. Complete 7 easy steps to get your personalized quit plan."
    Then I should see the link "Build your quit plan now"
    Then I should see the text "Create your own quit plan by following the steps below. You can download, print, and add your quit plan to your online calendars."

  Scenario: User looks at section 1
    Then I should see the text "SET YOUR"
    Then I should see the text "QUIT DATE"
    Then I should see the text "Start by setting your quit date"
    Then I should see the text "Choose a day within the next two weeks. This will give you enough time to prepare."
    Then I should see the button "Add "
    Then I should see the text " to my calendar"

  Scenario: User looks at section 2
    Then I should see the text "CHOOSE YOUR REASONS"
    Then I should see the text "FOR QUITTING"
    Then I should see the text "Select your reasons for quitting. They will be added to your quit plan."
    Then I should see the text "Be healthier"
    Then I should see the text "Save money"
    Then I should see the text "Smell better"
    Then I should see the text "My loved ones"

  Scenario: User looks at section 3
    Then I should see the text "IDENTIFY"
    Then I should see the text "YOUR SMOKING"
    Then I should see the text "TRIGGERS"
    Then I should see the text "Knowing your triggers helps you stay in control. When you first quit, you might want to completely avoid your triggers. After staying smokefree for a while, you may find other ways to handle your triggers."
    Then I should see the text "Select the triggers that cause you to smoke. They will be added to your quit plan."
    Scenario: Emotional Triggers
      Then I should see the text "Emotional Triggers"
      Then I should see the text "Feeling stressed"
      Then I should see the text "Feeling anxious"
      Then I should see the text "Feeling down"
      Then I should see the text "Feeling lonely"
      Then I should see the text "Feeling bored"
      Then I should see the text "Cooling off after a fight"
    Scenario: Habitual Triggers
      Then I should see the text "Talking on the phone"
      Then I should see the text "Drinking alcohol"
      Then I should see the text "Watching TV"
      Then I should see the text "Driving"
      Then I should see the text "Finishing a meal"
      Then I should see the text "Drinking coffee"
      Then I should see the text "Taking a work break"
      Then I should see the text "After having sex"
    Scenario: Social Triggers
      Then I should see the text "Going to a bar"
      Then I should see the text "Going to a social event"
      Then I should see the text "Seeing someone else smoke"

  Scenario: User looks at section 4
    Then I should see the text "PREPARE TO"
    Then I should see the text "FIGHT CRAVINGS"
    Then I should see the text "Cravings only last a few minutes--but those minutes can be hard. Select the types of cravings you usually have. The tips for beating these cravings will be added to your quit plan."
    Then I should see the text "Do you need to keep your hands and mouth busy?"
    Then I should see the text "Do you smoke to relieve stress or improve your mood?"
    Then I should see the text "Do you have trouble keeping busy and your mind occupied?"
    Then I should see the text "Do you smoke because it’s pleasurable and relaxing?"
    Then I should see the text "Do you get irritable and anxious without cigarettes?"
    Then I should see the text "Do you smoke for an energy boost?"

  Scenario: User looks at section 5
    Then I should see the text "GET RID OF"
    Then I should see the text "Seeing reminders of smoking makes it harder to stay smokefree. Get rid of any reminders in your home, car, and workplace before your quit day. Below is a list of common smoking reminders and how to deal with them. This list will be added to your quit plan."
    Then I should see the text "Wash your clothing, especially the jacket you wear to take smoke breaks."
    Then I should see the text "Clean your car."
    Then I should see the text "Get rid of matches, ashtrays, and any cigarette butts that may be outside your home."
    Then I should see the text "Put craving fighting items—like straws, nicotine gum, or a list of chores—in the places where you kept your cigarettes, ashtrays, matches, and lighters."
    Then I should see the text "The night before quit day, throw away everything that is related to smoking. Don’t hide a pack in your freezer or stash your ashtrays in the back of a cabinet."
    Then I should see the text "EVERYTHING MUST GO!"

  Scenario: User looks at section 6
    Then I should see the text "QUIT"
    Then I should see the text "WITH EXTRA HELP"
    Then I should see the text "Smokefree.gov has lots of tools to make quitting easier. Explore these resources and select the ones that interest you. They will be added to your quit plan with information on how to use them."
    Then I should see the text "SmokefreeTXT Text Message Program"
    Then I should see the text "Apps"
    Then I should see the text "SmokefreeUS Facebook"
    Then I should see the text "Quitlines"
    Then I should see the text "NCI LiveHelp"
    Then I should see the text "Medication and Nicotine Replacement Therapy (NRT)"
    Then I should see the text "Tell friends and family."
    Then I should see the text "Quitting smoking is easier when you have support from your loved ones. Let your family and friends know that you are quitting, or invite a friend to quit with you."
    Then I should see the button "Tell Friends and Family You’re Quitting"
    Then I should see the text "Invite a friend to quit with you"

  Scenario: User looks at final section
    Then I should see the button "Show my quit plan"
