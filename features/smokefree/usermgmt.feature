@api

Feature: User Management
  In order to make any changes to the site
  I need to login


Scenario: Wrong credentials provided
          in login page
  Given I am on "/user"
  When I fill in "Username" with "test.user"
  And I fill in "Password" with "test.password"
  And I press the "Log in" button
  Then I should see "Sorry, unrecognized username or password. Have you forgotten your password?"


  Scenario: Anonymous user does not have access
            to view users list
    Given I am an anonymous user
    And I am on "/admin/people"
    Then I should see "Access denied"
    And I should not see the link "Add user"


  Scenario: Administrator should be able to
            Add new user
    Given I am logged in as a user with the "administrator" role
    And I am on "/admin/people"
    Then I should see the link "Add user"
   # Then I should see "Add user" link


  Scenario: Administrator can create a term
    Given I am logged in as a user with the "administrator" role
    When I am viewing a "tags" term with the name "My tag"
    Then I should see the heading "My tag"

  Scenario: Check homepage contents
    Given: I am an anonymous user
    And I am on the homepage
  #  Then print last response
    Then I should see "Quitting is a Journey."


  @api
  Scenario: Create a node
    Given I am logged in as a user with the "administrator" role
    When I am viewing an "article" content with the title "My article"
    Then I should see the heading "My article"


  Scenario: Run cron
    Given I am logged in as a user with the "administrator" role
    When I run cron
    And am on "admin/reports/dblog"
    Then I should see the link "Cron run completed"

  Scenario:editing content
    Given I am logged in as a user with the "smokefree content admin" role
    When I visit "/node/add"
    Then I should not see "access denied"
    And I should see the heading "Add content"


