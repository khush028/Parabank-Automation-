*** Settings ***
Resource    ../../resources/Pages/login_wrong_credential_page.robot
Resource    ../../resources/Keywords/common_keywords.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-NEG-04 login with wrong credentials
    [Documentation]  This test case checks that the user is not able to login with wrong credentials
    login with wrong credentials
    Sleep    5s

