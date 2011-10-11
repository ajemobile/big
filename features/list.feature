# language: en
Feature: list

  In order to inspect the data to migrate
  As a User
  I want to list tables in the server

  Scenario: list all tables in the target server
    Given that table "MCOMPA1F" exists in the "target" server
    When I run `ruby big list table`
    Then the command output includes the name of the table

  Scenario: list tables using regular expression matching the target server
    Given that tables "MCOMPA1F, TCOMPA2F" exists in the "target" server
    When I run `ruby big list table "^mcomp"`
    Then the command output includes "MCOMPA1F"
    But the command output does not include "TCOMPA2F"
