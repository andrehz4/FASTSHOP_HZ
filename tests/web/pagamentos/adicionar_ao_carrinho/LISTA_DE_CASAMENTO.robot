*** Settings ***
Documentation      FASTSHOP - LISTA DE CASAMENTO
...                Para que eu possa acessar o site da FastShop, sendo um cliente, quero poder adicionar um produto ao carrinho e efetuar o pagamento.
...                1- Entre no portal da FASTSHOP
...                2- Faça uma busca por um produto
...                3- Valide o retorno da busca
...                4- Escolha um produto na lista
...                5- Adicione ao carrinho
...                6- Valide o produto no carrinho
...                7- Insira um serviço
...                8- Realizar o pagamento via lista de casamento

Resource         ../../../../resources/base.robot
Suite Setup      Start Session
Suite Teardown   End Session
Test Teardown    End Test


*** Test Cases ***    
CONCLUIR UMA COMPRA VIA LISTA DE CASAMENTO
    [Template]                  Busca, verificação e adição no carrinho e conclusão da compra de um item sem serviço no site da FASTSHOP
    [Tags]                      LISTA1                      COMESTOQUE                LISTAPIPE 
    #CPF                        #Senha                      #Produto                                                       
    22179407831                 123456                      PANAF160B5W1  		                    

PRODUTO COM SERVIÇO DE GARANTIA ESTENDIDA PAGAMENTO LISTA DE CASAMENTO
    [Template]                  Garantia estendida na Lista de casamento - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Tags]                      LISTA2                      COMESTOQUE                LISTAPIPE
    #CPF                        #Senha                      #Produto                                                       
    22179407831                 123456                      PANAF160B5W1  

PRODUTO COM SERVIÇO DE SEGURO PAGAMENTO LISTA DE CASAMENTO
    [Template]                  SEGURO SERVIÇO na Lista de casamento - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Tags]                      LISTA3                      COMESTOQUE                LISTAPIPE 
    #CPF                        #Senha                      #Produto                                                       
    22179407831                 123456                      JBLXTREME2PTO  

PRODUTO COM SERVIÇO DE INSTALAÇÃO PAGAMENTO LISTA DE CASAMENTO
    [Template]                  INSTALAÇÂO SERVIÇO na Lista de casamento - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Tags]                      LISTA4                      COMESTOQUE                LISTAPIPE 
    #CPF                        #Senha                      #Produto                                                       
    22179407831                 123456                      PANAF160B5W1                            

PRODUTO COM SERVIÇO DE SEGURO QUEBRA ACIDENTAL PAGAMENTO LISTA DE CASAMENTO
    [Template]                  QUEBRA ACIDENTAL SERVIÇO na Lista de casamento - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Tags]                      LISTA5                      COMESTOQUE                LISTAPIPE 
    #CPF                        #Senha                      #Produto                                                       
    22179407831                 123456                      JBLXTREME2PTO    

PRODUTO COM SERVIÇO DE SUPORTE TÉCNICO PAGAMENTO LISTA DE CASAMENTO
    [Template]                  SUPORTE TÉCNICO SERVIÇO na Lista de casamento - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    #CPF                        #Senha                      #Produto                                                       
    22179407831                 123456                      SGWD11M44530W1                    

PRODUTO COM SERVIÇO DE PROTEÇÃO DIGITAL PAGAMENTO LISTA DE CASAMENTO
    [Template]                  PROTEÇÃO DIGITAL SERVIÇO na Lista de casamento - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    #CPF                        #Senha                      #Produto                                                       
    22179407831                 123456                      SGWD11M44530W1  
 
DOIS PRODUTOS NO CARRINHO COM SERVIÇO PAGAMENTO LISTA DE CASAMENTO
    [Template]                  Busca de dois produtos, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço

    #CPF                        #Senha                      #Produto                    #Produto2                                                       
    22179407831                 123456                     8S311310222PTO              PANAF160B5W1  




*** Keywords ***
Busca, verificação e adição no carrinho e conclusão da compra de um item sem serviço no site da FASTSHOP
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    Então quero pagar via lista de casamento o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada

Garantia estendida na Lista de casamento - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de GARANTIA ESTENDIDA
    Então quero pagar via lista de casamento o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada

SEGURO SERVIÇO na Lista de casamento - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de SEGURO
    Então quero pagar via lista de casamento o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada

INSTALAÇÂO SERVIÇO na Lista de casamento - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de INSTALAÇÃO
    Então quero pagar via lista de casamento o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada


QUEBRA ACIDENTAL SERVIÇO na Lista de casamento - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de QUEBRA ACIDENTAL
    Então quero pagar via lista de casamento o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada

SUPORTE TÉCNICO SERVIÇO na Lista de casamento - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de SUPORTE TÉCNICO
    Então quero pagar via lista de casamento o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada

PROTEÇÃO DIGITAL SERVIÇO na Lista de casamento - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de PROTEÇÃO DIGITAL
    Então quero pagar via lista de casamento o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada


Busca de dois produtos, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}            ${busca_produto_dois}                  
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto_dois}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    Quando um segundo produto é preenchido no campo de busca${busca_produto_dois}, verifico se o mesmo é retornado na lista
    E adiciono um serviço de GARANTIA ESTENDIDA
    Então quero pagar via lista de casamento o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada    

Busca de dois produtos sem serviços, verificação e adição ao carrinho de um item no site da FASTSHOP
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}            ${busca_produto_dois}                  
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto_dois}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    Quando um segundo produto é preenchido no campo de busca${busca_produto_dois}, verifico se o mesmo é retornado na lista
    Então quero pagar via lista de casamento o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada    
