*** Settings ***
Library  SeleniumLibrary
Library  ../../config/environment.py


*** Variables ***
${BROWSER}  chrome
${ENV}  qa

*** Keywords ***
Load Environment

    Load Env    ${ENV}
    ${url}=  Get Env    baseurl_ui
    ${email}=  Get Env    username
    ${pwd}=  Get Env    password

    Set Global Variable    ${BASE_URL}  ${url}
    Set Global Variable    ${USER_EMAIL}  ${email}
    Set Global Variable    ${USER_PWD}  ${pwd}


Open Application
    [Documentation]  Opens the application
    Open Browser  ${BASE_URL}  ${BROWSER}
    Maximize Browser Window

Close Application
    [Documentation]  Closing the application
    Close All Browsers

