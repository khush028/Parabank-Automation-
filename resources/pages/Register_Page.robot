*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Resource   ../../locators/Register_locators.robot

*** Keywords ***

To register a new user
    [Documentation]  this keyword registers a new user in the application
    Click Element    ${register_button}
    Sleep    5s
    Click Element    ${first_name}
    Input Text    ${first_name}    abhi
    Click Element    ${last_name}
    Input Text    ${last_name}  sharma
    
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
    Sleep   7s
    
#    Wait Until Element Is Visible    ${use_rname}
    Click Element    ${use_rname}
    Input Text    ${use_rname}    abhi


    Wait Until Element Is Visible    ${pass_word}
    Click Element    ${pass_word}
    Input Text    ${pass_word}    abhi123

    Click Element    ${confirm_password}
    Input Text    ${confirm_password}    abhi123

    Click Element    ${register_form}
    Sleep    5s


    ${welcome_text}=    Get Text    ${WELCOME_MESSAGE}

    Log To Console    ${welcome_text}

    RETURN    ${welcome_text}

    Log to console  all the details are correct and displayed the welcome message




to check required fields
    [Documentation]  this keyword checks the required fields in the registration form
    Click Element    ${register_button}
    Sleep    2s
    Click Element    ${register_form}
    Sleep    5s

    log to console    required fields are checked

to register password mismatch
    [Documentation]  this keyword registers a new user with password mismatch
    Click Element    ${register_button}
    Sleep    5s
    Click Element    ${first_name}
    Input Text    ${first_name}    abhi123
    Click Element    ${last_name}
    Input Text    ${last_name}  kumar

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
    Log To Console    LOCATOR=${use_rname}
    Page Should Contain Element    ${use_rname}
    Capture Page Screenshot
    Wait Until Keyword Succeeds    20s  2s   Click Element        ${use_rname}
    Input Text    ${use_rname}    abhi123
    Wait Until Element Is Visible    ${pass_word}
    Input Text    ${pass_word}    abhi123
    Input Text    ${confirm_password}    abhi1234

    Click Element    ${register_form}
    Sleep    5s

    log to console    password didnt mismatch


to see name already exist error
    [Documentation]  this keyword checks the name already exist error in the registration form
    Click Element    ${register_button}
    Sleep    5s
    Click Element    ${first_name}
    Input Text    ${first_name}    abhi
    Click Element    ${last_name}
    Input Text    ${last_name}  kumar

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
    
#    Wait Until Element Is Visible    ${use_rname}
    Input Text  ${use_rname}  abhi
        
#    Wait Until Element Is Visible    ${pass_word}
    Input Text    ${pass_word}    abhi123
    
    Click Element    ${confirm_password}    
    Input Text    ${confirm_password}    abhi123

    Click Element    ${register_form}
    Sleep    5s

    log to console    this username already exist
