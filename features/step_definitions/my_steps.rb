# Scenario1: Main page functionality - header navigation
Then /^Check that menu item "([^"]*)" contains submenus$/ do |x|
  $driver.get "http://www.petsmart.com/"
  sleep 5
  element = $driver.find_element :xpath => "//span[@class='ws-category-title' and text() = '#{x}']"
  element.click
  sleep 10
  listofsubmenu =$driver.find_elements :xpath => "//li[@class='ws-category-list-item ws-category-list-item-1 ws-category-list-item-odd pet-leftnav-family-item pet-leftnav-level1-item']"
  if listofsubmenu.empty?
  then puts "Something went wrong"
  else puts "Works good.keep testing"
  end
end
#Scenario2: Main page functionality - footer navigation
Then /^Check footer menu "([^"]*)" with items$/ do |y|

  $driver.get "http://www.petsmart.com/"
  listofootsubmenu =$driver.find_elements :xpath => "//div[contains(@class, 'pet-footer-links-group')][position() >1][.//h3[contains(text(), '#{y}')]]//li/a"
  if listofootsubmenu.empty?
  then puts "try again"
  else puts listofootsubmenu.map  {|n| n.attribute("innerHTML")}
  end
end

# Scenario3-8: Main page functionality - external links - facebook/Hangouts/Twitter/Instagram/Pinterest/Youtube
Then /^Click on "([^"]*)" icon$/ do |icon|
  $driver.get "http://www.petsmart.com/"
  sleep 5
  element = $driver.find_element :xpath => "//a[@title= '#{icon}']"
  element.click
  sleep 8
end
Then /^Verify navigation to "([^"]*)"$/ do |site|
  $driver.switch_to.window $driver.window_handles.last
  assert $driver.title == "#{site}"
end

Then /^Verify user navigate to "([^"]*)"$/ do |site2|
  $driver.switch_to.window $driver.window_handles.last
  $driver.find_element(:xpath, "//title[contains(text(), '#{site2}')]").text.include? "'#{site2}'"
end
Then /^Print out all upcoming events in wrapper$/ do
  $driver.get "http://www.petsmart.com/"
  listofevents =$driver.find_elements(:xpath, "//div[@class = 'monthly-event-title']/span")
  if listofevents.empty?
  then puts "No events"
  else puts listofevents.map  {|n| n.attribute("innerHTML")}
  end
end
#Scenario10: Dog - Food - sorting - price low to high
Then /^In dog menu go to food$/ do
  $driver.get "http://www.petsmart.com/"
  sleep 5
  element =  $driver.find_element :xpath => "//ul[@class = 'ws-common-list pet-main-nav']/li/a/span[@class = 'ws-category-title' and text()= 'Dog']"
  sleep 10
  $driver.mouse.move_to element
  element = $driver.find_element :xpath => "//li[contains(@class, 'ws-common-list-item pet-main-nav-item-level1')][1]//span[@class = 'ws-category-title' and text()='Food']"
  sleep 10
  element.click
end
# Then /^Set sorting to "Low to high"$/ do
#   #$driver.get "http://www.petsmart.com/dog/food/cat-36-catid-100004"
#   dropd = $driver.find_element(:xpath, "//select[@name = 'SortingAttribute']")
#   variable = $dropdown.new(dropd)
#   variable.select_by(:value, 'ProductSalePrice-asc')
#   sleep 5
#   end
Then /^Set sorting to "Low to high" and verify correct sorting$/ do
  $driver.get "http://www.petsmart.com/dog/food/cat-36-catid-100004"
  sleep 8
  price =  $driver.find_elements :xpath =>"//div[@class = 'ws-group pet-prodloop']//span[contains(@class, 'kor-product-sale-price-value') and normalize-space(text())]"
  next_page = $driver.find_elements(:xpath, "//a[@class = 'ws-product-listing-pagination-link' and text() = 'to next page']")
  sleep 7
  arrayPrices = []
  while next_page.count > 0
    for j in price
      arrayPrices.push(j.text)
    end
    next_page[0].click
    sleep 7
    price =  $driver.find_elements :xpath =>"//div[@class = 'ws-group pet-prodloop']//span[contains(@class, 'kor-product-sale-price-value') and normalize-space(text())]"
    next_page = $driver.find_elements(:xpath, "//a[@class = 'ws-product-listing-pagination-link' and text() = 'to next page']")
  end
  for j in price
    sleep 3
    arrayPrices.push(j.text)
  end
  puts "All prices from 46 pages"
  puts arrayPrices
  arrayPricesSignRemove = []
  for i in arrayPrices do
    arrayPricesSignRemove.push(i.gsub!('$', ''))
  end
  arrayPricesModified = []
  for i in arrayPricesSignRemove do
    if i.include?('to')
      arrayPricesModified.push(i.split('to')[0].to_f)
    else
      arrayPricesModified.push(i.to_f)
    end
  end
  puts "Prices from all pages modified:"
  puts arrayPricesModified
  dropd = $driver.find_element(:xpath, "//select[@name = 'SortingAttribute']")
  variable = $dropdown.new(dropd)
  variable.select_by(:value, 'ProductSalePrice-asc')
  sleep 15
  pricesoted =  $driver.find_elements :xpath =>"//div[@class = 'ws-group pet-prodloop']//span[contains(@class, 'kor-product-sale-price-value') and normalize-space(text())]"
  next_page = $driver.find_elements(:xpath, "//a[@class = 'ws-product-listing-pagination-link' and text() = 'to next page']")
  sleep 7
  arraypricessorted = []
  while next_page.count > 0
    for j in pricesoted
      arraypricessorted.push(j.text)
    end
    next_page[0].click
    sleep 7
    pricesoted  =  $driver.find_elements :xpath =>"//div[@class = 'ws-group pet-prodloop']//span[contains(@class, 'kor-product-sale-price-value') and normalize-space(text())]"
    next_page = $driver.find_elements(:xpath, "//a[@class = 'ws-product-listing-pagination-link' and text() = 'to next page']")
  end
  for j in pricesoted
    sleep 3
    arraypricessorted.push(j.text)
  end
  puts "All sorted prices from 46 pages"
  puts arraypricessorted
  arraypricesSortedSignRemove = []
  for i in arraypricessorted do
    arraypricesSortedSignRemove.push(i.gsub!('$', ''))
  end
  arrayPricesSortedModified = []
  for i in arraypricesSortedSignRemove do
    if i.include?('to')
      arrayPricesSortedModified.push(i.split('to')[0].to_f)
    else
      arrayPricesSortedModified.push(i.to_f)
    end
  end
  puts "Prices from all pages modified:"
  puts arrayPricesSortedModified
  x = arrayPricesModified.sort
  puts "Sorted for testing"
  puts x
  if x ==  arrayPricesSortedModified
    puts 'Prices sorted from Low to High correct'
  else raise "BUG!!! Sorting by Price Low to High is not correct!!!"
  end
end
#Scenario11: Main page functionality - search - valid search
Then /^In search type ([^"]*)$/ do |x|
  $driver.get "http://www.petsmart.com/"
  sleep 3
  element = $driver.find_element(:id, "searchForm")
  element.send_keys x
  sleep 3
  searchbutton  = $driver.find_element(:xpath, "//button[@class = 'ws-search-submit']")
  searchbutton.click
  sleep 3
end

Then /^Check that some results returned ([^"]*)$/ do |y|
  items = $driver.find_elements(:xpath, "//h4[@class = 'ws-product-title fn']")
  for i in items
    if i.text.include? y
      puts "Item contain text:" + y + "Item:" + i.text
    else raise "BUG!!!"
    end
  end
end
#Scenario12: Main page functionality - search - invalid search
Then /^Check that no results "([^"]*)" returned and message "([^"]*)"$/ do |word, message|
  item = $driver.find_element(:xpath, "//div[@class = 'ws-group pet-heading-group pet-search-title pet-dym-title-top']//h1[@class = 'ws-heading']")
  if item.text.include? message
    puts "No reults for: " + word + " Displayed message is: " + message
  else raise "BUG!!! Check searched word"
  end
end
#Scenario13: Main page functionality - pet services wrapper
Then /^in Pet service click on each item and verify that all promo messages are different$/ do
  $driver.get "http://www.petsmart.com/"
  sleep 5
  servicemenu = $driver.find_elements(:xpath, "//ul[@class = 'pet-services__nav']//a")
  message = $driver.find_elements(:xpath, "//h3[@style = 'color: #fff;']")
  sleep 4
  messages = []
  n = 0
  for i in servicemenu do
    i.click
    y = message[n].text.to_s
    sleep 3
    messages.push(y)
    n = n+1
  end
  puts "Array of messages:"
  puts messages
  messages2 = messages.uniq
  if messages == messages2
    puts "All messages are different"
  else raise "BUG!!! You have duplicates"
  end
end
#Scenario14: Dog - Food and health - Brands
Then /^In "Dog" menu go to "Food & health"$/ do
  $driver.get("http://www.petsmart.com/small-pet/food-care/cat-36-catid-100001")
  sleep 2
end
Then /^In "Featured Brands" check that each brand navigates to the page with brand specific items$/ do
  list_of_brands = $driver.find_elements(:xpath, "//div[contains(@class, 'layout__content-width-column--fith gutter')]//img[@alt]")
  sleep 3
  n = 1
  for i in list_of_brands do
    brand = $driver.find_element(:xpath, "(//div[contains(@class, 'layout__content-width-column--fith gutter')]//img[@alt])["+n.to_s+"]")
    m = brand.attribute('alt')
    puts "Icon name is  " + m
    brand.click
    sleep 5
    items = $driver.find_elements(:xpath, "//h4[@class = 'ws-product-title fn']")
    for b in items do
      if b.text.include? "'"
        b = b.text.gsub!("'", "").upcase
      elsif b.text.upcase.include? "GREAT"
        b = b.text.upcase.gsub!("GREAT", "GRREAT").upcase
      else
        b = b.text.upcase
      end
      if b.include? m.upcase.split()[0] or b.include? m
        puts "Page contains specific brand  " + m + "." + "  Item is:  " + b
      else raise "Item doesn't have brand  " + m + "Item name is    ." + b
      end
    end
    sleep 5
    $driver.navigate.back
    sleep 8
    n = n+1
  end
  sleep 5
end
#Scenario16: Dog - Food - see 200 items verification
Then /^Click "View 200 Items"$/ do
  itemsbutton = $driver.find_element(:xpath, "(//a[contains(@class,'ws-product-listing-view-all-items')])[1]").click
  sleep 5
end
Then /^Check that 200 items displayed$/ do
  items = $driver.find_elements(:xpath, "//h4[@class = 'ws-product-title fn']")
  if items.length == 200
    puts "Page is displayed 200 items"
  else raise "Bug.Something wrong"
  end
end
#  Scenario17: Dog - Food - pagination verification
Then /^Go through all pages and print out all given items$/ do
  items = $driver.find_elements(:xpath, "//h4[@class = 'ws-product-title fn']")
  puts items.map  {|n| n.attribute("innerHTML")}
  next_page = $driver.find_elements(:xpath, "//a[@class = 'ws-product-listing-pagination-link' and text() = 'to next page']")
  sleep 5
  array = []
  while next_page.count > 0
    #puts price.map  {|n| n.attribute("innerHTML")}
    next_page[0].click
    items = $driver.find_elements(:xpath, "//h4[@class = 'ws-product-title fn']")
    puts items.map  {|n| n.attribute("innerHTML")}
    sleep 7
    next_page = $driver.find_elements(:xpath, "//a[@class = 'ws-product-listing-pagination-link' and text() = 'to next page']")
  end
  puts "All fine"
end
#  Scenario18: Dog - Food - sorting - price high to low
Then /^Set sorting to "High to low" and verify correct sorting$/ do
# $driver.get "http://www.petsmart.com/dog/food/cat-36-catid-100004"
  sleep 8
  price =  $driver.find_elements :xpath =>"//div[@class = 'ws-group pet-prodloop']//span[contains(@class, 'kor-product-sale-price-value') and normalize-space(text())]"
  next_page = $driver.find_elements(:xpath, "//a[@class = 'ws-product-listing-pagination-link' and text() = 'to next page']")
  sleep 7
  arrayPrices = []
  while next_page.count > 0
    for j in price
      arrayPrices.push(j.text)
    end
    next_page[0].click
    sleep 7
    price =  $driver.find_elements :xpath =>"//div[@class = 'ws-group pet-prodloop']//span[contains(@class, 'kor-product-sale-price-value') and normalize-space(text())]"
    next_page = $driver.find_elements(:xpath, "//a[@class = 'ws-product-listing-pagination-link' and text() = 'to next page']")
  end
  for j in price
    sleep 3
    arrayPrices.push(j.text)
  end
  puts "All prices from 46 pages"
  puts arrayPrices
  arrayPricesSignRemove = []
  for i in arrayPrices do
    arrayPricesSignRemove.push(i.gsub!('$', ''))
  end
  arrayPricesModified = []
  for i in arrayPricesSignRemove do
    if i.include?('to')
      arrayPricesModified.push(i.split('to')[0].to_f)
    else
      arrayPricesModified.push(i.to_f)
    end
  end
  puts "Prices from all pages modified:"
  puts arrayPricesModified
  dropd = $driver.find_element(:xpath, "//select[@name = 'SortingAttribute']")
  variable = $dropdown.new(dropd)
  variable.select_by(:value, 'ProductSalePrice-desc')
  sleep 15
  pricesoted =  $driver.find_elements :xpath =>"//div[@class = 'ws-group pet-prodloop']//span[contains(@class, 'kor-product-sale-price-value') and normalize-space(text())]"
  next_page = $driver.find_elements(:xpath, "//a[@class = 'ws-product-listing-pagination-link' and text() = 'to next page']")
  sleep 7
  arraypricessorted = []
  while next_page.count > 0
    for j in pricesoted
      arraypricessorted.push(j.text)
    end
    next_page[0].click
    sleep 7
    pricesoted  =  $driver.find_elements :xpath =>"//div[@class = 'ws-group pet-prodloop']//span[contains(@class, 'kor-product-sale-price-value') and normalize-space(text())]"
    next_page = $driver.find_elements(:xpath, "//a[@class = 'ws-product-listing-pagination-link' and text() = 'to next page']")
  end
  for j in pricesoted
    sleep 3
    arraypricessorted.push(j.text)
  end
  puts "All sorted prices from 46 pages"
  puts arraypricessorted
  arraypricesSortedSignRemove = []
  for i in arraypricessorted do
    arraypricesSortedSignRemove.push(i.gsub!('$', ''))
  end
  arrayPricesSortedModified = []
  for i in arraypricesSortedSignRemove do
    if i.include?('to')
      arrayPricesSortedModified.push(i.split('to')[0].to_f)
    else
      arrayPricesSortedModified.push(i.to_f)
    end
  end
  puts "Prices from all pages modified:"
  puts arrayPricesSortedModified
  x = arrayPricesModified.sort.revert
  puts "Sorted for testing"
  puts x
  if x ==  arrayPricesSortedModified
    puts 'Prices sorted  High to Low correct'
  else raise "BUG!!! Sorting by Price High to Low is not correct!!!"
  end
end
#  Scenario19: Dog - Food - sorting - top rated

Then /^Set sorting to "top rated" and verify correct  sorting$/ do
  rates =  $driver.find_elements(:xpath, "//div[@class = 'ws-group pet-prodloop-rating-group ws-stars']//span")
  next_page = $driver.find_elements(:xpath, "//a[@class = 'ws-product-listing-pagination-link' and text() = 'to next page']")
  sleep 7
  arrayRates = []
  while next_page.count > 0
    for j in rates
      arrayRates.push(j.text.to_f)
    end
    next_page[0].click
    sleep 7
    rates =  $driver.find_elements(:xpath, "//div[@class = 'ws-group pet-prodloop-rating-group ws-stars']//span")
    next_page = $driver.find_elements(:xpath, "//a[@class = 'ws-product-listing-pagination-link' and text() = 'to next page']")
  end
  for j in rates
    sleep 3
    arrayRates.push(j.text.to_f)
  end
  puts arrayRates
  dropd = $driver.find_element(:xpath, "//select[@name = 'SortingAttribute']")
  variable = $dropdown.new(dropd)
  variable.select_by(:value, 'AverageRating-desc')
  sleep 15
  ratesoted =  $driver.find_elements(:xpath, "//div[@class = 'ws-group pet-prodloop-rating-group ws-stars']//span")
  next_page = $driver.find_elements(:xpath, "//a[@class = 'ws-product-listing-pagination-link' and text() = 'to next page']")
  sleep 7
  arrayRatesSorted = []
  while next_page.count > 0
    for j in ratesoted
      arrayRatesSorted.push(j.text.to_f)
    end
    next_page[0].click
    sleep 7
    ratesoted =  $driver.find_elements(:xpath, "//div[@class = 'ws-group pet-prodloop-rating-group ws-stars']//span")
    next_page = $driver.find_elements(:xpath, "//a[@class = 'ws-product-listing-pagination-link' and text() = 'to next page']")
  end
  for j in ratesoted
    sleep 3
    arrayRatesSorted.push(j.text.to_f)
  end
  puts arrayRatesSorted
  if arrayRatesSorted == arrayRates.sort.reverse
    puts 'Items sorted by Top rated'
  else raise "BUG!!! Sorting by Top rated is not correct!!!"
  end
end
Then /^Rates$/ do
  rates =  $driver.find_elements(:xpath, "//div[@class = 'ws-group pet-prodloop-rating-group ws-stars']//span")
  newarray = []
  for i in rates do
    newarray.push(i.text.to_f)
  end
  puts newarray
end



#  Scenario15: Dog - Food and health - top categories
#    Then In "Dog" menu go to "Food & health"
#    Then Check that each link in "Top Categories" works
#16

#Scenario27 Dog - Food - comparing - adding 2 items
Then /^In "Dog" menu go to "Food"$/ do
  $driver.get("http://www.petsmart.com/dog/food/cat-36-catid-100004")
  sleep 5
end
Then /^Add 2 random items into compare mode$/ do
  items = $driver.find_elements(:xpath, "//div[contains(@class, 'ws-group pet-family-content pet-content')]//input[@class = 'ws-compare-link-checkbox' and @type = 'checkbox']")
  for i in 0..1 do
    items.sample.click
    sleep 2
  end
  checkeditems = []
  items2 = $driver.find_elements(:xpath, "//div[contains(@class, 'ws-group pet-family-content pet-content')]//input[@class = 'ws-compare-link-checkbox' and @type = 'checkbox']")
  for i in items2 do
    if i.selected?
      checkeditems.push(i)
    end
  end
  puts "All fine " + checkeditems.length.to_s +  " items were added to comparison"
end
#Scenario28: Dog - Food - comparing - adding 3 items
Then /^Add 3 random items into compare mode$/ do
  items = $driver.find_elements(:xpath, "//div[contains(@class, 'ws-group pet-family-content pet-content')]//input[@class = 'ws-compare-link-checkbox' and @type = 'checkbox']")
  for i in 0..2 do
    items.sample.click
    sleep 2
  end
end
#Scenario29: Dog - Food - comparing - adding more then 3 items
Then /^Add 4 random items into compare mode$/ do
  items = $driver.find_elements(:xpath, "//div[contains(@class, 'ws-group pet-family-content pet-content')]//input[@class = 'ws-compare-link-checkbox' and @type = 'checkbox']")
  for i in 0..3 do
    items.sample.click
    sleep 2
  end
  message  = $driver.find_elements(:xpath, "//div[@class = 'kor-overlay-content']/div")
  if message.count > 0
    puts "Error message: " + message.text
  else raise "Something wrong. Message is not displayed"
  end
end
# Scenario30: Dog - Food - comparing - removing 1-3 items-verify that differnt type removing works correctly(uncheck box, tap remove button, from comparison bar)

Then /^From compare mode remove 1st item  and verify that item was removed$/ do
  items = $driver.find_elements(:xpath, "//ul[@class = 'ws-product-list pet-compare-list']//a[contains(@class,'ws-compare-link-remove')]")
  items[1].click
  itemsAfterRemoving = $driver.find_elements(:xpath, "//div[contains(@class, 'ws-group pet-family-content pet-content')]//input[@class = 'ws-compare-link-checkbox' and @type = 'checkbox']")
  selecteditems = []
  for i in itemsAfterRemoving do
    if i.selected?
      selecteditems.push(i)
    end
  end
  if selecteditems.length == 2
    puts "3d items was removed. You have 2 more"
  else raise "Bug. Probably item was not removed"
  end

end
Then  /^Tap Remove button to remove 2nd item ,  verify that item was removed$/ do
  items = $driver.find_elements(:xpath, "//div[@class = 'ws-compare-link-add-container active-compare']//a[contains(@class,'ws-compare-link-remove')]")
  items[0].click
  itemsAfterRemoving = $driver.find_elements(:xpath, "//div[contains(@class, 'ws-group pet-family-content pet-content')]//input[@class = 'ws-compare-link-checkbox' and @type = 'checkbox']")
  selecteditems = []
  for i in itemsAfterRemoving do
    if i.selected?
      selecteditems.push(i)
    end
  end
  if selecteditems.length == 1
    puts "2nd Item was removed. You have 1 more"
  else raise "Bug. Probably item was not removed"
  end
end
Then /^Uncheck box  to remove 3d item  and verify that item was removed$/ do
  items = $driver.find_elements(:xpath, "//div[contains(@class, 'ws-group pet-family-content pet-content')]//input[@class = 'ws-compare-link-checkbox' and @type = 'checkbox']")
  for i in items do
    if i.selected?
      i.click
    end
  end
  items2 = $driver.find_elements(:xpath, "//div[contains(@class, 'ws-group pet-family-content pet-content')]//input[@class = 'ws-compare-link-checkbox' and @type = 'checkbox']")
  selecteditems = []
  for j in items2 do
    if j.selected?
      selecteditems.push(j)
    else "Unselect doesn't work"
    end
  end
  if selecteditems.length == 0
    puts  "All items were succesfully removed"
  else raise "Bug. Probably item was not removed"
  end
end
# Scenario31: Dog - Shopping - 1 item to cart - all fine
Then /^Add random item to card$/ do
  items = $driver.find_elements(:xpath, "//h4[@class = 'ws-product-title fn']")
  sleep 3
  items.sample.click
end

Then /^Choose size, flavor and quantity and add to cart$/ do
  selectoptions = $driver.find_elements(:xpath, "//div[@class = 'kor-select-text-viewport-contents']")
  sleep 5
  if selectoptions.count > 0
    for i in selectoptions do
      i.click
      sleep 5
      options = $driver.find_elements(:xpath, "//ul[contains(@class, 'kor-select-list')]//li")
      options[1].click
      sleep 5
    end
  end
  cartButton = $driver.find_element(:xpath, "//button[@type = 'submit' and text() = 'Add to Cart']").click

end

Then /^Verify that 1 item in cart$/ do
  qty = $driver.find_element(:xpath, "//td[@class = 'ws-cart-qty ws-cart-line-item']//input")
  x = qty.attribute("value")
  sleep 3
  if x.to_i == 1
    puts x + "item in cart"
  else raise "BUG!!! Qty of item is not 1"
  end
end
# Scenario 32: Dog - Shopping - 1 item to cart - size, quantity and flavor not selected
Then /^Verify that error message notifies user to select options$/ do
  items = $driver.find_elements(:xpath, "//h4[@class = 'ws-product-title fn']")
  sleep 3
  items.sample.click
  dropdowns = $driver.find_elements(:xpath, "//div[contains(@class, 'kor-select-text-viewport-contents')]")
  while dropdowns.count == 0
    puts "Let me try different item. This item doesn't have select options"
    $driver.navigate.back
    items = $driver.find_elements(:xpath, "//h4[@class = 'ws-product-title fn']")
    sleep 3
    items.sample.click
    sleep 3
    dropdowns = $driver.find_elements(:xpath, "//div[contains(@class, 'kor-select-text-viewport-contents')]")
  end
  if dropdowns.count > 0
    cartButton = $driver.find_element(:xpath, "//button[@type = 'submit' and text() = 'Add to Cart']").click
    sleep 2
    message =  $driver.find_elements(:xpath,"//div[@class = 'ws-heading  pet-page-level-error-text-heading']")
    if message.count > 0
      puts message.map  {|n| n.attribute("innerHTML")}
      puts "Error message is displayed"
    else raise "Error message was not displayed"
    end
  end
end
#Scenario33: Dog - Shopping - 1 item to cart with removing
Then /^Remove item from cart and verify that no items in cart$/ do

  remove_button = $driver.find_element(:xpath, "//button[@class = 'ws-remove ws-cart-remove']").click
  sleep 3
  message2 = $driver.find_elements(:xpath, "//div[@class = 'ws-heading  ws-cart-noitems-header-heading' and text() = 'There are no items in your cart.']")
  if message2.count > 0
    puts "No items in cart"
    puts message2.map  {|n| n.attribute("innerHTML")}
  else raise "BUG! Items were not removed or message is not displayed"
  end
end
#Scenario34: Dog - Shopping - 1 item to cart with proceeding
Then /^Tap Checkout button and verify thet user on Checkout page$/ do
  checkout_button = $driver.find_element(:xpath, "//div[@class = 'ws-cart-summary-controls']//button[@class = 'ws-button ws-proceed-to-checkout']").click
  sleep 3
  checkout_page_element = $driver.find_element(:xpath, "//h3[@class  = 'ws-heading ' and text() = 'Checkout']")
  continue_checkout_button = $driver.find_element(:xpath, "//button[@class = 'ws-button ws-submit' and text() = 'Continue checkout']")
  puts "User on the Checkout page"
end
