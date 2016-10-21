require 'rubygems'
require 'selenium-webdriver'
require 'cucumber'
<<<<<<< Updated upstream
=======
require 'rspec'
require 'pry'
>>>>>>> Stashed changes

$driver = Selenium::WebDriver.for :chrome
$wait = Selenium::WebDriver::Wait.new(:timeout => 10)