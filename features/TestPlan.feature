Feature: Test plan sample


#  base url: "http://www.petsmart.com/"

# ---- Landing page functionality ---

  #verify that each header item in each cathegory is accessible to user
  Scenario: Main page functionality - header navigation

  #verify that each footer item in each cathegory is accessible to user
  Scenario: Main page functionality - footer navigation

  Scenario: Main page functionality - external links - facebook
    Then Click on "facebook" icon
    Then Verify navigation to "Facebook"

  Scenario: Main page functionality - external links - hangouts
    Then Click on "hangouts" icon
    Then Verify navigation to "hangouts"

  Scenario: Main page functionality - external links - twitter
    Then Click on "twitter" icon
    Then Verify navigation to "twitter"

  Scenario: Main page functionality - external links - instagram
    Then Click on "instagram" icon
    Then Verify navigation to "instagram"

  Scenario: Main page functionality - external links - pinterest
    Then Click on "pinterest" icon
    Then Verify navigation to "pinterest"

  Scenario: Main page functionality - external links - youtube
    Then Click on "youtube" icon
    Then Verify navigation to "youtube"

  Scenario: Main page functionality - upcoming events wrapper
    Then Print out all upcoming events in wrapper

  Scenario: Main page functionality - search - valid search
    Then In search type "smth valid"
    Then Check that some results returned

  Scenario: Main page functionality - search - invalid search
    Then In search type "smth invalid"
    Then Check that no results returned (or some message)

  Scenario: Main page functionality - pet services wrapper - general ui
    Then In Pet service click on each item and verify that all promo messages are different

  Scenario: Main page functionality - pet services wrapper - link to all services

  Scenario: Main page functionality - pet services wrapper - link for each pet service

# ---- Dogs menu ---

  Scenario: Dog - Food and health - Brands
    Then In "Dog" menu go to "Food & health"
    Then In "Featured Brands" check that each brand navigates to the page with brand specific items

  Scenario: Dog - Food and health - top categories
    Then In "Dog" menu go to "Food & health"
    Then Check that each link in "Top Categories" works

  Scenario: Dog - Food - see 200 items verification
    Then In "Dog" menu go to "Food"
    Then Click "View 200 Items"
    Then Check that 200 items displayed

  Scenario: Dog - Food - pagination verification
    Then In "Dog" menu go to "Food"
    Then Go through all pages and print out all given items

  Scenario: Dog - Food - sorting - price high to low
    Then In "Dog" menu go to "Food"
    Then Set sorting to "price high to low"
    Then Verify correct sorting

  Scenario: Dog - Food - sorting - price low to high
    Then In "Dog" menu go to "Food"
    Then Set sorting to "price low to high"
    Then Verify correct sorting

  Scenario: Dog - Food - sorting - top rated
    Then In "Dog" menu go to "Food"
    Then Set sorting to "top rated"
    Then Verify correct sorting

  Scenario: Dog - Food - sorting - best sellers
    Then In "Dog" menu go to "Food"
    Then Set sorting to "best sellers"
    Then Verify correct sorting

  Scenario: Dog - Food - sorting - new arrivals
    Then In "Dog" menu go to "Food"
    Then Set sorting to "new arrivals"
    Then Verify correct sorting

# ---- Dog items - filtering ---

  Scenario: Dog - Food - filter - Brand
    Then In "Dog" menu go to "Food"
    Then Set filter for "Brand"
    Then Verify correct sorting

  Scenario: Dog - Food - filter - Flavor
    Then In "Dog" menu go to "Food"
    Then Set filter for "Flavor"
    Then Verify correct sorting

  Scenario: Dog - Food - filter - Breed
    Then In "Dog" menu go to "Food"
    Then Set filter for "Breed"
    Then Verify correct sorting

  Scenario: Dog - Food - filter - Price
    Then In "Dog" menu go to "Food"
    Then Set filter for "Price"
    Then Verify correct sorting

  Scenario: Dog - Food - filter - Rating

  Scenario: Dog - Food - filter - Ways To Shop

  Scenario: Dog - Food - filter - Health Consideration

# ---- Dog items - comparing ---

  Scenario: Dog - Food - comparing - adding 2 items

  Scenario: Dog - Food - comparing - adding 3 items

  Scenario: Dog - Food - comparing - adding more then 3 items

  Scenario: Dog - Food - comparing - removing 1-3 items

# ---- Dog items - shopping ---

  Scenario: Dog - Shopping - 1 item to cart - happy path

  Scenario: Dog - Shopping - 1 item to cart - size, quantity and flavor not selected

  Scenario: Dog - Shopping - 1 item to cart with removing

  Scenario: Dog - Shopping - 1 item to cart with proceeding

  Scenario: Dog - Shopping - adding miltiple items to cart with partial removal prior to proceeding
