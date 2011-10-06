# language: en
Feature: Move

  In order to simplify migration data
  As a User
  I want to move rows from the source to the destination server

  Scenario: move rows with sql filter
    Given target server does not have rows where "compania='9999' and sucursal='03'"`
    When I run `ruby big move rows --filter "compania='0001' and sucursal='01'" "compania='9999'" "sucursal='03'"`
    Then all modified tables into target server have at least one row where "compania='9999' and sucursal='03'"

    



  
  

