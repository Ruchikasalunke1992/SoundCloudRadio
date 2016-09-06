Feature: Search for songs

  Scenario:  Searches for songs of a specific genre
    Given I enter the homepage while logged in
    When I type "reggae" in the search bar
    And Click "Search Sounds"
    Then I should see the following songs:
    | Username        | Title                                          |
    | Dj Javier Rumba | Nicky jam - travesuras                         |
    | Jimmy Cliff     | World Upside Down                              |
    | skanpgm         | Bob Marley - Buffalo Solider                   |
    | capj1970(4)     | Bob marley - redemption song                   |
    | dubmatix        | Bob Marley Is this Love (Dubmatix Re-Visioned) |
