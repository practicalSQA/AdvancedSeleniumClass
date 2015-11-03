require 'rubygems'
require 'selenium-webdriver'
require 'cucumber'

$driver = Selenium::WebDriver.for :firefox
#$driver.get $basicurl
$driver.manage.window.maximize
