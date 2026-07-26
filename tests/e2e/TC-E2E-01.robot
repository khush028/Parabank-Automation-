*** Settings ***
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/pages/Saving_Account_Page.robot


Suite Setup    Run Keywords
...    Load Environment
...     AND  Load API Environment
...    AND   Create Api Session
...     AND    Login And Get Customer Id

Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
Create Account via UI and Verify Account Exists in API
    [Documentation]   This test case verifies that an account created on UI is present in API


    To Create Saving Account

    Wait Until Element Is Visible    ${Account_number}    20s
    ${ui_id}=    Get Text    ${Account_number}


    ${response}=    GET On Session    parabank    /customers/${CUSTOMER_ID}/accounts

    ${xml}=    Parse XML    ${response.text}
    ${xml}=    Parse XML    ${response.text}

    ${account_ids}=    Create List

     ${accounts}=    Get Elements    ${xml}    .//account

     FOR    ${account}    IN    @{accounts}
         ${id}=    Get Element Text    ${account}    id
         Append To List    ${account_ids}    ${id}
     END

#     ${account_id_ui}=    Convert To Integer    ${ui_id}
     Should Contain    ${account_ids}    ${ui_id}

