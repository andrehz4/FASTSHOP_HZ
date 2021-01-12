*** Settings ***
Documentation      FASTSHOP - REALIZAR LOGIN
...                Como um novo usuário
...                Edwin deseja acessar o site da Fastshop
...                Para que ele possa navegar e realizar compras no website

Resource         ../../../resources/base.robot
Suite Setup      Start Session
Suite Teardown   End Session
Test Teardown    End Test


*** Test Cases ***
LOGIN COM SUCESSO
    [Template]                  Login com sucesso
    [Tags]                      LOGIN1
    #CPF                        #Senha                      #Nome                                                       
    14756029876                  12345678                        Daniel                    

LOGIN COM SENHA INCORRETA
    [Template]                  Realizar login com dados inválidos
    [Tags]                      LOGIN2
    #CPF                        #Senha                      #Mensagem de falha                                                       
    941.861.830-31              123456789                   Senha incorreta
    941.861.830-31              1234568                     Senha incorreta 

LOGIN COM CPF INVÁLIDO
    [Template]                  Realizar login com CPF inválido
    [Tags]                      LOGIN3  
    #CPF                        #Senha                      #Mensagem de falha     
    941.861.830-32              12345678                    Informe um CPF ou CNPJ válido
    941.861.830-36              12345678                    Informe um CPF ou CNPJ válido 
    
LOGIN COM CAMPOS EM BRANCO
    [Tags]                      LOGIN4
    [Template]                  Realizar login com CPF inválido   
    #CPF                        #Senha                      #Mensagem de falha     
    ${EMPTY}                    12234344                    Campo obrigatório  
    34611974839                 ${EMPTY}                    Campo obrigatório            

 
*** Keywords ***
Login com sucesso 
    [Arguments]                 ${usuario_existente}                    ${senha_valida}                 ${nome_cliente_logado}                   
    
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando logo com o usuário ${usuario_existente} e insiro a sua senha válida ${senha_valida}
    Então o site me direciona para a tela inicial e exibe meu nome no canto superior direito ${nome_cliente_logado}  
    
Realizar login com dados inválidos
    [Arguments]                 ${usuario}                    ${senha}                 ${mensagem_login_invalido}                   
    
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando tento logar com o usuário ${usuario} e insiro a sua senha ${senha} 
    Entao deve ser apresentada a mensagem que os dados são inválidos ${mensagem_login_invalido}  

Realizar login com CPF inválido
    [Arguments]                 ${usuario}                    ${senha}                 ${mensagem_login_cpf_invalido}                   
    
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando tento logar com o usuário ${usuario} e insiro a sua senha ${senha} 
    Entao será apresentada a mensagem que o cpf é inválido ${mensagem_login_cpf_invalido} 
