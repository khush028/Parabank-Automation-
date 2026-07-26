*** Settings ***
Resource    ../../resources/Pages/Register_Page.robot
Resource    ../../resources/Keywords/common_keywords.robot

Suite Setup  Load Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-REG-UI-01 Register to application
    [Documentation]  Test case 1 for registering to the application
    [Tags]  functional

    To Register A new User
    Sleep    5s
