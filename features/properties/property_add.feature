Feature: Add Property
  In order to advertise their properties to others
  A user
  Should be able to add a property
    
    @javascript
    Scenario: User successfully adds a property 
      Given I exist as a user
      When I create a new property
      Then the property is created
        