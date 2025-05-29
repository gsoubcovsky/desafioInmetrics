*** Settings ***
Resource                                        ../keywords/order/order_kw.resource
Suite Setup                                     the user creates an ADMIN account
Suite Teardown          Run Keywords            the user generate the authentication token            AND
...                                             the user deletes an account
Test Setup              Run Keywords            Open Browser to Home Page                             AND
...                                             Login into the Advantage Website
Documentation                                   This test suite validates the product search and add-to-cart functionalities on the Advantage Online Shopping website.
...                                             
...                                             - The suite setup creates an admin account to ensure user actions can be performed.
...                                             - The suite teardown handles token regeneration and deletes the account created.
...                                             - Each test case starts by opening the browser and logging into the platform.
...                                             
...                                             Test Cases:
...                                             1. Adds one unit of a searched product to the cart.
...                                             2. Adds two units of the same product to the cart.
...                                             
...                                             Expected result: The searched product(s) should appear correctly in the shopping cart with the specified quantity.

*** Test Cases ***
User searches and adds a product to the cart successfully
    Given the user clicks in the search button
    And the user searchs for BEATS STUDIO 2 OVER-EAR MATTE BLACK HEADPHONES product
    When the user selects the product in the search bar
    And the user chooses the product details and adds 1 of them to the cart
    Then the user verifies if the product is in the cart

User searches and adds 2 products to the cart successfully
    Given the user clicks in the search button
    And the user searchs for BEATS STUDIO 2 OVER-EAR MATTE BLACK HEADPHONES product
    When the user selects the product in the search bar
    And the user chooses the product details and adds 2 of them to the cart
    Then the user verifies if the product is in the cart