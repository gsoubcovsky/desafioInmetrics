*** Settings ***
Resource                                        ../keywords/checkout/checkout_kw.resource
Suite Setup                                     the user creates an ADMIN account
Suite Teardown          Run Keywords            the user generate the authentication token            AND
...                                             the user deletes an account
Test Setup              Run Keywords            Open Browser to Home Page                             AND
...                                             Login into the Advantage Website                      AND
...                                             the user adds the product to the cart

*** Test Cases ***
Test
    Given the user do a checkout in his shopping cart
    And the user is at the order payment page
    And the user clicks in the next button
    When the user select SafePay for payment
    And the user fill up the username for SafePay
    And the user clicks in the PAY NOW button
    Then the user should go the order success page
