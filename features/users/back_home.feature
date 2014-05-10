Feature: Get back home
  To go back to the home page
  A user
  Should be able to navigate there from the menu

    Scenario: Visitor goes home
      Given I am not logged in
      When I am on the login page
      Then I click on the main logo
      And I see the home page

    Scenario: User goes home
      Given I am logged in
      When I am on the account page
      Then I click on the main logo
      And I see the home page