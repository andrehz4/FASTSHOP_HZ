*** Settings ***
Documentation      FASTSHOP - INSERIR PRODUTO NO CARRINHO
...                Ao selecionar servicos de garantia e instalacao com uma data especifica erro nao foi informado ao usuario
...                1 - adicionar produto ao carrinho PANAF160B5W1
...                2 - selecionar garantia estendida
...                3 - selecionar servico de instalacao com uma data especifica


Resource         ../resources/base.robot
Suite Setup      Start Session
Suite Teardown   End Session
Test Teardown    End Test


*** Test Cases ***        
INSERIR DOIS PRODUTOS NO CARRINHO COM SERVIÇO DE INSTALAÇÃO E SEGURO
    [Template]                  Busca de dois produtos, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço

    #CPF                        #Senha                      #Produto                    #Produto2                                                       
    941.861.830-31              12345678                    8S311310222PTO              PANAF160B5W1  





*** Keywords ***
Busca de dois produtos, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}            ${busca_produto_dois}                  

    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    Quando um segundo produto é preenchido no campo de busca${busca_produto_dois}, verifico se o mesmo é retornado na lista
    E adiciono um serviço de garantia estendida com data para instalação
    Então o produto ${busca_produto} ${busca_produto_dois} são adicionados, verificados que estão no carrinho e a compra é encerrada com pagamento via cartão de crédito

