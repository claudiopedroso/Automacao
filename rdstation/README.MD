QA Engineer Candidate - Cláudio Pedroso, CTFL

1. Purpose of this file

  This file describes the steps necessary to run the automated functional tests created as part of the QA Engineer recruitment process at Resultados Digitais.

2. Setting up the test environment

  Requirements:
  Windows 10 OS,
  Mozilla Firefox 54.0.1,
  Ruby 2.4.1p111 - Installed using RubyInstaller 2.4.1-2 (x64) <https://rubyinstaller.org/downloads/>,
  Geckodriver.exe <https://github.com/mozilla/geckodriver/releases> added to $PATH

  Download  or clone (git clone <url>) the rdstation project from Github <https://github.com/claudiopedroso/Automacao>

  Navigate to ~/Automacao/rdstation, install bundler (gem install bundler) and run (bundle install)

3. Running the tests
  At the /rdstation folder, run cucumber -f html. At the end of the tests, a report will be available at the project folder.
