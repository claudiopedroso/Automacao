Given(/^I am on the Google homepage$/) do
    visit 'http://www.google.com.br'
end

Then(/^I will search for "(.*?)"$/) do |searchText|
    fill_in 'lst-ib', :with => searchText
    click_button 'Pesquisa Google'
end

Then(/^I should see "(.*?)"$/) do |expectedText|
    expect(page).to have_content(expectedText)
end

Then(/^I will click the Leaderboard link$/) do
    click_link('Leaderboard')
end
