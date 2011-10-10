# language: en
Feature: list

  In order to inspect the data to migrate
  As a User
  I want to list tables in the server

  Scenario: list all tables in the target server
    Given that table "MCOMPA1F" exists in the "target" server
    When I run `ruby big list table`
    Then the command outputs should includes the header: "Name\s+Id\s+Created\s+Delete\s+Insert\s+Update\s+Select"
    And the command output includes the name of the table

  Scenario: list tables whose name match
    When I run `ruby big list table COMP.*`
    Then all tables whose name match with

  Scenario: list all tables in the source server
    When I run `ruby big list --source table`
    Then all tables of source server are listed

  Scenario: set of tables in the target server filtered with a SQL filter
    When I run: ruby big list --filter "compania='0001' and sucursal='01'" table
    Then all tables listed have at least one row where "compania='0001' and sucursal='01'"

  Scenario: set of tables in the source server filtered with a SQL filter
    When I run: ruby big list --source --filter "compania='0001' and sucursal='01'" table
    Then all tables listed have at least one row where "compania='0001' and sucursal='01'"
