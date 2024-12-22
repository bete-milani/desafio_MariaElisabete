*** Settings ***
Library    SeleniumLibrary

*** Keywords ***

Capture Screenshot On Success
    Capture Page Screenshot
    Log    Screenshot captured successfully.
Open Application
    [Arguments]    ${URL}    ${BROWSER}
    Open Browser    ${URL}    ${BROWSER}

Login As Admin
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Click Element    css:.oxd-input--active
    Input Text       css:.oxd-input--active    ${USERNAME}
    Click Element    css:[type="password"]
    Input Text       css:[type="password"]    ${PASSWORD}
    Click Button     css:.oxd-button
    Capture Screenshot On Success


Fill Add Admin Form
    [Arguments]    ${USER_ROLE}    ${EMPLOYEE_NAME_1}    ${STATUS}   ${NEW_ADMIN_USERNAME_1}    ${NEW_ADMIN_PASSWORD}    ${CONFIRM_PASSWORD}
    Click Element   css:.oxd-select-text  
    Wait Until Page Contains Element   xpath=//div[@role="option" and contains(., 'Admin')]   5s
    Click Element   xpath=//div[@role="option" and contains(., 'Admin')]  
    Click Element   css:body
    Input Text   xpath=//input[contains(@placeholder,'Type for hints...')]   ${EMPLOYEE_NAME_1}
    Sleep     1s 
    Press Keys   xpath=//input[contains(@placeholder,'Type for hints...')]   ARROW_DOWN
    Sleep     1s  
    Press Keys   xpath=//input[contains(@placeholder,'Type for hints...')]   ENTER
    Click Element    xpath=//label[contains(text(), 'Status')]/following::div[contains(@class, 'oxd-select-text')][1]
    Wait Until Page Contains Element   xpath=//div[@role="option" and contains(., '${STATUS}')]   5s
    Click Element   xpath=//div[@role="option" and contains(., '${STATUS}')]     
    Wait Until Page Contains Element   xpath=//label[contains(text(), 'Username')]/following::input[1]   5s
    Input Text                          xpath=//label[contains(text(), 'Username')]/following::input[1]   ${NEW_ADMIN_USERNAME_1}
    Sleep     3s 
    Input Text   xpath=(//input[@type='password'])[1]   ${NEW_ADMIN_PASSWORD}
    Input Text   xpath=(//input[@type='password'])[2]   ${CONFIRM_PASSWORD}
    Wait Until Element Is Visible   css:.oxd-button--secondary   10s
    Click Element   css:.oxd-button--secondary
    Capture Screenshot On Success


Buscar novo usuário
    [Arguments]    ${NEW_ADMIN_USERNAME_1}  
    Wait Until Element Is Visible   xpath=//span[text()='Admin']   10s
    Click Element   xpath=//span[text()='Admin']
    Sleep     2s
    Input Text      xpath=//label[contains(text(), 'Username')]/following::input[1]   ${NEW_ADMIN_USERNAME_1}
    Wait Until Element Is Visible   xpath=//button[@type='submit']
    Click Element   xpath=//button[@type='submit']
    Capture Screenshot On Success
    sleep     4s

Deletar novo usuário
    [Arguments]    ${EMPLOYEE_NAME_1}    
    Click Element   xpath=//button[contains(@class, 'oxd-icon-button') and contains(@class, 'oxd-table-cell-action-space')]//i[contains(@class, 'bi-trash')]
    Sleep    3s
    Click Element   xpath=//button[contains(@class, 'oxd-button--label-danger') and contains(@class, 'orangehrm-button-margin')]
    

Close Application
    Close Browser
