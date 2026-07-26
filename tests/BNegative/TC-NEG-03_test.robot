*** Settings ***
Resource    ../../resources/Pages/Tfp_without_login_page.robot
Resource    ../../resources/Keywords/common_keywords.robot   

Suite Setup  Load Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-NEG-03 Check Transfer without login
    [Documentation]  This test case checks the transfer functionality without login
    [Tags]  functional
    to transfer fund without login
    Sleep    5s