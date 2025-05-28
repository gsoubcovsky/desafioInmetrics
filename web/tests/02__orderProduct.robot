*** Settings ***
Resource                                        ../keywords/order/order_kw.resource
Suite Setup                                     the user creates an ADMIN account
Suite Teardown          Run Keywords            the user generate the authentication token            AND
...                                             the user deletes an account
Test Setup              Run Keywords            Open Browser to Home Page                             AND
...                                             Login into the Advantage Website

*** Test Cases ***
User searches and adds a product to the cart successfully
    Given the user clicks in the search button
    And the user searchs for BEATS STUDIO 2 OVER-EAR MATTE BLACK HEADPHONES product
    When the user selects the product in the search bar
    And the user chooses the product details and adds 1 of them to the cart
    Then the user verifies if the product is in the cart

# User searches and adds 2 products to the cart successfully
#     Given the user clicks in the search button
#     And the user searchs for BEATS STUDIO 2 OVER-EAR MATTE BLACK HEADPHONES product
#     When the user selects the product in the search bar
#     And the user chooses the product details and adds 2 of them to the cart
#     Then the user verifies if the product is in the cart