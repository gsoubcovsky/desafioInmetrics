*** Settings ***
Resource                                        ../keywords/homepage/login_kw.resource
Suite Setup                                     the user creates an ADMIN account
Suite Teardown          Run Keywords            the user generate the authentication token            AND
...                                             the user deletes an account                           AND
...                                             Save WEB Results to Database
Test Setup                                      Open Browser to Home Page
Documentation                                   This test suite verifies the login functionality on the Advantage Online Shopping website.
...                                             
...                                             - The suite setup prepares an ADMIN account to be used during the login process.
...                                             - The suite teardown ensures cleanup by generating a token and deleting the created account.
...                                             - Each test begins with opening the browser on the homepage.
...                                             
...                                             Test Case:
...                                             • Logs in using valid credentials and verifies successful login.
...                                             
...                                             Expected result: The user should be authenticated and logged into the platform.

*** Test Cases ***
User logs in successfully with valid credentials
    Given the user clicks in the login button
    When the user fills up the username field
    And the user fills up the password field
    Then the user clicks in the signin button
    And the user should be logged in into the website