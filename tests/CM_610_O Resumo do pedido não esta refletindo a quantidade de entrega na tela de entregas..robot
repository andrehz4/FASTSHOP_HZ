*** Settings ***
Documentation      FASTSHOP - INSERIR PRODUTO NO CARRINHO COM ENTREGA EXIBIDA DE MANEIRA CORRETA
...                O Resumo do pedido não esta refletindo a quantidade de entrega.
...                Passos para Execucao:
...                1 - Adicionar os produtos abaixo no carrinho.
...                AEMWHJ2BZACNZB
...                UXX512FJEJ228B
...                EXDB84X2
...                LG50UM7510PSBB
...                SGWD11M44530W1
...                2 - ir até a tela de entregas.
...                3 - Aparece entrega 1 de 2 e 2 de 2
...                4 - No resumo do carrinho aparece 3 entregas.

Resource         ../resources/base.robot
Suite Setup      Start Session
Suite Teardown   End Session
Test Teardown    End Test


*** Test Cases ***        
INSERIR DOIS PRODUTOS NO CARRINHO COM SERVIÇO COM ENTREGAS EXIBIDAS DE MANEIRA CORRETA
    [Template]                  Busca de dois produtos, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço

    #CPF                    #Senha        #Produto             #Produto2           #Produto3           #Produto4           #Produto5                                                       
    941.861.830-31          12345678      SGWD11M44530W1       UXX512FJEJ228B      EXDB84X2            LG50UM7510PSBB      AEMWHJ2BZACNZB    





*** Keywords ***
Busca de dois produtos, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]     ${cpf}       ${senha}    ${busca_produto}       ${busca_produto_dois}       ${busca_produto_tres}       ${busca_produto_quatro}     ${busca_produto_cinco}                  

    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    Quando um segundo produto é preenchido no campo de busca${busca_produto_dois}, verifico se o mesmo é retornado na lista
    Quando um terceiro produto é preenchido no campo de busca${busca_produto_tres}, verifico se o mesmo é retornado na lista
    Quando um quarto produto é preenchido no campo de busca${busca_produto_quatro}, verifico se o mesmo é retornado na lista
    Quando um quinto produto é preenchido no campo de busca${busca_produto_cinco}, verifico se o mesmo é retornado na lista
    E adiciono um serviço
    Então o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada   
