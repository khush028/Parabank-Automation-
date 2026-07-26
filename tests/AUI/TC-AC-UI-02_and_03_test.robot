*** Settings ***
Resource    ../../resources/pages/Checking_Acoount_page.robot
Resource    ../../resources/Keywords/common_keywords.robot


Suite Setup  Load Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-AC-UI-02 Create Checking Account
    [Documentation]  This test case creates a checking account for the user
    [Tags]  functional
    
    to create checking account
    Sleep    5s