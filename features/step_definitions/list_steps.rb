Given /^that table "([^"]*)" exists in the "([^"]*)" server$/ do |tablename, server|
  @tablename = tablename
  puts "The table #{tablename} should exist in the #{server} server"
end

Then /^the command output includes the name of the table$/ do
  Then("the output should contain \"#{@tablename}\"")
end
