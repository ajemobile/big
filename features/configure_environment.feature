#language: en
Feature: Configure Environment
  
  In order to configure all the environment once
  As a User
  I want to set up, save and show all configured values using a command line tool
  
  Scenario: Configure a single command's attribure
    When I run `big.bat config target.ip 172.16.0.10`
    Then the output should contain exactly "target.ip = 172.16.0.10\n"

  Scenario: Configure two attributes using full qualified names
    When I run `big.bat config target.ip 172.16.0.10 target.port 1433`
    Then the output should contain exactly:
    """
    target.ip = 172.16.0.10
    target.port = 1433

    """
  Scenario: Configure two attributes using a parent command options
    When I run `big.bat config --parent target ip 172.16.0.10 port 1433`
    Then the output should contain exactly:
    """
    target.ip = 172.16.0.10
    target.port = 1433

    """


