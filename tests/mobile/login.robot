*** Settings ***
Resource    ../../resources/app/android.robot
Resource    ../../resources/app/app_elements.robot
Resource    ../../resources/mobile_hz.robot

Documentation      FASTSHOP - Login
...                Como um usuário e-commerce
...                Acesso com um CPF e uma SENHA válida 
...                E verifico que retornei a home logado.


Test Setup         Abrir app
Test Teardown      Fechar app


*** Test Cases ***
LOGIN COM SUCESSO NO APLICATIVO ANDROID DA FASTSHOP - VERIFICAR NOME
     [Template]                       Login android com sucesso                                                                        
     #CPF            #SENHA           #Cliente logado
     34611974839     S@fra2019        ANDRE HENRIQUE ZIMERMANN


LOGIN COM SUCESSO NO APLICATIVO ANDROID DA FASTSHOP - VERIFICAR E-MAIL
     [Template]                       Login android com sucesso verificando o email                                                                    
     #CPF            #SENHA           #Email logado
     34611974839     S@fra2019        eng.andrehz@gmail.com

#Cpf não cadastrado
#CPF INVALIDO
#Senha invalida


*** Keywords ***
Login android com sucesso 
    [Arguments]                 ${usuario_existente}                    ${senha_valida}                 ${nome_cliente_logado}                   
    
    Dado que acesso e verifico que estou no app android da FASTSHOP
    Quando logo com o usuário ${usuario_existente} e insiro a sua senha válida ${senha_valida}
    Então o app me direciona para a tela inicial e exibe meu nome no canto superior esquerdo ${nome_cliente_logado}  
    
Login android com sucesso verificando o email
    [Arguments]                 ${usuario_existente}                    ${senha_valida}                 ${email_cliente_logado}                   
    
    Dado que acesso e verifico que estou no app android da FASTSHOP
    Quando logo com o usuário ${usuario_existente} e insiro a sua senha válida ${senha_valida}
    Então o aplicativo me direciona para a tela inicial e exibe meu nome no canto superior esquerdo ${email_cliente_logado}  