*** Settings ***
Resource    ../../resources/Pages/Saving_Account_Page.robot
Resource    ../../resources/Keywords/common_keywords.robot


Suite Setup  Load Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-AC-UI-01 Create Saving Account
    [Documentation]  This test case creates a checking account for the user
    [Tags]  functional
    to create saving account
    Sleep    5s