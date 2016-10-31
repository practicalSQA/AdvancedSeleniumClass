require 'rubygems'
require 'selenium-webdriver'
require 'cucumber'

hgj
$driver = Selenium::WebDriver.for :chrome

#$driver = Selenium::WebDriver.for :firefox
#$driver.get $basicurl
$driver.manage.window.maximize
$dropdown = Selenium::WebDriver::Support::Select
