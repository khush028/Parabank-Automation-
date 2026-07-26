*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Resource   ../../locators/login_locators.robot

*** Keywords ***
to login into account
    [Documentation]  this keyword is used to login into the account
    Sleep    5s
    Click Element    ${TXT_USERNAME}
    Input Text    ${TXT_USERNAME}    john
    Click Element    ${TXT_PASSWORD}
    Input Text    ${TXT_PASSWORD}    demo
    Click Element    ${BTN_LOGIN}
