*** Settings ***
Resource    ../resources/variables.robot
Resource    ../resources/keywords.robot

*** Variables ***
${EMPLOYEE_NAME}       Novo Admin
${NEW_ADMIN_USERNAME}  novo_admin_user
${NEW_ADMIN_PASSWORD}  Admin@123

*** Test Cases ***

Realizar login com sucesso
    [Documentation]  Realiza login no sistema com sucesso.
    Given eu estou na página de login
    When eu faço login com usuário válido
    Then eu vejo a tela principal do sistema

Cadastrar novo administrador
    [Documentation]  Cadastra um novo administrador no sistema.
    Given estou logado no sistema
    When eu preencho o formulário de cadastro de administrador
    Then o novo administrador é cadastrado com sucesso

Buscar e deletar administrador
    [Documentation]  Busca e exclui o administrador recém-cadastrado.
    Given estou logado no sistema
    When eu busco o administrador recém-cadastrado
    And eu excluo o administrador
    Then o administrador é excluído com sucesso

*** Keywords ***

Given eu estou na página de login
    Open Application    ${URL}    ${BROWSER}

When eu faço login com usuário válido
    Login As Admin      ${USERNAME}    ${PASSWORD}

Then eu vejo a tela principal do sistema
    Wait Until Page Contains Element   css:.oxd-topbar-header-breadcrumb-module   15s

Given estou logado no sistema
    Open Application    ${URL}    ${BROWSER}
    Login As Admin      ${USERNAME}    ${PASSWORD}

When eu preencho o formulário de cadastro de administrador
    Fill Add Admin Form    ${USER_ROLE}   ${EMPLOYEE_NAME}   Enabled    ${NEW_ADMIN_USERNAME}    ${NEW_ADMIN_PASSWORD}    ${NEW_ADMIN_PASSWORD}

Then o novo administrador é cadastrado com sucesso
    Wait Until Page Contains   Successfully Saved   15s

When eu busco o administrador recém-cadastrado
    Buscar novo usuário    ${NEW_ADMIN_USERNAME}

And eu excluo o administrador
    Deletar novo usuário    ${EMPLOYEE_NAME}

Then o administrador é excluído com sucesso
    Wait Until Page Contains   Successfully Deleted   15s
