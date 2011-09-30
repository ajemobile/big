require 'yaml'

Then /^the output should indicate the full name for the YAML file used \(default is "([^"]*)"\)$/ do |file|
  @filename = File.expand_path(file)
  Then("the output should contain \"#{@filename}\"")
end

Then /^the member "([^"]*)" with value "([^"]*)" should be saved into the file$/ do |key, value|
  config = YAML.load_file(@filename)
  config.send(key).should == value
end


Then /^the output should contain key "([^"]*)" and value "([^"]*)"$/ do |key, value|
  Then("the output should contain \"#{key}\"")
  Then("the output should contain \"#{value}\"")
end


