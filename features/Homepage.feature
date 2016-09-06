Feature: Access the homepage

  Scenario:  User enters the homepage while logged out
    Given I am on the homepage
    When I am not logged into SoundCloud Radio
    Then I should see a "Login" button

  Scenario:  User enters the homepage while logged in
    Given I am on the homepage
    When I am logged into SoundCloud Radio as "Cucumber"
    Then I should see a "Logout" button
    And I should see a greeting saying "Welcome Cucumber"
