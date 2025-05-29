*** Settings ***
Resource        ../../configs/settings.resource

*** Keywords ***
Delete an existing account
    [Arguments]            ${accountId}   ${api_url}
    ${body}                Create Dictionary
    ...                    accountId=${accountId}
  
    ${headers}             Create Headers with Authentication
    ...                    ${TOKEN}

    Log                    ${TOKEN}

    ${response}            DELETE                         ${api_url}
    ...                                                   json=${body}
    ...                                                   headers=${headers}
  
    Status Should Be                                      200

    ${reason}               Set Variable                  ${response.json()["statusMessage"]["reason"]}
    Should Match Regexp     ${reason}                     .*deleted completely.*
    
the user deletes an account
    Delete an existing account    ${rqst_userId}    ${URL}${ACCOUNTSERVICE_EDP}/delete