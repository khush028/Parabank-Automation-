*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Resource   ../../locators/transfer_fund_locators.robot

*** Keywords ***
to transfer fund without login
    [Documentation]  this keyword transfers fund without login
    Click Element    ${Transfer_funds_button}
    Sleep    5s