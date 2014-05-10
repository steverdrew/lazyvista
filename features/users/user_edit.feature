Feature: Edit User
  As a registered user of the website
  I want to edit my user profile
  so I can update my details

    Scenario: I sign in and edit my account
      Given I am logged in
      When I edit my account details
      Then I should see an account edited message
      
    Scenario: I sign in and delete my account
      Given I am logged in
      When I delete my account
      Then my account is deleted