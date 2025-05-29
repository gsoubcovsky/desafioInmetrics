*** Settings ***
Resource              ../keywords/accountService/createAccount_kw.resource
Suite Teardown        Save API Results to Database
Documentation         This test suite is responsible for creating an ADMIN user account through the API.
...                   
...                   - It includes the necessary resource to handle account creation.
...                   - The test validates whether the API successfully processes the request to create an admin account.
...                   
...                   Expected result: A new admin user account is created and acknowledged by the API.

*** Test Cases ***
Create an Admin account
    Given the user creates an ADMIN account