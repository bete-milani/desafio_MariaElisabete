# Testes de Cadastro

*** Settings ***
Resource        ../keywords/android.robot
Test Setup      Abrir App
Test Teardown   Fechar App
Test Timeout    1 minute


*** Test Cases ***
Cadastrar Novo Usuario
    Given Eu acessei a tela de cadastro
    When Eu preencho os dados de cadastro com um novo usuario
    And Eu clico no botão de cadastro
    Then O cadastro deve ser realizado com sucesso

Realizar Login Com Cadastro Valido
    Given Eu tenho um usuario válido cadastrado
    When Eu tento fazer login com o usuario e senha válidos
    Then O login deve ser realizado com sucesso
    And Eu devo ser redirecionado para a tela principal

Realizar Login Com Cadastro Inexistente
    #Given Eu não tenho um usuario com esse email
    When Eu tento fazer login com um email inexistente
    Then Eu devo receber uma mensagem de erro indicando que o usuario não existe

Realizar Login Com Senha Invalida
    Given Eu tenho um usuario válido cadastrado
    When Eu tento fazer login com a senha inválida
    Then Eu devo receber uma mensagem de erro indicando que a senha está incorreta

Realizar Login Com Dados Invalidos
    Given Eu não tenho um usuario com esse email
    When Eu tento fazer login com um email e senha inválidos
    Then Eu devo receber uma mensagem de erro indicando que o login falhou

