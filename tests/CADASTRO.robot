*** Settings ***
Documentation      FASTSHOP - CADASTRO
...                Como um usuário e-commerce
...                Desejo criar uma conta no site da Fast Shop
...                Para que ele possa realizar a compra de produtos através do site
...                Como pessoa física gostaria de realizar o cadastro no site da Fast Shop https://www.fastshop.com.br
...                Primeiro inserir o CPF ainda não cadastrado no site, deve ser feita a validação se esse CPF já está cadastrado, 
...                caso já esteja cadastrado deve aparecer o campo de senha.

Resource           ../resources/base.robot
Suite Setup        Start Session
Suite Teardown     End Session
Test Teardown      End Test


*** Test Cases ***
CADASTRO COM SUCESSO
    [Template]                  Cadastro com sucesso 
    #CPF                        #Senha                      #Nome                                                       
    941.861.830-31              12345678                    Teste                    
      

 
*** Keywords ***
Cadastro com sucesso 
    [Arguments]                 ${usuario_existente}                    ${senha_valida}                 ${nome_cliente_logado}                   
    
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando acesso e verifico que estou na página de cadastro, insiro um cpf não existente    
    E todos os campos da tela de cadastro são preenchidos
    E é autorizado o recebimento de ofertas via e-mail e sms
    Então ao clicar em continuar a primeira etapa do cadastrado é encerrada com sucesso
    E é preenchido o campo de endereço, todas as informações são recebidas 
