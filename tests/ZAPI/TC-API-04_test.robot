*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    XML
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup    Load API Environment

*** Test Cases ***
TC-API-04-Validate source account balance after and before transfer
    [Documentation]  Test case to verify that the source account balance is updated correctly after a transfer.
    [Tags]  API
    Create API Session
    Login And Get Customer Id
    Open New Account
    ${Old_source_balance}=  Get Account Balance     ${ACCOUNT_ID}
    Transfer Funds    100
    ${New_source_balance}=  Get Account Balance    ${ACCOUNT_ID}
    ${difference}=  Evaluate  ${Old_source_balance} - ${New_source_balance}
    Log To Console    Source_balance_before=${Old_source_balance}
    Log To Console    Source_balance_after=${New_source_balance}
    Should Be Equal As Integers    ${difference}  100
    Log To Console    ${difference}==100