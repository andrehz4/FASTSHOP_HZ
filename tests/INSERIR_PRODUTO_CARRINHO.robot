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
INSERIR UM PRODUTO NO CARRINHO
    [Template]                  Busca, verificação e adição ao carrinho de um item no site da FASTSHOP
    #CPF                        #Senha                      #Produto                                                       
    941.861.830-31              12345678                    AEMWHJ2BZACNZB  		                    

#INSERIR UM PRODUTO NO CARRINHO COM SERVIÇO
#    [Template]                  Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
#    #CPF                        #Senha                      #Produto                                                       
#    941.861.830-31              12345678                    AEMWHJ2BZACNZB  		                    


*** Keywords ***
Busca, verificação e adição ao carrinho de um item no site da FASTSHOP
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    Então o produto ${busca_produto} é adicionado e verificado que está no carrinho 
    
Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   

    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço
    Então o produto ${busca_produto} é adicionado e verificado que está no carrinho 
