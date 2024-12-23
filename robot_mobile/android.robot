# Configurações Android

*** Settings ***
Library         AppiumLibrary


*** Variables ***
${REMOTE_URL}               http://127.0.0.1:4723
${platformName}             Android
${appium:platformVersion}   15
${appium:deviceName}        sdk_gphone64_x86_64_
${appium:automationName}    UiAutomator2
${appium:appPackage}    com.example.vamsi.login
${appium:appActivity}   com.example.vamsi.login.MainActivity 
${appium:newCommandTimeout}   3600

${USUARIO_VALIDO}     usuario_valido
${USUARIO_INVALIDO}   usuario invalido  
${EMAIL_VALIDO}       email-valido@teste.com
${EMAIL_INVALIDO}     email-invalido@teste.com
${SENHA_VALIDA}       senha1234
${SENHA_INVALIDA}     senha4567
${TELEFONE}           11 91234-5678  


*** Keywords ***
Abrir App
    Open Application    ${REMOTE_URL}   platformName=${platformName}  appium:platformVersion=${appium:platformVersion}  appium:deviceName=${appium:deviceName}  appium:automationName=${appium:automationName}   appium:appPackage=${appium:appPackage}  appium:appActivity=${appium:appActivity}  appium:newCommandTimeout=${appium:newCommandTimeout}
    
Fechar App
    Close Application

Eu acessei a tela de cadastro
    Click Element    id=com.example.vamsi.login:id/tvRegister
    Wait Until Element Is Visible    id=com.example.vamsi.login:id/etRegName

Eu preencho os dados de cadastro com um novo usuario
    Input Text    id=com.example.vamsi.login:id/etRegName    ${USUARIO_VALIDO}
    Input Text    id=com.example.vamsi.login:id/etRegPhone   ${TELEFONE}
    Input Text    id=com.example.vamsi.login:id/etRegGmail   ${EMAIL_VALIDO}
    Input Text    id=com.example.vamsi.login:id/etRegPassword ${SENHA_VALIDA}

Eu clico no botão de cadastro
    Click Element    id=com.example.vamsi.login:id/btnRegLogin

O cadastro deve ser realizado com sucesso
    Wait Until Element Is Visible    id=com.example.vamsi.login:id/tvWelcomeMessage
    Element Text Should Be    id=com.example.vamsi.login:id/tvWelcomeMessage    "Bem-vindo"

Eu tento fazer login com o usuario e senha válidos
    Input Text    id=com.example.vamsi.login:id/etLogGmail    ${EMAIL_VALIDO}
    Input Text    id=com.example.vamsi.login:id/etLoginPassword   ${SENHA_VALIDA}
    Click Element    id=com.example.vamsi.login:id/btnLogin

O login deve ser realizado com sucesso
    Wait Until Element Is Visible    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.TextView
    Go Back


Eu tento fazer login com um email inexistente
    Input Text    id=com.example.vamsi.login:id/etLogGmail    ${EMAIL_INVALIDO}
    Input Text    id=com.example.vamsi.login:id/etLoginPassword   ${SENHA_VALIDA}
    Click Element    id=com.example.vamsi.login:id/btnLogin

Eu devo receber uma mensagem de erro indicando que o usuario não existe
    Wait Until Element Is Visible    id=com.example.vamsi.login:id/errorMessage
    Element Text Should Be    id=com.example.vamsi.login:id/errorMessage    "Usuario não encontrado"

Eu tento fazer login com a senha inválida
    Input Text    id=com.example.vamsi.login:id/etLogGmail    ${EMAIL_VALIDO}
    Input Text    id=com.example.vamsi.login:id/etLoginPassword   ${SENHA_INVALIDA}
    Click Element    id=com.example.vamsi.login:id/btnLogin

Eu devo receber uma mensagem de erro indicando que a senha está incorreta
    Wait Until Element Is Visible    id=com.example.vamsi.login:id/errorMessage
    Element Text Should Be    id=com.example.vamsi.login:id/errorMessage    "Senha incorreta"

Eu tento fazer login com um email e senha inválidos
    Input Text    id=com.example.vamsi.login:id/etLogGmail    ${EMAIL_INVALIDO}
    Input Text    id=com.example.vamsi.login:id/etLoginPassword   ${SENHA_INVALIDA}
    Click Element    id=com.example.vamsi.login:id/btnLogin

Eu devo receber uma mensagem de erro indicando que o login falhou
    Wait Until Element Is Visible    id=com.example.vamsi.login:id/errorMessage
    Element Text Should Be    id=com.example.vamsi.login:id/errorMessage    "Login falhou"