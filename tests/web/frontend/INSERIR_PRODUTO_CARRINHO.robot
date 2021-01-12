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

Resource         ../../../resources/base.robot
Suite Setup      Start Session 
Suite Teardown   End Session
Test Teardown    End Test


*** Test Cases ***    
INSERIR UM PRODUTO NO CARRINHO SEM SERVIÇO
    [Template]                  Busca, verificação e adição ao carrinho de um item no site da FASTSHOP
    #CPF                        #Senha                      #Produto                                                       
    10869732404              12345678                    PANAF160B5W1  		                    

EXCLUIR UM PRODUTO NO CARRINHO
    [Template]                  Excluir produto sem serviço no carrinho quando existe só um produto
    #CPF                        #Senha                      #Produto                                                       
    10869732404              12345678                    PANAF160B5W1  		   


PRODUTO INSERIDO NO CARRINHO, AUMENTO DE QUANTIDADE E EXCLUSÃO DO ITEM
    [Template]                  Alterar quantidade de um produto no carrinho

    #CPF                        #Senha                      #Produto                                                                  
    50918362415               12345678                    SGWD11M44530W1  	

EXLUIR SERVIÇO DO PRODUTO
    [Template]                  Excluir serviço de um produto do carrinho quando existe só um produto

    #CPF                        #Senha                      #Produto                                                                  
    93765208159              12345678                    SGWD11M44530W1  	

#EXLUIR SERVIÇO DO PRODUTO QUANDO EXISTE MAIS DE UM ITEM
#    [Template]                  Excluir serviço de um produto do carrinho quando existe mais de um produto

    #CPF                        #Senha                      #Produto                #Produto2                                                  
#    94013628589              12345678                    AEMWHJ2BZACNZB  		8S311310222PTO  

CARRINHO COM UM PRODUTO COM SERVIÇO E O MESMO É EXCLUIDO
    [Template]                  Excluir produto com serviço no carrinho quando existe só um produto

    #CPF                        #Senha                      #Produto                                                                  
    92741680396              12345678                    SGWD11M44530W1  	


CARRINHO COM DOIS PRODUTOS SEM SERVIÇO, UM ITEM É EXCLUIDO
    [Template]                  Excluir produto sem serviço no carrinho quando existe mais de um produto

    #CPF                        #Senha                      #Produto                #Produto2                                                  
    46370912506              12345678                    AEMWHJ2BZACNZB  		8S311310222PTO                    
                 
#CARRINHO COM DOIS PRODUTOS, UM PRODUTO TEM SERVIÇO E O MESMO É EXCLUIDO
#    [Template]                  Excluir produto com serviço no carrinho quando existe mais de um produto

    #CPF                        #Senha                      #Produto                #Produto2                                                  
#    67204539125              12345678                    AEMWHJ2BZACNZB  		8S311310222PTO   

	   





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

Excluir produto sem serviço no carrinho quando existe mais de um produto
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}            ${busca_produto_dois}                  

    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    Quando um segundo produto é preenchido no campo de busca${busca_produto_dois}, verifico se o mesmo é retornado na lista
    Então um produto ${busca_produto} é adicionado e verificado e excluido do carrinho, ficando com apenas um produto sem serviço

Excluir produto com serviço no carrinho quando existe só um produto
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                            

    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de SUPORTE TÉCNICO
    Então um produto ${busca_produto} é adicionado e verificado e excluido do carrinho, ficando com apenas um produto sem serviço
 

Excluir produto com serviço no carrinho quando existe mais de um produto
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}            ${busca_produto_dois}                  

    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de SEGURO
    Quando um segundo produto é preenchido no campo de busca${busca_produto_dois}, verifico se o mesmo é retornado na lista
    Então um produto ${busca_produto} é adicionado e verificado e excluido do carrinho, ficando com apenas um produto sem serviço


Alterar quantidade de um produto no carrinho
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   

    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    Então o produto ${busca_produto} é adicionado e verificado que está no carrinho 
    E seleciono a quantidade de produtos ${busca_produto} igual a cinco
    Então o produto ${busca_produto} é adicionado e verificado e excluido do carrinho, ficando vazio

Excluir serviço de um produto do carrinho quando existe só um produto
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                            

    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de SUPORTE TÉCNICO
    Então um produto ${busca_produto} com serviço é adicionado e verificado e o seu serviço é excluido

Excluir serviço de um produto do carrinho quando existe mais de um produto
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}            ${busca_produto_dois}                  

    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de SEGURO
    Quando um segundo produto é preenchido no campo de busca${busca_produto_dois}, verifico se o mesmo é retornado na lista
    Então um produto ${busca_produto} com serviço é adicionado e verificado e o seu serviço é excluido
