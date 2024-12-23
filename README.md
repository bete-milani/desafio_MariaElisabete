Oi,

Segue meus testes do desafio:

Enfrentei algumas limitações com minha máquina durante a instalação dos requisitos necessários para os testes de mobile. 
Embora não tenha sido possível realizar a execução completa, dediquei bastante tempo e esforço para escrever os testes com base no que seria a abordagem ideal. 
Embora esses testes não tenham sido validados na execução, eles refletem claramente como eu os implementaria em um ambiente funcional.



Testes de API ViaCEP com Cucumber e HTTParty
Este projeto realiza testes automatizados para a API ViaCEP utilizando Cucumber e HTTParty, gerando relatórios HTML de execução.

Requisitos
Ruby 3.x ou superior
Bundler

gem install bundler --user-install
bundle install

Para rodar os testes:
cucumber -r features --format html --out report.html
Abra o arquivo report.html no navegador para visualizar os resultados.
