Feature: Testing PetSmart.
  Scenario: Main page functionality - header navigation

    Then Check that menu item "Dog" contains submenus

    Then Check that menu item "Cat" contains submenus

    Then Check that menu item "Fish" contains submenus

    Then Check that menu item "Sale" contains submenus

  Scenario: Main page functionality - footer navigation
    Then Check footer menu "Store Services" with items
    Then Check footer menu "PetSmart Cares" with items
    Then Check footer menu "Shop With Us" with items
    Then Check footer menu "Education" with items
    Then Check footer menu "About PetSmart" with items

  Scenario: Main page functionality - external links - facebook
    Then Click on "Facebook" icon
    Then Verify navigation to "PetSmart"

  Scenario: Main page functionality - external links - hangouts
    Then Click on "Google Plus" icon
    Then Verify navigation to "PetSmart - Google+"

  Scenario: Main page functionality - external links - twitter
    Then Click on "Twitter" icon
    Then Verify navigation to "PetSmart (@PetSmart) | Twitter"

  Scenario: Main page fuctionality - external links- instagram
    Then Click on "Instagram" icon
    Then Verify user navigate to "Instagram"

  Scenario: Main page functionality - external links - pinterest
    Then Click on "Pinterest" icon
    Then Verify navigation to "PetSmart on Pinterest"

  Scenario: Main page functionality - external links - youtube
    Then Click on "YouTube" icon
    Then Verify user navigate to "YouTube"

  Scenario: Main page functionality - upcoming events wrapper
    Then Print out all upcoming events in wrapper

  Scenario: Dog - Food - sorting - price low to high
    Then In dog menu go to food

    Then Set sorting to "Low to high" and verify correct sorting

  Scenario: Main page functionality - search - valid search
    Then In search type Food
    Then Check that some results returned Food

  Scenario: Main page functionality - search - invalid search
    Then In search type Tanya
    Then Check that no results "Tanya" returned and message "0 Results for:"

  Scenario: Main page functionality - pet services wrapper
    Then in Pet service click on each item and verify that all promo messages are different

  Scenario: Dog - Food and health - Brands
    Then In "Dog" menu go to "Food & health"
    Then In "Featured Brands" check that each brand navigates to the page with brand specific items

  Scenario: Dog - Food - see 200 items verification
    Then In "Dog" menu go to "Food"
    Then Click "View 200 Items"
    Then Check that 200 items displayed

  Scenario: Dog - Food - pagination verification
    Then In "Dog" menu go to "Food"
    Then Go through all pages and print out all given items

  Scenario: Dog - Food - sorting - price high to low
    Then In "Dog" menu go to "Food"
    Then Set sorting to "High to low" and verify correct sorting

  Scenario: Dog - Food - sorting - top rated
    Then In "Dog" menu go to "Food"
    Then Set sorting to "top rated" and verify correct  sorting

  Scenario: Rated
    Then In "Dog" menu go to "Food"
    Then Rates

  Scenario: Dog - Food - comparing - adding 2 items
    Then In "Dog" menu go to "Food"

  Scenario: Dog - Food - comparing - adding 3 items
    Then In "Dog" menu go to "Food"
    Then Add 3 random items into compare mode

  Scenario: Dog - Food - comparing - adding more then 3 items
    Then In "Dog" menu go to "Food"
    Then Add 4 random items into compare mode

  Scenario: Dog - Food - comparing - removing 1-3 items
    Then In "Dog" menu go to "Food"
    Then Add 3 random items into compare mode
    Then From compare mode remove 1st item  and verify that item was removed
    Then Tap Remove button to remove 2nd item ,  verify that item was removed
    Then Uncheck box  to remove 3d item  and verify that item was removed


  Scenario: Dog - Shopping - 1 item to cart - all fine
    Then In "Dog" menu go to "Food"
    Then Add random item to card
    Then Choose size, flavor and quantity and add to cart
    Then Verify that 1 item in cart


  Scenario: Dog - Shopping - 1 item to cart - size, quantity and flavor not selected
    Then In "Dog" menu go to "Food"

  Scenario: Dog - Shopping - 1 item to cart with removing
    Then In "Dog" menu go to "Food"
    Then Add random item to card
    Then Choose size, flavor and quantity and add to cart
    Then Remove item from cart and verify that no items in cart

  Scenario: Dog - Shopping - 1 item to cart with proceeding
    Then In "Dog" menu go to "Food"
    Then Add random item to card
    Then Choose size, flavor and quantity and add to cart
    Then Tap Checkout button and verify thet user on Checkout page

