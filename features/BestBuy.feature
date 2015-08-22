Feature: go through bestbuy

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
