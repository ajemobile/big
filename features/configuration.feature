#language: en
Feature: Configure Environment
  
  In order to configure all the environment once
  As a User
  I want to set up, save and show all configured values using a command line tool
  
  Scenario: Configure target ip using full qualified names
    When I run `big.bat big config target.ip X.Y.Z.W`
    Then the output should contain "target:"
    And the output should contain key "ip:" and value "X.Y.Z.W"

  Scenario: Configure target ant port using full qualified names
    When I run `ruby big config target.ip 172.16.0.10 target.port 1433`
    Then the output should contain "target:"
    And the output should contain key "ip:" and value "172.16.0.10"
    And the output should contain key "port:" and value "1433"

  Scenario: Configure target and port using parent section
    When I run `ruby big config --section target ip 172.16.0.23 port 1111`
    Then the output should contain "target:"
    And the output should contain key "ip:" and value "172.16.0.23"
    And the output should contain key "port:" and value "1111"

