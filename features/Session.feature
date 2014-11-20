Feature: Start/End a session

  Scenario:  User clicks "Login" button
    Given I enter the homepage while logged out
    When I click the "Login" button
    Then I should authenticate to SoundCloud
    Then I should enter the homepage while logged in

  Scenario:  User clicks "Logout" button
    Given I enter the homepage while logged in
    When I click the "Logout" button
    Then I should enter the homepage while logged out
