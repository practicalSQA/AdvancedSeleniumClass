require 'rubygems'
require 'selenium-webdriver'
require 'cucumber'

$driver = Selenium::WebDriver.for :chrome
$wait = Selenium::WebDriver::Wait.new(:timeout => 10)