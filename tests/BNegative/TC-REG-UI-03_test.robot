*** Settings ***
Resource    ../../resources/Pages/Register_Page.robot
Resource    ../../resources/Keywords/common_keywords.robot

Suite Setup  Load Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-REG-UI-03 Check Required Fields in Registration Form
    [Documentation]  This test case checks the required fields in the registration form
    to check required fields