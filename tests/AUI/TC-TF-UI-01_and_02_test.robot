*** Settings ***
Resource    ../../resources/Pages/Transfer_Fund_Page.robot
Resource    ../../resources/Keywords/common_keywords.robot


Suite Setup  Load Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-TF-UI-01 Transfer Fund
    [Documentation]  This test case transfers fund from one account to another
    [Tags]  functional
    to transfer fund
    Sleep    5s