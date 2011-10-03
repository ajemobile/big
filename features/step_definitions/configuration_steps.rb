When /^I run: "([^"]*)" "([^"]*)" "([^"]*)"$/ do |command, param1, param2|
  When("I run `#{command} #{param1} #{param2}`")
end

Then /^the "([^"]*)"\/"([^"]*)" pair should be saved into "([^"]*)"$/ do |key, value, filename|
  @fullpath = File.expand_path(filename)
  config = YAML.load_file(@fullpath)
  eval("config.#{key}.should == \"#{value}\"")
end

Then /^the output should show the fullpath of the configuration file used$/ do
  Then("the output should contain \"#{@fullpath}\"")
end

Then /^the output should show "([^"]*)" = "([^"]*)"$/ do |key, value|
  Then("the output should contain \"#{key} = #{value}\"")
end
