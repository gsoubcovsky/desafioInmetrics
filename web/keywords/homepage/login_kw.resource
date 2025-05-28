*** Settings ***
Resource        ../../configs/settings.resource

*** Keywords ***
Loader Should Be Hidden JS
    ${display}    Execute Javascript    return window.getComputedStyle(document.querySelector('.loader')).getPropertyValue('display');
    ${opacity}    Execute Javascript    return window.getComputedStyle(document.querySelector('.loader')).getPropertyValue('opacity');
    Should Be Equal    ${display}    none
    Should Be Equal    ${opacity}    0

Wait Until Loader Disappears JS
    Wait Until Keyword Succeeds    15s    0.2s    Loader Should Be Hidden JS

the user clicks in the login button
    Wait Until Loader Disappears JS
    Check if the element exists and is visible at the page            ${LOGIN_BTN}
    Click Element                                                     ${LOGIN_BTN}
    Check if the element exists and is visible at the page            ${LOGIN_POPUP}

the user fills up the username field
    Check if the element exists and is visible at the page            ${USERNAME_FIELD}
    Input Text                                                        ${USERNAME_FIELD}            ${rqst_username}

the user fills up the password field
    Check if the element exists and is visible at the page            ${PASSWORD_FIELD}
    Input Text                                                        ${PASSWORD_FIELD}            ${rqst_pass}

Wait For User Name To Be Visible
    [Arguments]    ${user_name}
    Check if the element exists and is visible at the page            xpath=//span[contains(@class, 'hi-user containMiniTitle ng-binding') and normalize-space(text())='${user_name}']

the user clicks in the signin button
    Check if the element exists and is visible at the page            ${SIGNIN_BTN}
    Click Button                                                      ${SIGNIN_BTN}

the user should be logged in into the website
    Wait Until Element Is Not Visible                                 ${LOGIN_POPUP}
    Wait For User Name To Be Visible                                  ${rqst_username}

Login into the Advantage Website
    the user clicks in the login button
    the user fills up the username field
    the user fills up the password field
    the user clicks in the signin button
    the user should be logged in into the website