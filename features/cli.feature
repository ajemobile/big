#language: en
Feature: Command line interface

  In order to execute commands, create bath scripts and program Windows tasks
  As a User
  I want top use a command Line Interface (CLI)

  Scenario: Simple format output for each commands response
    When I run `big.bat`
    Then the output should be major than 0 bytes long
    And the output should contain only one single line feed character at the end

  Scenario: Default command is help
    When I run `big.bat`
    And I run `big.bat --help`
    And I run `big.bat help`
    Then the stdout from "big.bat" should be equal than "big.bat --help"
    And the stdout from "big.bat --help" should be equal than "big.bat"


