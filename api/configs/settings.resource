*** Settings ***
Library         RequestsLibrary
Library         Collections
Library         FakerLibrary

*** Variables ***
${URL}             https://www.advantageonlineshopping.com

*** Keywords ***
Generate Access Token
    [Arguments]            ${email}    ${user}    ${pass}   ${api_url}
    ${body}                Create Dictionary
    ...                    email=${email}
    ...                    loginPassword=${pass}
    ...                    loginUser=${user}
  
    ${headers}             Create Dictionary
    ...                    Content-Type=application/json

    ${response}            POST                           ${api_url}
    ...                                                   json=${body}
    ...                                                   headers=${headers}
  
    Status Should Be                                      200

    ${token}                Set Variable                   ${response.json()["statusMessage"]["token"]}
    Set Global Variable     ${TOKEN}                       ${token}
    RETURN                  ${token}

Create Headers with Authentication
    [Arguments]                    ${token}
    ${headers}                     Create Dictionary
    ...                            Content-Type=application/json
    ...                            Authorization=Bearer ${token}
    RETURN                         ${headers}