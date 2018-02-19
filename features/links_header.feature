@javascript
Feature: Header Content Links
  In order to navigate to more content and information on the website
  As a website user
  I need to be able to click on the header links at the top of the page for the HIV.gov Website

  Background:
    Given I am on the homepage

  Scenario:
    When I click "HIVgov"
    Then I am on "/"
#    But the response status code should be 200

  Scenario Outline:
    When I hover over the link "<link>"
    And I wait for "2" seconds
    Then I should see the link "<menu>"
    Examples: Header drop down menus
    |link             |menu                                   |
    |HIV Basics       |#mega-menu > ul > li:nth-child(1) > a |
    |Federal Response |#mega-menu > ul > li:nth-child(2) > a |
    |Digital Tools    |#mega-menu > ul > li:nth-child(3) > a |
    |Events           |#mega-menu > ul > li:nth-child(4) > a |


  Scenario Outline: Header links direct to correct URL
    When I click "<Header link>"
    Then I am on "<page>"
#    But the response status code should be 200
    Examples: Header links
    |Header link                  |page                             |
    |HIV Basics                   |hiv-basics                       |
    |Federal Response             |federal-response                 |
    |Digital Tools                |digital-tools                    |
    |Events                       |events                           |
    |Blog                         |blog                             |

  Scenario: Positive spin button redirects to correct URL
    When I click "Positive Spin"
    Then I am on "https://positivespin.hiv.gov/"
#    But the response status code should be 200
