*** Settings ***
Documentation      FASTSHOP - INSERIR PRODUTO NO CARRINHO
...                Para selecionar servico de "seguro" erro foi retornado pelo servidor(ERROR_EXCEEDED_MAX_PRODUCT_LIMIT) ao tentar clickar em aplicar
...                1 - incluir no carrinho produto(8S311310222PTO)
...                2 - incluir no carrinho produto(AEMWHJ2BZACNZB)
...                3 - selecionar seguro para produto -> AEMWHJ2BZACNZB

Resource         ../resources/base.robot
Suite Setup      Start Session
Suite Teardown   End Session
Test Teardown    End Test


*** Test Cases ***        
INSERIR DOIS PRODUTOS NO CARRINHO COM SERVIÇO 
    [Template]                  Busca de dois produtos, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço

    #CPF                        #Senha                      #Produto                    #Produto2                                                       
    941.861.830-31              12345678                    8S311310222PTO              AEMWHJ2BZACNZB  





*** Keywords ***
Busca de dois produtos, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}            ${busca_produto_dois}                  

    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    Quando um segundo produto é preenchido no campo de busca${busca_produto_dois}, verifico se o mesmo é retornado na lista
    E adiciono um serviço
    Então o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada   
