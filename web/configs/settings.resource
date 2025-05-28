*** Settings ***
Library        SeleniumLibrary
Library        RequestsLibrary
Library        Collections
Library        String
Resource       ../pageObjects/homepage/homepage_po.resource
Resource       ../pageObjects/homepage/login_po.resource
Resource       ../pageObjects/order/order_po.resource
Resource        ../../api/keywords/accountService/createAccount_kw.resource
Resource        ../../api/keywords/accountService/generateToken_kw.resource
Resource        ../../api/keywords/accountService/deleteAccount_kw.resource

*** Variables ***
${URL}              https://advantageonlineshopping.com/
${BROWSER}          Chrome                #headlesschrome

*** Keywords ***
Open Browser to Home Page
    Open Browser                                ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed                          0.1s
    ${title}                                    Get Title
    ${cleaned}                                  Evaluate    re.sub(r'\\s+', ' ', '''${title}''').replace(u'\u00A0', '').strip()    re
    Should Be Equal As Strings                  ${cleaned}    Advantage Shopping
    Wait Until Page Contains Element            ${HOMEPAGE_HEADER}
    Wait Until Element Is Visible               ${HOMEPAGE_HEADER}

Check if the element exists and is visible at the page
    [Arguments]            ${locator}
    Wait Until Page Contains Element         ${locator}
    Wait Until Element Is Visible            ${locator}
    Wait Until Element Is Enabled            ${locator}
