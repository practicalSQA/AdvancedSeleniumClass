Feature: go through bestbuy

"""Tasks:
+ 1. Search verification:
+ 1.1. Verify Search field returns results valid to given query
+ 1.2. Verify invalid query returns some message
+ 2. Items page:
+ 2.1. Trough search, go to any item page (e.g. hand blenders) and verify all filters:
+ 2.1.1 Brand
+ 2.1.2 Price
+ 2.1.3 Color
+ 2.1.4 Wattage
+ 2.1.5 Blender functions (or other if not blender used in query)
+ 2.1.6 Sold by
+ 2.2. Verify sorting on the page
+ 2.2.1 Items per page
+ 2.2.2 Sort by
"""


  Scenario: Search verification 1.1.
    Then Search for hand blender
    Then Verify Search field returns results valid to given query

  Scenario: Search verification 1.2.
    Then Search for hand blnder
    Then Verify invalid query returns some message

  Scenario: Items page - Trough search, go to any item page (e.g. hand blenders) and verify all filters 2.1.
#  Brand, Price, Color, Wattage, Blender functions (or other if not blender used in query), Sold by
    Then Search for blender
    Then Choose Brand 'Hamilton Beach', Price 'Less than 50', Color 'Silver', Wattage '200 - 299 Watts', Blender functions 'Pulse', Sold by 'Best Buy' and verify all filters

  Scenario: Items page - Verify sorting on the page
    Then Search for hand blender
    Then Verify quantity of items per page
    Then Verify Sort by Price Low to High

  Scenario: Verify GitHub works
#    Then Search for hand blender
#    Then Verify quantity of items per page
#    Then Verify Sort by Price Low to High