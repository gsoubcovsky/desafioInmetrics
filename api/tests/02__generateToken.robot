*** Settings ***
Resource              ../keywords/accountService/generateToken_kw.resource
Documentation         This test suite handles the generation of an authentication token via API.
...                   
...                   - It imports the necessary resource to perform the token request.
...                   - The test validates that a token is returned successfully by the endpoint.
...                   
...                   Expected result: A valid token is received and stored for further API operations.

*** Test Cases ***
Generate access token to manage the api
    Given the user generate the authentication token
    Then the user get the token from the endpoint