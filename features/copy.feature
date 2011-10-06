# language: en
Feature: Copy

  In order to simplify migration data
  As a User
  I want to copy tables from the source to the destination server

  Scenario: Copy tables with filter
    Given target server does not have data for "compania='0001' and sucursal='01'"`
    When I run `ruby big copy rows --filter "compania='0001' and sucursal='01'"`
    Then all tables with both fields "compania" and "sucursal" will be copied

    



  
  

