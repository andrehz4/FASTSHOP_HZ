*** Settings ***
Documentation      FASTSHOP - INSERIR PRODUTO NO CARRINHO
...                Para que eu possa acessar o site da FastShop, sendo um cliente, quero poder adicionar um produto ao carrinho.
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
INSERIR DOIS PRODUTOS NO CARRINHO COM SERVIÇO 
    [Template]                  Busca de dois produtos, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço

    #CPF                        #Senha                      #Produto                    #Produto2                                                       
    941.861.830-31              12345678                    8S311310222PTO              AEMWHJ2BZACNZB  





*** Keywords ***
Busca, verificação e adição ao carrinho de um item no site da FASTSHOP
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   

    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    Então o produto ${busca_produto} é adicionado e verificado que está no carrinho 

Excluir produto sem serviço no carrinho quando existe só um produto
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}    

    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    Então o produto ${busca_produto} é adicionado e verificado e excluido do carrinho, ficando vazio

Busca, verificação e adição no carrinho e conclusão da compra de um item sem serviço no site da FASTSHOP
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    Então o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada 

Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   

    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço
    Então o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada

Busca de dois produtos, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}            ${busca_produto_dois}                  

    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    Quando um segundo produto é preenchido no campo de busca${busca_produto_dois}, verifico se o mesmo é retornado na lista
    E adiciono um serviço
    Então o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada    

Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento no cartão de crédito
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   

    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço
    Então o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada com pagamento via cartão de crédito