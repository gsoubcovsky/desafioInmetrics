*** Settings ***
Resource                                        ../keywords/checkout/checkout_kw.resource
Suite Setup                                     the user creates an ADMIN account
Suite Teardown          Run Keywords            the user generate the authentication token            AND
...                                             the user deletes an account                           AND
...                                             Save WEB Results to Database
Test Setup              Run Keywords            Open Browser to Home Page                             AND
...                                             Login into the Advantage Website                      AND
...                                             the user adds the product to the cart
Documentation                                   This test suite validates the checkout flow on the Advantage Online Shopping website.
...                                             It includes two test cases that simulate completing an order using different payment methods.
...                                             
...                                             - The suite setup creates an admin account for use during test execution.
...                                             - The suite teardown ensures the account is deleted and a new token is generated.
...                                             - Each test starts by opening the browser, logging in, and adding a product to the cart.
...                                             
...                                             Test Cases:
...                                             1. User completes the checkout using SafePay.
...                                             2. User completes the checkout using MasterCredit.
...                                             
...                                             Expected result: The user reaches the order success page after successfully submitting payment.

*** Test Cases ***
User completes the checkout successfully using SafePay
    Given the user do a checkout in his shopping cart
    And the user is at the order payment page
    And the user clicks in the next button
    When the user select SafePay for payment
    And the user fill up the username for SafePay
    And the user clicks in the PAY NOW button
    Then the user should go the order success page

User completes the checkout successfully using MasterCredit
    Given the user do a checkout in his shopping cart
    And the user is at the order payment page
    And the user clicks in the next button
    When the user select MasterCredit for payment
    And the user fill up the credit card infos for MasterCredit
    And the user clicks in the PAY NOW button
    Then the user should go the order success page