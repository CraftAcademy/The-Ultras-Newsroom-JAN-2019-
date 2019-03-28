@javascript
Feature: Journalist can add and delete image

    As a journalist
    In order to make my articles more visually appealing
    I would like to be able to upload and display images to my articles


    Background:

        Given the following users exist
            | email          | password | role       |
            | jocke@craft.se | password | journalist |

        And the following articles exist
            | title                                 | lead                   | content                                          | category      | user           |
            | Voted best mead recipe                | Restaurant wins prize  | Restaurant wins prize for best mead in Sweden    | Lifestyle     | jocke@craft.se |
            | Ancient viking grave discovered       | Kids came across sword | Kids come across sword protruding from the earth | Breaking News | jocke@craft.se |
            | Drinking wine improves general health | Drink wine today!      | Studies show that wine is good for your heart    | Health        | jocke@craft.se |

        And I am logged in as "jocke@craft.se"
        And I visit the "Voted best mead recipe" page

    Scenario: Journalist can add image
        When I click "Edit"
        And I attach dummy_image.png
        And I click "Update article"
        And I visit the "Voted best mead recipe" page
        Then I should see the image "dummy_image.png"
    
    Scenario: Journalist can delete image
        When I click "Edit"
        And I attach dummy_image.png
        And I click "Update article"
        And I visit the "Voted best mead recipe" page
        And I click "Edit"
        And I click "Delete Image"
        And I click the popup
        And I visit the "Voted best mead recipe" page
        Then I should not see the image "dummy_image.png"