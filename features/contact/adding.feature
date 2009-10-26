Feature: Add contacts
  In order to have my contacts online
  As a mobile user
  I want to add my contacts
  
  Scenario: No contacts at all
    Given no contacts
    When I am on contacts page
    Then I should see "Firstname"
    And I should see "Lastname"
    And I should see "Email"
    And I should see "Twitter"
    And I should see "Add a contact" within "a"
    When I follow "Add a contact"
    Then I should be on new contact
    And I should see "Add Contact"
    And I should see "Personal Information"
    And I should see "First Name"
    And I should see "Last Name"
    And I should see "Email"
    And I should see "Social Information"
    And I should see "Group"
    And I should see "Twitter"
  Scenario: A new contact
    Given I am on new contact
    When I fill in "contact[first_name]" with "Pedro"
    And I fill in "contact[last_name]" with "Visintin"
    And I fill in "contact[email]" with "peterpunk@mail.com"
    And I fill in "contact[twitter]" with "@pvisintin"
    And I press "save"
    Then I should have a contact with "Pedro" as "first_name"
    And I should have a contact with "Visintin" as "last_name"
    And I should have a contact with "peterpunk@mail.com" as "email"
    And I should have a contact with "@pvisintin" as "twitter"
  Scenario: An existing contact
  Scenario: An existing contact with email taken
    Given an existing contact with "peterpunk@mail.com" as "email"
    And I am on new contact
    When I fill in "contact[email]" with "peterpunk@mail.com"
    And I press "save"
    And I should see "Invalid Contact"
    