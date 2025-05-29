*** Settings ***
Resource        ../../configs/settings.resource
Resource        ../homepage/login_kw.resource
Resource        ../order/order_kw.resource

*** Keywords ***
the user do a checkout in his shopping cart
    Page Should Contain Button            ${CHECKOUT_BTN}
    Click Button                          ${CHECKOUT_BTN}

the user is at the order payment page
    Check if the element exists and is visible at the page            ${CHECKOUTCART_ELMT}
    Check if the element exists and is visible at the page            ${SHIPPINGDETAILS_ELMT}
    Check if the element exists and is visible at the page            xpath=//label[text()='1. SHIPPING DETAILS ']    

the user clicks in the next button
    Page Should Contain Button            ${NEXT_BTN}
    Click Button                          ${NEXT_BTN}
    Check if the element exists and is visible at the page            xpath=//label[text()='2. PAYMENT METHOD']

the user select SafePay for payment
    Check if the element exists and is visible at the page            xpath=//input[@name='safepay']
    Click Element                                                     xpath=//input[@name='safepay']


the user fill up the username for SafePay
    Check if the element exists and is visible at the page            xpath=//input[@name='safepay_username']
    Input Text                                                        xpath=//input[@name='safepay_username']           teste
    Check if the element exists and is visible at the page            xpath=//input[@name='safepay_password']
    Input Password                                                    xpath=//input[@name='safepay_password']           123456@Test!

the user clicks in the PAY NOW button
    Page Should Contain Button                                        ${SAFEPAYPAYNOW_BTN}
    Click Button                                                      ${SAFEPAYPAYNOW_BTN}

the user should go the order success page
    Check if the element exists and is visible at the page            ${ORDERPAYMENTSUCESS_ELMT}