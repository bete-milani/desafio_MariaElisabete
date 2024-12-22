*** Settings ***
Resource    variables.robot
Resource    keywords.robot

*** Variables ***
${EMPLOYEE_NAME}       Novo Admin
${NEW_ADMIN_USERNAME}  novo_admin_user
${NEW_ADMIN_PASSWORD}  Admin@123

*** Test Cases ***

Realizar Login Com Sucesso
    [Documentation]  Realiza login no sistema com sucesso.
    Open Application    ${URL}    ${BROWSER}
    Wait Until Page Contains Element   css:.oxd-input--active   20s
    Login As Admin      ${USERNAME}    ${PASSWORD}
    Wait Until Page Contains Element   css:.oxd-topbar-header-breadcrumb-module   15s

Cadastrar
    [Documentation]  Cadastra um novo administrador no sistema.
    Fill Add Admin Form    ${USER_ROLE}   ${EMPLOYEE_NAME_1}   Enabled    ${NEW_ADMIN_USERNAME_1}    ${NEW_ADMIN_PASSWORD}    ${NEW_ADMIN_PASSWORD}
    Wait Until Page Contains   Successfully Saved   15s

Validar Cadastro
    [Documentation]     Buscar novo usuário cadastrado
    Buscar novo usuário    ${NEW_ADMIN_USERNAME_1}

Deletar novo usuário
    [Documentation]     Excluir novo usuário
    Deletar novo usuário    ${EMPLOYEE_NAME_1}   

    Close Application
