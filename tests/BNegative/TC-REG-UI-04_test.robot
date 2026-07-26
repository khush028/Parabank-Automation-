*** Settings ***
Resource    ../../resources/Pages/Register_Page.robot
Resource    ../../resources/Keywords/common_keywords.robot

Suite Setup  Load Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-REG-UI-04 password mismatch
    [Documentation]  This test case checks that the password and confirm password fields match in the registration form
    to register password mismatch