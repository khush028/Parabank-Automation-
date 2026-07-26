*** Settings ***
Resource    ../../resources/Pages/login_page.robot
Resource    ../../resources/Keywords/common_keywords.robot

Suite Setup  Load Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-AC-UI-04 Login to the application
    [Documentation]  This test case is used to login into the application
    [Tags]  functional
    to login into account