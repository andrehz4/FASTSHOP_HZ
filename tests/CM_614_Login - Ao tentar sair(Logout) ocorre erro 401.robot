*** Settings ***
Documentation      FASTSHOP - REALIZAR LOGIN E LOGOUT
...                Como um novo usuário
...                Edwin deseja acessar o site da Fastshop
...                Para que ele possa navegar e realizar compras no website
...                Logo após logout para verificar se está ocorrendo problemas

Resource         ../resources/base.robot
Suite Setup      Start Session
Suite Teardown   End Session
Test Teardown    End Test


*** Test Cases ***
LOGIN E LOGOUT COM SUCESSO
    [Template]                  Login e lougout com sucesso 
    #CPF                        #Senha                      #Nome                                                       
    941.861.830-31              12345678                    Teste                    

 
*** Keywords ***
Login e lougout com sucesso 
    [Arguments]                 ${usuario_existente}                    ${senha_valida}                 ${nome_cliente_logado}                   
    
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando logo com o usuário ${usuario_existente} e insiro a sua senha válida ${senha_valida}
    Então o site me direciona para a tela inicial e exibe meu nome no canto superior direito ${nome_cliente_logado}  
    E ao clicar em sair o nome ${nome_cliente_logado} não está presente no canto superior direito da tela. 
    
