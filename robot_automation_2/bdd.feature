Feature: Admin Management

  Scenario: Realizar login com sucesso
    Given eu estou na página de login
    When eu faço login com usuário válido
    Then eu vejo a tela principal do sistema

  Scenario: Cadastrar novo administrador
    Given estou logado no sistema
    When eu preencho o formulário de cadastro de administrador
    Then o novo administrador é cadastrado com sucesso

  Scenario: Buscar e deletar administrador
    Given estou logado no sistema
    When eu busco e excluo o administrador recém-cadastrado
    Then o administrador é excluído com sucesso

