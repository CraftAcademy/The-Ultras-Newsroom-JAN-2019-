Feature: Journalist can edit and delete articles

    As a Journalist,
    In order to change articles I have already written
    I would like to be able to edit and delete articles


    Background:

        Given the following users exist
            | email          | password | role       |
            | jocke@craft.se | password | journalist |
            | per@mail.se    | password | journalist |

        And the following articles exist
            | title                                 | lead                   | content                                          | category      | user           | approved |
            | Voted best mead recipe                | Restaurant wins prize  | Restaurant wins prize for best mead in Sweden    | Lifestyle     | jocke@craft.se | false    |
            | Ancient viking grave discovered       | Kids came across sword | Kids come across sword protruding from the earth | Breaking News | jocke@craft.se | true     |
            | Drinking wine improves general health | Drink wine today!      | Studies show that wine is good for your heart    | Health        | jocke@craft.se | true     |

    Scenario: Journalist can edit articles
        When I am logged in as "jocke@craft.se"
        And I visit the "Voted best mead recipe" page
        And I click "Edit"
        And I fill in "Title" with "Voted worst mead recipe"
        And I click "Update article"
        Then I should see "Article was successfully updated."

    @javascript
    Scenario: Journalist can delete articles
        When I am logged in as "jocke@craft.se"
        And I visit the "Voted best mead recipe" page
        And I click "Edit"
        And wait for 8 seconds
        Then I should see "Delete"
        When I click "Delete"
        And I click the popup
        Then I should see "Article was successfully deleted."

    Scenario: Journalist can't edit other journalists articles
        When I am logged in as "per@mail.se"
        And I visit the "Voted best mead recipe" page
        And I click "Edit"
        Then I should see "You can only edit your own articles."
