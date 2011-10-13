# language: en
Feature: list

  In order to inspect the data to migrate
  As a User
  I want to list tables in the server

  Scenario: list all tables in the target server
    Given that table "MCOMPA1F" exists in the "target" server
    When I run `ruby big list table`
    Then the command output shows the server's info
    And the command output shows the header "Name,Id,Created,Delete,Insert,Update,Select"
    And the command output includes table's info
