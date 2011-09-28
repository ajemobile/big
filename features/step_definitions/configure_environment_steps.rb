Then /^the output should contain key "([^"]*)" and value "([^"]*)"$/ do |key, value|
  Then("the output should contain \"#{key}\"")
  Then("the output should contain \"#{value}\"")
end
