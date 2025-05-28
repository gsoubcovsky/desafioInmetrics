*** Settings ***
Resource              ../keywords/accountService/createAccount_kw.resource


*** Test Cases ***
Create an Admin account
    Given the user creates an ADMIN account