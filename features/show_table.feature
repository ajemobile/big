#language: en
Feature: Show table

  In order to get information table
  As as User
  I want to select a table from target or source database

  Scenario: Select a table from target database
    When I run `big.bat show table martic1f`
    Then I should see exactly:
    """
    Target table: [172.16.0.10].[dbo].[martic1f]
    
    """

    
  
