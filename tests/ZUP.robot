*** Settings ***
Documentation      FASTSHOP - INSERIR PRODUTO NO CARRINHO
...                1- Entre no portal da FASTSHOP
...                2- Faça uma busca por um produto
...                3- Valide o retorno da busca
...                4- Escolha um produto na lista
...                5- Adicione ao carrinho
...                6- Valide o produto no carrinho
...                7- Insira um serviço

Resource         ../resources/base.robot

Suite Setup      Start Session
Suite Teardown   End Session
Test Teardown    End Test

*** Test Cases ***
TV LG 4k OLED77C9PSB
    [Template]                  Busca, verificação e adição ao carrinho de um item no site da FASTSHOP
    #CT                         #Objetivo                                      
	TV LG 4k OLED77C9PSB		                

*** Keywords ***
Busca, verificação e adição ao carrinho de um item no site da FASTSHOP
    [Arguments]     ${busca_produto}
    
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    Então o produto o é adicionado e verificado que está no carrinho 
    