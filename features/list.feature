# language: en
Feature: list

  In order to inspect the data to migrate
  As a User
  I want to list tables from the servers

  Scenario: list all tables in the specified server
    When I run: ruby big list tables "source"
    Then all "source"'s tables are listed

  Scenario: set of tables in the specified server filtered with a SQL filter
    When I run: ruby big list tables --filter "compania='0001' and sucursal='01'" "source"
    Then all tables listed have at least one row where "compania='0001' and sucursal='01'"
