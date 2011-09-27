Then /^the output should be major than (\d+) bytes long$/ do |arg1|
  all_output.chomp.length.should > 0
end

Then /^the output should contain only one single line feed character at the end$/ do
  all_output[/\n+/].length.should == 1
end

Then /^the stdout from "([^"]*)" should be equal than "([^"]*)"$/ do |cmd1, cmd2|
  assert_exact_output(stdout_from(cmd1), stdout_from(cmd2))
end
