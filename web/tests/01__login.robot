*** Settings ***
Resource                                        ../keywords/homepage/login_kw.resource
Suite Setup                                     the user creates an ADMIN account
Suite Teardown          Run Keywords            the user generate the authentication token            AND
...                                             the user deletes an account
Test Setup                                      Open Browser to Home Page

*** Test Cases ***
Login into the website
    Given the user clicks in the login button
    When the user fills up the username field
    And the user fills up the password field
    Then the user clicks in the signin button
    And the user should be logged in into the website