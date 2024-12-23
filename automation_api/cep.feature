Feature: Validação do CEP ViaCEP

  Scenario: Validar logradouro e DDD a partir de um CEP válido
    Given que a API ViaCEP está disponível
    When eu realizo uma requisição para o CEP "17345452"
    Then a resposta deve conter o logradouro "Rua Ângelo Biliassi"
    And a resposta deve conter o DDD "14"

  Scenario: Validar CEP incorreto
    Given que a API ViaCEP está disponível
    When eu realizo uma requisição para o CEP "00000000"
    Then a resposta deve indicar que o CEP é inválido


