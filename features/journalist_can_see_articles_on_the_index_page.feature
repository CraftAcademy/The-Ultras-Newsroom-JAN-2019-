Feature: Journalist can see articles on the journalist index page

    As a journalist
    In order to keep track of my articles
    I would like to have them listed on
    the index page

    Background:

        Given the following users exist
            | email       | password | role       |
            | per@mail.se | password | journalist |

        And the following articles exist
            | title                                 | lead                   | content                                          | category      | user        | approved |
            | Voted best mead recipe                | Restaurant wins prize  | Restaurant wins prize for best mead in Sweden    | Lifestyle     | per@mail.se | false    |
            | Ancient viking grave discovered       | Kids came across sword | Kids come across sword protruding from the earth | Breaking News | per@mail.se | true     |
            | Drinking wine improves general health | Drink wine today!      | Studies show that wine is good for your heart    | Health        | per@mail.se | true     |

    Scenario: Journalist can see articles listed on journalist index page
        Given I am logged in as "per@mail.se"
        And I visit the journalist page
        Then I should see "Voted best mead recipe"
        And I should see "Ancient viking grave discovered"
        And I should see "Drinking wine improves general health"