
Then(/^Check that menu item "([^"]*)" contains submenus$/) do |arg|

  $driver.get "http://www.petsmart.com/"
  element = $driver.find_element :xpath => "//span[@class='ws-category-title' and text() = '#{arg}']"
  element.click
  sleep 6
  listofsubmenu =$driver.find_elements :xpath => "//li[@class='ws-category-list-item ws-category-list-item-1 ws-category-list-item-odd pet-leftnav-family-item pet-leftnav-level1-item']"
  if listofsubmenu.empty?
  then puts "fgfgfgfgffg"
  else puts "we are the winners"
  end
end