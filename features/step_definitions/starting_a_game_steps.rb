Given(/^I am on the homepage$/) do
  visit '/'
end

Then(/^I should see the message "(.*?)"$/) do |message|
  expect(page).to have_content(message)
end

Given(/^I enter a username$/) do
  fill_in('username', :with => 'Badger')
end

Given(/^I click "(.*?)"$/) do |button|
  click_button('Register')
end
