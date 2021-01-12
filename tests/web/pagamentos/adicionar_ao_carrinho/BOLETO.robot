*** Settings ***
Documentation      FASTSHOP - REALIZAR PAGAMENTO
...                Para que eu possa acessar o site da FastShop, sendo um cliente, quero poder adicionar um produto ao carrinho e efetuar o pagamento.
...                1- Entre no portal da FASTSHOP
...                2- Faça uma busca por um produto
...                3- Valide o retorno da busca
...                4- Escolha um produto na lista
...                5- Adicione ao carrinho
...                6- Valide o produto no carrinho
...                7- Insira um serviço
...                8- Realizar o pagamento

Resource         ../../../../resources/base.robot
Suite Setup      Start Session
Suite Teardown   End Session
Test Teardown    End Test


*** Test Cases **    
CONCLUIR UMA COMPRA COM BOLETO
    [Template]                  Busca, verificação e adição no carrinho e conclusão da compra de um item sem serviço no site da FASTSHOP
    [Tags]                      BOLETO1                     COMESTOQUE        BOLETOPIPE   
    #CPF                        #Senha                      #Produto                                                       
    41682739031                 12345678                    UXZS660128PTOB  #PANAF160B5W1  		                    

PRODUTO COM SERVIÇO DE GARANTIA ESTENDIDA PAGAMENTO BOLETO
    [Template]                  Garantia estendida no Boleto - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Tags]                      BOLETO2                     COMESTOQUE        BOLETOPIPE
    #CPF                        #Senha                      #Produto                                                       
    75630241826                 12345678                    UXZS660128PTOB    

PRODUTO COM SERVIÇO DE SEGURO PAGAMENTO BOLETO
    [Template]                  SEGURO SERVIÇO no Boleto - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Tags]                      BOLETO3                     COMESTOQUE        BOLETOPIPE        
    #CPF                        #Senha                      #Produto                                                       
    69815437291                 12345678                    UXZS660128PTOB  

PRODUTO COM SERVIÇO DE INSTALAÇÃO PAGAMENTO BOLETO
    [Template]                  INSTALAÇÂO SERVIÇO no Boleto - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Tags]                      BOLETO4                     COMESTOQUE        BOLETOPIPE
    #CPF                        #Senha                      #Produto                                                       
    60389721450                 12345678                    SGWW11K6800AW1  #PANAF160B5W1                            

PRODUTO COM SERVIÇO DE SEGURO QUEBRA ACIDENTAL PAGAMENTO BOLETO
    [Template]                  QUEBRA ACIDENTAL SERVIÇO no Boleto - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Tags]                      BOLETO5                     COMESTOQUE        BOLETOPIPE
    #CPF                        #Senha                      #Produto                                                       
    17408329650                 12345678                    UXZS660128PTOB    

PRODUTO COM SERVIÇO DE SUPORTE TÉCNICO PAGAMENTO BOLETO
    [Template]                  SUPORTE TÉCNICO SERVIÇO no Boleto - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Tags]                      BOLETO6
    #CPF                        #Senha                      #Produto                                                       
    04283657107                 12345678                    SGWD11M44530W1                    

PRODUTO COM SERVIÇO DE PROTEÇÃO DIGITAL PAGAMENTO BOLETO
    [Template]                  PROTEÇÃO DIGITAL SERVIÇO no Boleto - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Tags]                      BOLETO7
    #CPF                        #Senha                      #Produto                                                       
    56278091402                 12345678                    SGWD11M44530W1  
 
DOIS PRODUTOS NO CARRINHO COM SERVIÇO PAGAMENTO BOLETO
    [Template]                  Busca de dois produtos sem serviços, verificação e adição ao carrinho de um item no site da FASTSHOP
    [Tags]                      BOLETO8
    #CPF                        #Senha                      #Produto                    #Produto2                                                       
    32509741888                 12345678                    8S311310222PTO              PANAF160B5W1  




*** Keywords ***
Busca, verificação e adição no carrinho e conclusão da compra de um item sem serviço no site da FASTSHOP
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    Então o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada 

Garantia estendida no Boleto - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de GARANTIA ESTENDIDA
    Então o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada


SEGURO SERVIÇO no Boleto - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de SEGURO
    Então o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada

INSTALAÇÂO SERVIÇO no Boleto - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de INSTALAÇÃO
    Então o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada


QUEBRA ACIDENTAL SERVIÇO no Boleto - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de QUEBRA ACIDENTAL
    Então o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada

SUPORTE TÉCNICO SERVIÇO no Boleto - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de SUPORTE TÉCNICO
    Então o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada

PROTEÇÃO DIGITAL SERVIÇO no Boleto - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de PROTEÇÃO DIGITAL
    Então o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada


Busca de dois produtos sem serviços, verificação e adição ao carrinho de um item no site da FASTSHOP
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}            ${busca_produto_dois}                  
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto_dois}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    Quando um segundo produto é preenchido no campo de busca${busca_produto_dois}, verifico se o mesmo é retornado na lista
    Então o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada    


Busca de dois produtos, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}            ${busca_produto_dois}                  
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto_dois}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    Quando um segundo produto é preenchido no campo de busca${busca_produto_dois}, verifico se o mesmo é retornado na lista
    E adiciono um serviço de GARANTIA ESTENDIDA
    Então o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada    