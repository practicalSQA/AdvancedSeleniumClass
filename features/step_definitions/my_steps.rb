Then(/^Navigate to "([^"]*)"$/) do |url|
  $driver.get(url)
  logo_element = $wait.until { $driver.find_element(xpath: "//img[@class='ws-logo-image']")}
end

Then(/^Check that menu item "([^"]*)" contains submenus$/) do |arg|
  dog_menu = $driver.find_element(xpath: "//span[@class='ws-category-title' and text()='#{arg}']")
  dog_menu.click
  $wait.until {$driver.find_element(xpath: "//li[text()='#{arg}']")}
  sub_categories = $driver.find_elements(xpath: "//div[@class='ws-group-contents']//span[@class='ws-category-title']")
  for i in sub_categories do
    puts i.text
  end
end

Then(/^Check footer menu "([^"]*)" with items$/) do |arg|
  puts arg
end

Then(/^Click on "([^"]*)" icon$/) do |arg|
  facebook_icon = $driver.find_element(xpath: "//a[text()='#{arg}']")
  facebook_icon.click
  tabs = $driver.window_handles
  puts tabs
  $driver.switch_to.window(tabs[1])
end

Then(/^Verify navigation to "([^"]*)"$/) do |arg|
  $wait.until{$driver.find_element(id: "pageTitle")}
  actual_title = $driver.find_element(xpath: "//h1[@id='pages_name']/span[text()='PetSmart']").text
  puts actual_title
  expect(actual_title).to eql("PetSmart")
end

Then(/^Print out all upcoming events in wrapper$/) do
  puts "hi"
end

Then(/^In search type "([^"]*)"$/) do |arg|
  puts arg
end

Then(/^Check that some results returned$/) do
  puts "hi"
end

Then(/^Check that no results returned \(or some message\)$/) do
  puts "hi"
end

Then(/^in Pet service click on each item and verify that all promo messages are different$/) do
  puts "hi"
end

Then(/^In "([^"]*)" menu go to "([^"]*)"$/) do |arg1, arg2|
  puts "hi"
end

Then(/^In "([^"]*)" check that each brand navigates to the page with brand specific items$/) do |arg|
  puts arg
end

Then(/^Check that each link in "([^"]*)" works$/) do |arg|
  puts arg
end

Then(/^Click "([^"]*)"$/) do |arg|
  puts arg
end

Then(/^Check that (\d+) items displayed$/) do |arg|
  puts arg
end

Then(/^Go through all pages and print out all given items$/) do
  puts "hi"
end

Then(/^Set sorting to "([^"]*)"$/) do |arg|
  puts arg
end

Then(/^Verify correct sorting$/) do
  puts "hi"
end

Then(/^Set filter for "([^"]*)"$/) do |arg|
  puts arg
end

Then(/^Add (\d+) random items into compare mode$/) do |arg|
  puts arg
end

Then(/^Remove one item from compare mode$/) do
  puts "hi"
end

