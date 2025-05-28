*** Settings ***
Resource              ../keywords/accountService/generateToken_kw.resource
Documentation           Test: Generate access token to manage the API
...                     Objective: Ensure the user can successfully authenticate and receive a valid JWT token.
...                     Pre-conditions: The user must have valid login, email, and password credentials.
...                     Steps:
...                              1. Send a POST request to /accountrest/api/v1/login with credentials.
...                              2. Validate that the status code is 200.
...                              3. Validate that the 'token' field exists and is not empty.
...                     Expected result: The authentication token is saved successfully in the variable TOKEN.

*** Test Cases ***
Generate access token to manage the api
    Given the user generate the authentication token
    Then the user get the token from the endpoint