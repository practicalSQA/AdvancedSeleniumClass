# Scenario: Search verification 1.1.
Then /^Search for ([^"]*)$/ do |x|
  $driver.get ("http://www.bestbuy.com")
  element = $driver.find_elements(:xpath, "//div[@class = 'modal-content']//button[@class = 'close']")
  if element.count > 0
    element[0].click
  end
  input = $driver.find_element(:xpath, "//input[@id = 'gh-search-input']")
  input.send_keys x
  element = $driver.find_element(:xpath, "//button[@class = 'search-button']")
  element.click
end
Then /^Verify Search field returns results valid to given query$/ do
  items = $driver.find_elements(:xpath, "//div[@class = 'list-item']//h4/a[contains(text(), 'Hand Blender')]")
  for i in items do
    puts i.text
    if i.text.include? "Hand Blender"
      puts "Item contains searched text"
    else raise "Oops"
    end
  end
end

# Scenario: Search verification 1.2.
# Then /^Search for hand blnder$/ do
#   $driver.get ("http://www.bestbuy.com")
#   element = $driver.find_elements(:xpath, "//div[@class = 'modal-content']//button[@class = 'close']")
#   if element.count > 0
#     element[0].click
#   end
#   input = $driver.find_element(:xpath, "//input[@id = 'gh-search-input']")
#   input.send_keys "hand blnder"
#   element = $driver.find_element(:xpath, "//button[@class = 'search-button']")
#   element.click
# end
Then /^Verify invalid query returns some message$/ do
  error_msg = $driver.find_elements(:xpath, "//div[@class = 'corrected-query']")
  if error_msg.count>0
    puts "Error message displayed: " + error_msg[0].text
  else raise "Opps, no error message"
  end
end

# Scenario: Items page - Trough search, go to any item page (e.g. hand blenders) and verify all filters 2.1
#  Brand, Price, Color, Wattage, Blender functions (or other if not blender used in query), Sold by
Then /^Choose Brand '([^"]*)', Price 'Less than 50', Color '([^"]*)', Wattage '200 - 299 Watts', Blender functions '([^"]*)', Sold by '([^"]*)' and verify all filters$/ do |br, col, fun, sold|
  brand = $driver.find_element(:xpath, "//div[@class = 'row']/div/label[text() = '#{br}']")
  brand.click
  price = $driver.find_element(:xpath, "//div[@class = 'row']/div/label[text() = 'Less than $50']")
  price.click
  color = $driver.find_element(:xpath, "//div[@class = 'row']/div/label[text() = '#{col}']")
  color.click
  watt = $driver.find_element(:xpath, "//div[@class = 'row']/div/label[text() = '200 - 299 Watts']")
  watt.click
  func = $driver.find_element(:xpath, "//div[@class = 'row']/div/label[text() = '#{fun}']")
  func.click
  sold_by = $driver.find_element(:xpath, "//div[@class = 'row']/div/label[text() = '#{sold}']")
  sold_by.click
  items = $driver.find_elements(:xpath, "//div[@class = 'list-item']//h4/a")
  puts "Quantity if items: " + items.count.to_s
  for i in items do
    puts i.text
    i.click
    brand_filter = $driver.find_element(:xpath, "//div[@id = 'sku-title']/h1")
    if brand_filter.text.include? br
      puts "Brand is correct"
    else puts brand_filter.text
    raise "Brand is not correct"
    end
    price_filter = $driver.find_element(:xpath, "//div[@class = 'item-price']")
    a = price_filter.text.sub!('$', '').to_i
    if a < 50
      puts "Price is correct"
    else puts price_filter.text
    raise "Price >=50"
    end
    spec = $driver.find_element(:xpath, "//a[@id = 'ui-id-2']")
    spec.click
    color_filter = $driver.find_element(:xpath, "//tr[*]/th[ text() = 'Color Category']/following-sibling::td[1]")
    if color_filter.text.include? col
      puts "Color is correct"
    else puts brand_filter.text
    raise "Color is not" + col
    end
    watt_filter = $driver.find_element(:xpath, "//tr[*]/th[ text() = 'Wattage']/following-sibling::td[1]")
    b = watt_filter.text.sub!(' watt', '').to_i
    if b > 200 and b < 299
      puts "Wattage is correct"
    else puts watt_filter.text
    raise "Wattage is not between 200-299"
    end
    func_filter = $driver.find_element(:xpath, "//tr[*]/th[ text() = 'Pulse Function']/following-sibling::td[1]")
    if func_filter.text.include? "Yes"
      puts "Function is correct"
    else puts brand_filter.text
    raise "Item doesn't have function" + fun
    end
    sold_by_filter = $driver.find_elements(:xpath, "//div[@class = 'pickup-time-message ']/b[text() = 'Store Pickup:']")
    if sold_by_filter.count > 0
      puts "Seller is correct"
    else raise "Seller is not correct"
    end
  end
end

# Scenario: Items page - Verify sorting on the page
Then /^Verify quantity of items per page$/ do
  itemperpage = $driver.find_element(:xpath, "//select[@id = 'itemsPerPage']")
  itemperpage_option = Selenium::WebDriver::Support::Select.new(itemperpage)
  itemperpage_option.select_by(:value,"25")
  items = $driver.find_elements(:xpath, "//div[@class = 'list-item']//h4/a")
  itemperpage = $driver.find_element(:xpath, "//select[@id = 'itemsPerPage']")
  itemperpage_option = Selenium::WebDriver::Support::Select.new(itemperpage)
  x = itemperpage_option.first_selected_option.text.to_i
  puts "Quantity of items per page is: " + items.count.to_s
  if items.count == x
    puts "Sorting by quantity items per page is correct!"
  else raise "BUG!!! Sorting by quantity items per page is not correct!"
  end
end
Then /^Verify Sort by Price Low to High$/ do
  array_for_not_sorted_items = []
  not_sorted_items = $driver.find_elements(:xpath, "//div[@class = 'list-item']//h4/a")
  for i in not_sorted_items do
    a = i.text.sub!('$', '').to_f
    array_for_not_sorted_items.push(a)
  end
  sort_by = $driver.find_element(:xpath, "//select[@id = 'sortBy']")
  sort_by_option = Selenium::WebDriver::Support::Select.new(sort_by)
  sort_by_option.select_by(:text,"Price Low to High")
  array_sorted_by_bestbuy = []
  sorted_items = $driver.find_elements(:xpath, "//div[@class = 'list-item']//h4/a")
  for i in sorted_items do
    b = i.text.sub!('$', '').to_f
    array_sorted_by_bestbuy.push(b)
  end
  c = array_for_not_sorted_items.sort
  if array_sorted_by_bestbuy == c
    puts "Sorting by Low to High Price is correct!"
  else raise "BUG!!! Sorting by Low to High Price is not correct!!!"
  end
end
