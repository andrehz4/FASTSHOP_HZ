*** Settings ***
Resource    ../../resources/app/android.robot
Resource    ../../resources/app/app_elements.robot
Resource    ../../resources/mobile_hz.robot

Documentation      FASTSHOP ANDROID - REALIZAR PAGAMENTO
...                Para que eu possa acessar o site da FastShop, sendo um cliente, quero poder adicionar um produto ao carrinho e efetuar o pagamento.
...                1- Entre no portal da FASTSHOP
...                2- Faça uma busca por um produto
...                3- Valide o retorno da busca
...                4- Escolha um produto na lista
...                5- Adicione ao carrinho
...                6- Valide o produto no carrinho
...                7- Insira um serviço
...                8- Realizar o pagamento

Test Setup         Abrir app
Test Teardown      Fechar app


*** Test Cases ***
PAGAMENTO ANDROID VIA BOLETO
     [Template]                       Login android, busca produto, inserir no carrinho e efetuar pagamento via BOLETO                                                      
     #CPF            #SENHA           #Produto
     91568723059     12345678         BRBRE57AK1


*** Keywords ***
Login android, busca produto, inserir no carrinho e efetuar pagamento via BOLETO
    [Arguments]                 ${usuario_existente}                    ${senha_valida}                 ${busca_produto}                  
    
    Dado que acesso e verifico que estou no app android da FASTSHOP    
    Quando logo com o usuário ${usuario_existente} e insiro a sua senha válida ${senha_valida}
    E busco, insiro e verifico um produto no carrinho ${busca_produto} 
    







