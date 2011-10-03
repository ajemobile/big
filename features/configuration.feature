#language: en
Feature: Configure Environment
  
  In order to configure all the environment once
  As a User
  I want to set up, save and show all configured values using a command line tool

  Scenario Outline: Configure a single key/value pair using full qualified name
    When I run: "ruby big config" "<key>" "<value>"
    Then the "<key>"/"<value>" pair should be saved into "etc/bigmagic.yml"
    And the output should show the fullpath of the configuration file used
    And the output should show "<key>" = "<value>"

  Scenarios:
  | key                    | value       |
  | target.ip              | 172.16.0.10 |
  | target.port            | 1433        |
  | target.username        | ajegroup    |
  | target.password        | ajegroup    |
  | target.database.name   | bdcertifica |
  | target.database.schema | dbo         |
  | source.ip              | 172.16.0.10 |
  | source.port            | 1433        |
  | source.username        | ajegroup    |
  | source.password        | ajegroup    |
  | source.database.name   | bdcertifica |
  | source.database.schema | dbo         |

  Scenario: Show the current configuration environment
    When I run `ruby big config`
    And the output should show the fullpath of the configuration file used
    And the output should show "key" = "value"


