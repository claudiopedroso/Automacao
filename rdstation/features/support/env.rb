require 'capybara/cucumber'
require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'nokogiri'
require 'open-uri'


Capybara.default_driver = :selenium
Selenium::WebDriver::Remote::Capabilities
Selenium::WebDriver::Firefox::Binary.path = "C:\\Program Files\\Mozilla Firefox\\firefox.exe"
