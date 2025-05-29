*** Settings ***
Resource        ../../configs/settings.resource


*** Keywords ***
the user generate the authentication token
    Generate Access Token                                email=${rqst_email}    user=${rqst_username}   pass=${rqst_pass}   api_url=${URL}${ACCOUNTSERVICE_EDP}/login

the user get the token from the endpoint
    ${TOKEN}=            Generate Access Token           email=${rqst_email}    user=${rqst_username}   pass=${rqst_pass}   api_url=${URL}${ACCOUNTSERVICE_EDP}/login
    Should Not Be Empty                                  ${TOKEN}