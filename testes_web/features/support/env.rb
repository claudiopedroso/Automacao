require 'capybara/cucumber'
require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

Capybara.default_driver = :selenium
Selenium::WebDriver::Firefox::Binary.path = "C:\\Program Files\\Mozilla Firefox\\firefox.exe"
