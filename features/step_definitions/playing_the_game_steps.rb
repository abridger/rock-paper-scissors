Given(/^I have played a round$/) do
  click_button("Rock")
end

Given(/^I play two more rounds$/) do
  click_button("Paper")
  click_button("Scissors")
end
