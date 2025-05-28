*** Settings ***
Resource        ../../pageObjects/accountService/createAccount_po.resource
Resource        ../../configs/settings.resource

*** Keywords ***
Create an Account
    [Arguments]                ${account_type}    ${api_url}
    ${loginName}=              Evaluate    ''.join(ch for ch in __import__('faker').Faker().user_name() if ch.isalnum())[:15]
    ${password}=               FakerLibrary.Password
    ${firstName}=              Evaluate    __import__('faker').Faker().first_name()[:30]
    ${lastName}=               Evaluate    __import__('faker').Faker().last_name()[:30]
    
    ${length_first}=           Evaluate    len("""${firstName}""")
    Run Keyword If             ${length_first} < 2    Set Variable    ${firstName}=Ana
    
    ${length_last}=            Evaluate    len("""${lastName}""")
    Run Keyword If             ${length_last} < 2     Set Variable    ${lastName}=Silva
    
    ${phone}=                  Evaluate    ''.join(filter(str.isdigit, __import__('faker').Faker().phone_number()))[:20]
    ${email}=                  Set Variable    ${loginName}@example.com
    ${city}=                   Evaluate    __import__('faker').Faker().city()[:25]
    ${address}=                Evaluate    __import__('faker').Faker().address().replace('\\n', ', ')[:50]
    ${state}=                  Evaluate    __import__('faker').Faker().state_abbr()[:10]
    ${zip}=                    Evaluate    __import__('faker').Faker().postcode()[:10]
    
    ${body}=                   Create Dictionary
    ...                        accountType=${account_type}
    ...                        address=${address}
    ...                        allowOffersPromotion=${True}
    ...                        aobUser=${True}
    ...                        cityName=${city}
    ...                        country=AUSTRALIA_AU
    ...                        email=${email}
    ...                        firstName=${firstName}
    ...                        lastName=${lastName}
    ...                        loginName=${loginName}
    ...                        password=${password}
    ...                        phoneNumber=${phone}
    ...                        stateProvince=${state}
    ...                        zipcode=${zip}
      
    ${headers}                 Create Dictionary
    ...                        Content-Type=application/json
    
    ${response}                POST                           ${api_url}
    ...                                                       json=${body}
    ...                                                       headers=${headers}
  
    Status Should Be                                          200

    ${userId}               Set Variable                      ${response.json()["response"]["userId"]}
    ${reason}               Set Variable                      ${response.json()["response"]["reason"]}
    Should Be Equal         ${reason}                         New user created successfully.

    Set Global Variable      ${rqst_username}                 ${loginName}
    Set Global Variable      ${rqst_pass}                     ${password}
    Set Global Variable      ${rqst_email}                    ${email}
    Set Global Variable      ${rqst_userId}                   ${userId}

    RETURN                   ${rqst_userId}

the user creates an ${account_type} account
    Create an Account        ${account_type}    ${URL}${ACCOUNTSERVICE_EDP}/register
