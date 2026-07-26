*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Resource   ../../locators/Account_locators.robot
Resource   ../../locators/login_locators.robot

*** Keywords ***
to create checking account
    [Documentation]  this keyword creates a checking account for the user
    Click Element    ${TXT_USERNAME}
    Input Text    ${TXT_USERNAME}    john
    Click Element    ${TXT_PASSWORD}
    Input Text    ${TXT_PASSWORD}    demo
    Click Element    ${BTN_LOGIN}


    Wait Until Element Is Visible    ${Account_Button}
    Click Element    ${Account_Button}
    Sleep    5s
    Select From List By Value    ${checking_account}    0
    Click Element    ${Open_new_account_button}
    Sleep    5s

    ${account_id}=    Get Text    ${NEW_ACCOUNT_ID}

    Log To Console    New Account ID: ${account_id}

    Set Suite Variable    ${ACCOUNT_ID}    ${account_id}

    RETURN    ${account_id}

    log to console    checking account is created successfully
