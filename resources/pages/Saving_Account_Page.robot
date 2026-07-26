*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Resource   ../../locators/Account_locators.robot
Resource   ../../locators/login_locators.robot

*** Keywords ***
to create saving account
    [Documentation]  this keyword creates a saving account for the user


    Input Text    ${TXT_USERNAME}    john
    Input Text    ${TXT_PASSWORD}    demo
    Click Element    ${BTN_LOGIN}
    Sleep    5s
    Wait Until Element Is Visible    ${Account_Button}
    Click Element    ${Account_Button}
    Sleep    5s
    Select From List By Value    ${checking_account}    1
    Click Element    ${Open_new_account_button}
    Sleep    5s

    log to console    Savings account is created successfully
