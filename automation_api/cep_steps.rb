require 'httparty'

Given('que a API ViaCEP está disponível') do
  @url = "https://viacep.com.br/ws/"
end

When('eu realizo uma requisição para o CEP {string}') do |cep|
  @cep = cep
  @response = HTTParty.get("#{@url}#{@cep}/json/")
end

Then('a resposta deve conter o logradouro {string}') do |logradouro|
  expect(@response.parsed_response['logradouro']).to eq(logradouro)
end

Then('a resposta deve conter o DDD {string}') do |ddd|
  expect(@response.parsed_response['ddd']).to eq(ddd)
end

Then('a resposta deve indicar que o CEP é inválido') do
  expect(@response.code).to eq(200)
  expect(@response.parsed_response['erro']).to eq("true")  
end


