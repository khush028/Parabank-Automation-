*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    ../../config/environment.py
Library    OperatingSystem
Library    XML

*** Variables ***
${ENV}    qa_api

*** Keywords ***
Load API Environment
    Load Env    ${ENV}
    ${baseurl}=  Get Env     baseurl_api
    ${username}=  Get Env    username
    ${password}=  Get Env    password
    ${account_id}=  Get Env    account_id

    Set Global Variable    ${baseurl_api}  ${baseurl}
    Set Global Variable    ${USERNAME}  ${username}
    Set Global Variable    ${PASSWORD}  ${password}

    Set Global Variable    ${ACCOUNT_ID}  ${account_id}


    Load Env    qa_api
    ${baseurl}=    Get Env    baseurl_api
    Log To Console    BASEURL=${baseurl}
    Set Global Variable    ${baseurl_api}    ${baseurl}





Create API Session
    Create Session  parabank   ${baseurl_api}
    Log To Console    API URL = ${baseurl_api}

Setup API
    [Documentation]    This keyword sets up the API session and logs in to get customer id
    Load API Environment
    Create API session

Login And Get Customer Id
    ${response}=    GET On Session  parabank    /login/${USERNAME}/${PASSWORD}

    Should Be Equal As Integers    ${response.status_code}    200

    Log To Console    ${response.text}
    ${xml}=    Parse XML    ${response.text}
    ${customer_id}=    Get Element Text    ${xml}    id
    Log To Console    Customer ID: ${customer_id}
    Set Global Variable    ${CUSTOMER_ID}  ${customer_id}

Open new account
    [Documentation]    Opens new account for logged in user

    ${params}=    Create Dictionary    customerId=${CUSTOMER_ID}    newAccountType=1    fromAccountId=${ACCOUNT_ID}

    ${response}=    POST On Session    parabank   /createAccount   params=${params}

    Should Be Equal As Integers    ${response.status_code}    200

    Log To Console    ${response.text}
    ${body}=    Parse XML    ${response.text}
    ${account_id}=    Get Element Text    ${body}    id

    Log To Console    Account ID: ${account_id}
    Set Global Variable    ${NEW_ACCOUNT_ID}  ${account_id}

    ${balance}=    Get Element Text    ${body}    balance
    ${type}=    Get Element Text    ${body}    type

    Set Global Variable    ${NEW_ACCOUNT_BALANCE}  ${balance}
    Set Global Variable    ${NEW_ACCOUNT_TYPE}  ${type}



Transfer Funds
    [Documentation]    Transfers funds from one account to another
    [Arguments]    ${amount}
    ${params}=    Create Dictionary    fromAccountId=${ACCOUNT_ID}    toAccountId=${NEW_ACCOUNT_ID}    amount=${amount}
    ${response}=    POST On Session    parabank   /transfer   params=${params}

    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    ${response.text}

Get Account Balance
    [Documentation]    Get balance of a account
    [Arguments]    ${account_id}
    ${response}=  GET On Session    parabank   /accounts/${account_id}
    ${body}=    Parse XML    ${response.text}
    ${balance}=    Get Element Text    ${body}    balance
    RETURN    ${balance}


