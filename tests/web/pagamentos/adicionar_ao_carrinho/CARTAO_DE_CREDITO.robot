*** Settings ***
Documentation      FASTSHOP - REALIZAR PAGAMENTO VIA CARTÃO DE CRÉDITO
...                Para que eu possa acessar o site da FastShop, sendo um cliente, quero poder adicionar um produto ao carrinho e efetuar o pagamento.
...                1- Entre no portal da FASTSHOP
...                2- Faça uma busca por um produto
...                3- Valide o retorno da busca
...                4- Escolha um produto na lista
...                5- Adicione ao carrinho
...                6- Valide o produto no carrinho
...                7- Insira um serviço
...                8- Realizar o pagamento via cartão de crédito

Resource         ../../../../resources/base.robot
Suite Setup      Start Session
Suite Teardown   End Session
Test Teardown    End Test


*** Test Cases ***    
CONCLUIR UMA COMPRA COM CARTÃO DE CRÉDITO
    [Template]                  Busca, verificação e adição no carrinho e conclusão da compra de um item sem serviço no site da FASTSHOP
    [Tags]                      CARTAO1                    COMESTOQUE            CARTAOPIPE
    #CPF                        #Senha                      #Produto                                                       
    36098124787                 12345678                   PANAF160B5W1    

PRODUTO COM SERVIÇO DE GARANTIA ESTENDIDA CARTÃO DE CRÉDITO
    [Template]                  Cartão Garantia estendida - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Tags]                      CARTAO2                     COMESTOQUE           CARTAOPIPE               
    #CPF                        #Senha                      #Produto                                                       
    80796452300                 12345678                    PANAF160B5W1  

PRODUTO COM SERVIÇO DE SEGURO CARTÃO DE CRÉDITO
    [Template]                  Cartão com serviço SEGURO - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Tags]                      CARTAO3                     COMESTOQUE           CARTAOPIPE
    #CPF                        #Senha                      #Produto                                                       
    16439258060                 12345678                    JBLXTREME2PTO  

PRODUTO COM SERVIÇO DE INSTALAÇÃO CARTÃO DE CRÉDITO
    [Template]                  Cartão Instalação - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Tags]                      CARTAO4                     COMESTOQUE           CARTAOPIPE
    #CPF                        #Senha                      #Produto                                                       
    62490183524                 12345678                    PANAF160B5W1  

PRODUTO COM SERVIÇO DE SEGURO QUEBRA ACIDENTAL CARTÃO DE CRÉDITO
    [Template]                  Cartão Quebra acidental - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Tags]                      CARTAO5                     COMESTOQUE           CARTAOPIPE
    #CPF                        #Senha                      #Produto                                                       
    86390174500                 12345678                    JBLXTREME2PTO  

PRODUTO COM SERVIÇO DE SUPORTE TÉCNICO CARTÃO DE CRÉDITO
    [Template]                  Cartão Suporte Técnico - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    #CPF                        #Senha                      #Produto                                                       
    98563201786                 12345678                    SGQN55Q60RAB  

PRODUTO COM SERVIÇO DE PROTEÇÃO DIGITAL CARTÃO DE CRÉDITO
    [Template]                  Cartão Proteção digital - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    #CPF                        #Senha                      #Produto                                                       
    86024715994                 12345678                    SGQN55Q60RAB  


DOIS PRODUTOS NO CARRINHO COM SERVIÇO PAGAMENTO CARTÃO DE CRÉDITO
    [Template]                  Dois produtos, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço pagamento cartão de crédito
    #CPF                        #Senha                      #Produto                    #Produto2                                                       
    65239187428                  12345678                    PANAF160B5W1                8S311310222PTO



*** Keywords ***
Busca, verificação e adição no carrinho e conclusão da compra de um item sem serviço no site da FASTSHOP
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    Então a compra via cartao de crédito do produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada

Dois produtos, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço pagamento cartão de crédito
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}            ${busca_produto_dois}                  
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto_dois}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    Quando um segundo produto é preenchido no campo de busca${busca_produto_dois}, verifico se o mesmo é retornado na lista
    E adiciono um serviço de GARANTIA ESTENDIDA
    Então a compra via cartao de crédito do produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada
      
Busca um produto, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento no cartão de crédito
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    Então a compra via cartao de crédito do produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada

Cartão Garantia estendida - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de GARANTIA ESTENDIDA
    Então a compra via cartao de crédito do produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada


Cartão com serviço SEGURO - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de SEGURO
    Então a compra via cartao de crédito do produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada

Cartão Instalação - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de INSTALAÇÃO
    Então a compra via cartao de crédito do produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada

Cartão Quebra acidental - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de QUEBRA ACIDENTAL
    Então a compra via cartao de crédito do produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada

Cartão Suporte Técnico - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de SUPORTE TÉCNICO
    Então a compra via cartao de crédito do produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada

Cartão Proteção digital - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto_dois}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de PROTEÇÃO DIGITAL
    Então a compra via cartao de crédito do produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada
