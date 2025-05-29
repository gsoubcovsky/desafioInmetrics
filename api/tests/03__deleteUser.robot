*** Settings ***
Resource              ../keywords/accountService/deleteAccount_kw.resource
Documentation         This test suite is responsible for deleting a user account through the API.
...                   
...                   - It includes the resource to handle the delete account functionality.
...                   - The test ensures the system properly removes an existing user account.
...                   
...                   Expected result: The specified account is deleted completely and permanently

*** Test Cases ***
Delete an Admin account
    Given the user deletes an account