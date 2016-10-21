Before do
  $driver.get("http://www.petsmart.com/")
  logo_element = $wait.until { $driver.find_element(xpath: "//img[@class='ws-logo-image']")}
end

After do
  $driver.quit
end