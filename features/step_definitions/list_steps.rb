When /^I run: ruby big list tables "([^"]*)"$/ do |server|
  When("I run `ruby big list tables #{server}`")
end

Then /^all "([^"]*)"'s tables are listed$/ do |server|
  cmd = Bigmagic::ListCommand.new('config', nil, out)
  cmd.run("#{server}".split)
  cmd.tables.each do |tablename|
    Then("the output should contain \"#{tablename}\"")
  end
end
