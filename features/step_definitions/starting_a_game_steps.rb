Given(/^I am on the homepage$/) do
    visit '/'
end

Then(/^I should see the message "(.*?)"$/) do |message|
    expect(page).to have_content(message)
end

Given(/^I enter a username$/) do
    fill_in('username', :with => 'Badger')
end

Given(/^I click the button "(.*?)"$/) do |button|
    click_button(button)
end

Given(/^I click the link "(.*?)"$/) do |link_text|
  click_link(link_text)
end

Given(/^I have registered$/) do
    visit '/reset'
    visit '/'
    fill_in('username', :with => 'Badger')
    click_button('Register')
end

def in_browser(name)
  old_session = Capybara.session_name
  Capybara.session_name = name
  yield
  Capybara.session_name = old_session
end
