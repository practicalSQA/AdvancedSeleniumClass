require 'rubygems'
require 'selenium-webdriver'
require 'cucumber'

$driver = Selenium::WebDriver.for :firefox
# $driver = Selenium::WebDriver.for :chrome
$driver.manage.timeouts.implicit_wait = 15