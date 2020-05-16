*** Settings ***
Documentation      ZUP - AUTOMAÇÃO WEB
...                Utilizando as ferramentas que preferir crie um teste automatizado que faça o fluxo de ponta
...                a ponta de um cliente que:
...                #1- Entre em um grande portal de comércio online
...                #(Exemplo: Americanas, Submarino, Magazine Luiza)
...                #2- Faça uma busca por um produto
...                3- Valide o retorno da busca
...                4- Escolha um produto na lista
...                5- Adicione o carrinho
...                6- Valide o produto no carrinho
...                Para a criação dos cenários de testes devem ser considerados casos de sucesso e fluxos
...                alternativos


Resource         ../resources/base.robot


Suite Setup      Start Session
Suite Teardown   End Session

Test Teardown    End Test

*** Test Cases ***
TV LG 4k OLED77C9PSB
    [Template]                  Busca, verificação e adição ao carrinho do item TV LG 4k OLED77C9PSB no site Megazine Luiza
    #CT                         #Objetivo                                      
	TV LG 4k OLED77C9PSB		                



*** Keywords ***
Busca, verificação e adição ao carrinho do item TV LG 4k OLED77C9PSB no site Megazine Luiza
    [Arguments]     ${busca_produto}
    
    Dado que acesso e verifico que estou no site Magazine Luiza
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    Então o produto o é adicionado e verificado que está no carrinho 
    