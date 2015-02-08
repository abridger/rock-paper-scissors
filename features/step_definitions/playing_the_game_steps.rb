Given(/^I have played a round$/) do
  click_button("rock")
end

Given(/^I play two more rounds$/) do
  click_button("paper")
  click_button("scissors")
end
