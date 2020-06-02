*** Settings ***
Documentation      FASTSHOP - LISTA DE FAVORITOS
...                Para que eu possa acessar o site da FastShop, sendo um cliente, quero gerenciar produtos da lista de favoritos.
...                Como um usuário da Fast Shop
...                o cliente deseja incluir e excluir um produto da lista de favoritos
...                Para que ele possa guardar quais itens ele deseja comprar no futuro

Resource         ../resources/base.robot
Suite Setup      Start Session
Suite Teardown   End Session
Test Teardown    End Test

  
*** Test Cases ***        
INSERIR UM PRODUTO EM SUA PÁGINA NA LISTA DE FAVORITOS E EXCLUÍ-LO 
    [Template]                  Incluir produto acessando sua página do produto na lista de favoritos

    #CPF                        #Senha                      #Produto                                                                      
    941.861.830-31              12345678                    PANAF160B5W1               

INSERIR UM PRODUTO VIA VITRINE NA LISTA DE FAVORITOS E EXCLUÍ-LO 
    [Template]                  Incluir produto via vitrine na lista de favoritos

    #CPF                        #Senha                      #Produto                                                                      
    941.861.830-31              12345678                    8S311310222PTO     


INSERIR CINCO PRODUTOS ACESSADO SUAS PÁGINAS NA LISTA DE FAVORITOS E EXCLUÍ-LOS 
    [Template]                  Incluir cinco produtos acessando a página dos produtos na lista de favoritos

    #CPF                        #Senha                      #Produto1       #Produto2          #Produto3            #Produto4        #Produto5                                                                       
    941.861.830-31              12345678                    PANAF160B5W1    JBLCHARGE4VRMB     8S311310222PTO       EXDB84X1         LGCV7011WS42
        


*** Keywords ***
Incluir produto acessando sua página do produto na lista de favoritos
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   

    Dado que acesso e verifico que estou no site da FASTSHOP e realizo o login com o cpf ${cpf} e a senha ${senha}
    Quando quero add em favoritos preencho o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    Então em favoritos o produto ${busca_produto} é adicionado e verificado que ele está no carrinho 


Incluir cinco produtos acessando a página dos produtos na lista de favoritos
    [Arguments]    ${cpf}       ${senha}     ${busca_produto}        ${busca_produto_dois}       ${busca_produto_tres}       ${busca_produto_quatro}     ${busca_produto_cinco}                  

    Dado que acesso e verifico que estou no site da FASTSHOP e realizo o login com o cpf ${cpf} e a senha ${senha}
    Quando quero add em favoritos cinco prudutos então preencho o campo de busca ${busca_produto},${busca_produto_dois},${busca_produto_tres},${busca_produto_quatro},${busca_produto_cinco} verifico se o mesmo é retornado na lista
    Então em favoritos os produtos em favoritos ${busca_produto},${busca_produto_dois},${busca_produto_tres},${busca_produto_quatro},${busca_produto_cinco} são adicionados e verificados que estão no carrinho 

Incluir produto via vitrine na lista de favoritos
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   

    Dado que acesso e verifico que estou no site da FASTSHOP e realizo o login com o cpf ${cpf} e a senha ${senha}
    Quando acesso a vitrine quero add em favoritos preencho o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista 
    Então em favoritos o produto ${busca_produto} é adicionado e verificado que ele está no carrinho 
