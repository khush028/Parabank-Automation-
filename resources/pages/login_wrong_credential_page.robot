*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Resource   ../../locators/login_locators.robot

*** Keywords ***
login with wrong credentials
    [Documentation]    this keyword logs in with wrong credentials

    Click Element    ${TXT_USERNAME}
    Input Text    ${TXT_USERNAME}    abhi

    Click Element    ${TXT_PASSWORD}
    Input Text    ${TXT_PASSWORD}    abhi1234
    Click Element    ${BTN_LOGIN}