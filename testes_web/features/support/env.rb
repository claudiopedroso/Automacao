require 'capybara/cucumber'
require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'site_prism'


Capybara.default_driver = :selenium
Selenium::WebDriver::Firefox::Binary.path = "C:\\Program Files\\Mozilla Firefox\\firefox.exe"
