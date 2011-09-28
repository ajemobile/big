#language: en
Feature: Configure Environment
  
  In order to configure all the environment once
  As a User
  I want to set up, save and show all configured values using a command line tool
  
  Scenario: Configure a single command's attribure
    When I run `big.bat config target.ip 172.16.0.10`
    Then the output should contain "target:"
    And the output should contain key "ip:" and value "172.16.0.10"

  Scenario: Configure two attributes using full qualified names
    When I run `big.bat config target.ip 172.16.0.10 target.port 1433`
    Then the output should contain "target:"
    And the output should contain key "ip:" and value "172.16.0.10"
    And the output should contain key "port:" and value "1433"

  Scenario: Configure two attributes using a parent command options
    When I run `big.bat config --parent target ip 172.16.0.23 port 1111`
    Then the output should contain "target:"
    And the output should contain key "ip:" and value "172.16.0.23"
    And the output should contain key "port:" and value "1111"

