*** Settings ***
Resource    ../../resources/app/android.robot
Resource    ../../resources/app/app_elements.robot
Resource    ../../resources/mobile_hz.robot

Documentation      FASTSHOP - Cadastro
...                Como um usuário e-commerce
...                Desejo criar uma conta no site da Fast Shop
...                Para que ele possa realizar a compra de produtos através do site
...                Como pessoa física gostaria de realizar o cadastro no aplicativo android da Fast Shop 
...                Primeiro inserir o CPF ainda não cadastrado no site, deve ser feita a validação se esse CPF já está cadastrado, 
...                caso já esteja cadastrado deve aparecer o campo de senha.


Test Setup         Abrir app
Test Teardown      Fechar app


*** Test Cases ***
CADASTRO COM SUCESSO
     [Template]                       Cadastro com sucesso aplicativo android                                                                     
     #CPF            #SENHA           #Cliente logado
         TESTE            TESTE             TESTe


*** Keywords ***
Cadastro com sucesso aplicativo android
    [Arguments]                 ${usuario_existente}                    ${senha_valida}                 ${nome_cliente_logado}                   
    
    Dado que acesso e verifico que estou no app android da FASTSHOP
    Quando acesso e verifico que estou na página de cadastro, insiro um cpf não existente    
    E todos os campos da tela de cadastro são preenchidos
    Então sou cadastrado e meu email é exibido ao clicar no icone de perfil da tela inicial

    