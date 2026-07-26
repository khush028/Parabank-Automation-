*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Resource   ../../locators/transfer_fund_locators.robot
Resource   ../../locators/Register_locators.robot
Resource    ../../locators/Account_locators.robot

*** Keywords ***
to transfer fund
    [Documentation]  this keyword transfers fund from one account to another

    Click Element    ${register_button}
    Sleep    5s
    Click Element    ${first_name}
    Input Text    ${first_name}    sneha
    Click Element    ${last_name}
    Input Text    ${last_name}  kumawat

    Click Element    ${address}
    Input Text    ${address}    123 Main St

    Click Element    ${city}
    Input Text    ${city}    jaipur

    Click Element    ${state}
    Input Text    ${state}    CA

    Click Element    ${zip_code}
    Input Text    ${zip_code}    12345

    Click Element    ${phone}
    Input Text    ${phone}    555-1234

    Click Element    ${ssn}
    Input Text    ${ssn}    123-45-6789

    Wait Until Element Is Visible    ${use_rname}
    Input Text    ${use_rname}    sneha123

    Wait Until Element Is Visible    ${pass_word}
    Input Text    ${pass_word}    1234
    Input Text    ${confirm_password}    1234


    Click Element    ${register_form}
    Sleep    5s

    Wait Until Element Is Visible    ${Account_Button}
    Click Element    ${Account_Button}
    Sleep    5s

    Select From List By Value    ${checking_account}    0
    Click Element    ${Open_new_account_button}
    Sleep    5s

    Click Element    ${Transfer_funds_button}
    Sleep    5s

    Click Element    ${amount}
    Input Text    ${amount}    100
    

    Select From List By Index    ${FROM_ACCOUNT_DROPDOWN}    1
    Select From List By Index    ${TO_ACCOUNT_DROPDOWN}      0
    
    
    Click Element    ${transfer_button}
    Sleep    5s
    log to console    fund is transferred successfully

    ${amount}=      Get Text    ${AMOUNT_RESULT}
    ${from_acc}=    Get Text    ${FROM_ACCOUNT_RESULT}
    ${to_acc}=      Get Text    ${TO_ACCOUNT_RESULT}

    Log To Console    Amount: ${amount}
    Log To Console    From Account: ${from_acc}
    Log To Console    To Account: ${to_acc}

    RETURN    ${amount}    ${from_acc}    ${to_acc}