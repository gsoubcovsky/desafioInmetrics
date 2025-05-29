*** Settings ***
Resource                                                              ../../configs/settings.resource
Resource                                                              ../homepage/login_kw.resource
Resource                                                              ../order/order_kw.resource

*** Variables ***
${SAFEPAY_USER}                                                       teste
${SAFEPAY_PASS}                                                       123456@Test!
${CARDNUMBER}                                                         111111111111
${CCV}                                                                111
${MONTH}                                                              09
${YEAR}                                                               2026

*** Keywords ***
the user do a checkout in his shopping cart
    Page Should Contain Button                                        ${CHECKOUT_BTN}
    Click Button                                                      ${CHECKOUT_BTN}

the user is at the order payment page
    Check if the element exists and is visible at the page            ${CHECKOUTCART_ELMT}
    Check if the element exists and is visible at the page            ${SHIPPINGDETAILS_ELMT}
    Check if the element exists and is visible at the page            ${SHIPPINGDETAILSHEADER_ELMT}  

the user clicks in the next button
    Page Should Contain Button                                        ${NEXT_BTN}
    Click Button                                                      ${NEXT_BTN}
    Check if the element exists and is visible at the page            ${PAYMENTHEADER_ELMT}

the user select SafePay for payment
    Check if the element exists and is visible at the page            ${SAFEPAY_RADIO}
    Click Element                                                     ${SAFEPAY_RADIO}

the user fill up the username for SafePay
    Check if the element exists and is visible at the page            ${SAFEPAYUSER_FIELD}
    Input Text                                                        ${SAFEPAYUSER_FIELD}                                  ${SAFEPAY_USER}
    Check if the element exists and is visible at the page            ${SAFEPAYPASS_FIELD}
    Input Password                                                    ${SAFEPAYPASS_FIELD}                                  ${SAFEPAY_PASS}

the user clicks in the PAY NOW button
    Page Should Contain Button                                        ${SAFEPAYPAYNOW_BTN}
    Click Button                                                      ${SAFEPAYPAYNOW_BTN}

the user should go the order success page
    Check if the element exists and is visible at the page            ${ORDERPAYMENTSUCESS_ELMT}

the user select MasterCredit for payment
    Check if the element exists and is visible at the page            ${MASTERCREDIT_RADIO}
    Click Element                                                     ${MASTERCREDIT_RADIO}

the user fill up the credit card infos for MasterCredit
    Check if the element exists and is visible at the page            ${CREDITCARD_FIELD}
    Input Text                                                        ${CREDITCARD_FIELD}                                   ${CARDNUMBER}
    Check if the element exists and is visible at the page            ${CCV_FIELD}
    Input Text                                                        ${CCV_FIELD}                                          ${CCV}
    Check if the element exists and is visible at the page            ${MONTH_LIST}
    Select From List By Value                                         ${MONTH_LIST}                                         ${MONTH}
    Check if the element exists and is visible at the page            ${YEAR_LIST}
    Select From List By Value                                         ${YEAR_LIST}                                          ${YEAR}
    Check if the element exists and is visible at the page            ${CARDHOLDER_FIELD}
    Input Text                                                        ${CARDHOLDER_FIELD}                                   ${rqst_username}
