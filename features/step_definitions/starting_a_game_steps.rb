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

Given(/^I have registered$/) do
  step('I am on the homepage')
  step('I enter a username')
  step('I click "Register"')
end