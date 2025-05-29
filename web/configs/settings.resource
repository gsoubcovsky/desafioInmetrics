*** Settings ***
Library                                         SeleniumLibrary
Library                                         RequestsLibrary
Library                                         Collections
Library                                         String
Library                                         OperatingSystem
Library                                         Process
Resource                                        ../pageObjects/homepage/homepage_po.resource
Resource                                        ../pageObjects/homepage/login_po.resource
Resource                                        ../pageObjects/order/order_po.resource
Resource                                        ../pageObjects/checkout/checkout_po.resource
Resource                                        ../../api/keywords/accountService/createAccount_kw.resource
Resource                                        ../../api/keywords/accountService/generateToken_kw.resource
Resource                                        ../../api/keywords/accountService/deleteAccount_kw.resource

*** Variables ***
${URL}                                          https://advantageonlineshopping.com
${BROWSER}                                      chrome
${HEADLESS}                                     True
${WINDOW_SIZE_ARG}                              --window-size=1920,1080
${HEADLESS_ARG}                                 --headless=new

*** Keywords ***
Open Browser to Home Page
    ${options}=                                 Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method                                 ${options}    add_argument    ${WINDOW_SIZE_ARG}
    Run Keyword If                              '${HEADLESS}'=='True'    Call Method    ${options}    add_argument    ${HEADLESS_ARG}
    Open Browser                                ${URL}    ${BROWSER}    options=${options}
    Set Selenium Speed                          0.1s
    ${title}=                                   Get Title
    ${cleaned}=                                 Evaluate    re.sub(r'\s+', ' ', '''${title}''').replace(u'\u00A0', '').strip()    re
    Should Be Equal As Strings                  ${cleaned}    Advantage Shopping
    Wait Until Page Contains Element            ${HOMEPAGE_HEADER}
    Wait Until Element Is Visible               ${HOMEPAGE_HEADER}

Check if the element exists and is visible at the page
    [Arguments]                                 ${locator}
    Wait Until Page Contains Element            ${locator}
    Wait Until Element Is Visible               ${locator}
    Wait Until Element Is Enabled               ${locator}
