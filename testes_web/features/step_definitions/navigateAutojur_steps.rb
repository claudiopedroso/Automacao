Given(/^I am on the Autojur homepage$/) do
  @page = Page.new
  @page.load
end

When(/^I fill the username information$/) do
  fill_in('login-form:username', :with => 'claudio.pedroso')
end

Then(/^I should see it on screen$/) do
  page.should have_field('login-form:username', :text => 'claudio.pedroso')
end

