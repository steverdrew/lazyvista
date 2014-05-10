Feature: Sign up
  To access restricted content
  A vistor
  Should be able to sign up

    Scenario: User signs up
      Given I am not a user
      When I sign up with valid user data
      Then I should see a confirmation link message to activate my account
      
    Scenario: User requires new email confirmation
      Given I am not a user
      When I sign up with valid user data
      Then I should see a confirmation link message to activate my account
      And I require a new confrmation email