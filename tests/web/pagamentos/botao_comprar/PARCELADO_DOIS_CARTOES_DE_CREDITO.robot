*** Settings ***
Documentation      FASTSHOP - REALIZAR PAGAMENTO PARCELADO VIA DOIS CARTÕES DE CRÉDITO
...                Para que eu possa acessar o site da FastShop, sendo um cliente, quero poder adicionar um produto ao carrinho e efetuar o pagamento.
...                1- Entre no portal da FASTSHOP
...                2- Faça uma busca por um produto
...                3- Valide o retorno da busca
...                4- Escolha um produto na lista
...                5- Adicione ao carrinho
...                6- Valide o produto no carrinho
...                7- Insira um serviço
...                8- Realizar o pagamento parcelado via dois cartões de crédito

Resource         ../../../../resources/base.robot
Suite Setup      Start Session
Suite Teardown   End Session
Test Teardown    End Test


*** Test Cases ***    
CONCLUIR UMA COMPRA PARCELADA COM DOIS CARTÕES DE CRÉDITO
    [Template]                  Pagamento Parcelado com dois cartões, um produto verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento
    [Tags]                      PARCELADODOISCARTOES1       COMESTOQUE                PARCELADODOISCARTOESPIPE
    #CPF                        #Senha                      #Produto                                                       
    29601387595                 12345678                    PANAF160B5W1    

PRODUTO COM SERVIÇO DE GARANTIA ESTENDIDA PARCELADO DOIS CARTÕES DE CRÉDITO
    [Template]                  Garantia estendida - Pagamento Parcelado com dois cartões, um produto verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento
    [Tags]                      PARCELADODOISCARTOES2       COMESTOQUE                PARCELADODOISCARTOESPIPE
    #CPF                        #Senha                      #Produto                                                       
    37258904638                 12345678                    PANAF160B5W1  

PRODUTO COM SERVIÇO DE SEGURO PARCELADO DOIS CARTÕES DE CRÉDITO
    [Template]                  Seguro - Pagamento Parcelado com dois cartões, um produto verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento
    [Tags]                      PARCELADODOISCARTOES3       COMESTOQUE                PARCELADODOISCARTOESPIPE
    #CPF                        #Senha                      #Produto                                                       
    58739601277                 12345678                    JBLXTREME2PTO  

PRODUTO COM SERVIÇO DE INSTALAÇÃO PARCELADO DOIS CARTÕES DE CRÉDITO
    [Template]                  Instalação - Pagamento Parcelado com dois cartões, um produto verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento
    [Tags]                      PARCELADODOISCARTOES4       COMESTOQUE                PARCELADODOISCARTOESPIPE    
    #CPF                        #Senha                      #Produto                                                       
    91308457260                 12345678                    PANAF160B5W1  

PRODUTO COM SERVIÇO DE SEGURO QUEBRA ACIDENTAL PARCELADO DOIS CARTÕES DE CRÉDITO
    [Template]                  Quebra acidental - Pagamento Parcelado com dois cartões, um produto verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento
    [Tags]                      PARCELADODOISCARTOES5       COMESTOQUE                PARCELADODOISCARTOESPIPE
    #CPF                        #Senha                      #Produto                                                       
    96810425306                 12345678                    JBLXTREME2PTO  

PRODUTO COM SERVIÇO DE SUPORTE TÉCNICO PARCELADO DOIS CARTÕES DE CRÉDITO
    [Template]                  Suporte técnico - Pagamento Parcelado com dois cartões, um produto verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento
    #CPF                        #Senha                      #Produto                                                       
    79150684310                 12345678                    SGQN55Q60RAB  

PRODUTO COM SERVIÇO DE PROTEÇÃO DIGITAL PARCELADO DOIS CARTÕES DE CRÉDITO
    [Template]                  Proteção Digital - Pagamento Parcelado com dois cartões, um produto verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento
    #CPF                        #Senha                      #Produto                                                       
    62785013417                 12345678                    SGQN55Q60RAB  


DOIS PRODUTOS NO CARRINHO COM SERVIÇO PAGAMENTO PARCELADO DOIS CARTÕES DE CRÉDITO
    [Template]                  Busca de dois produtos sem serviços, verificação e adição ao carrinho de um item no site da FASTSHOP
    #CPF                        #Senha                      #Produto                    #Produto2                                                       
    76091483269                 12345678                    PANAF160B5W1                8S311310222PTO



*** Keywords ***
Pagamento Parcelado com dois cartões, um produto verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    Então parcelo a compra do produto ${busca_produto} com o pagamento com dois cartões de crédito

Garantia estendida - Pagamento Parcelado com dois cartões, um produto verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de GARANTIA ESTENDIDA
    Então parcelo a compra do produto ${busca_produto} com o pagamento com dois cartões de crédito


Seguro - Pagamento Parcelado com dois cartões, um produto verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de SEGURO
    Então parcelo a compra do produto ${busca_produto} com o pagamento com dois cartões de crédito


Instalação - Pagamento Parcelado com dois cartões, um produto verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de INSTALAÇÃO
    Então parcelo a compra do produto ${busca_produto} com o pagamento com dois cartões de crédito

Quebra acidental - Pagamento Parcelado com dois cartões, um produto verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de QUEBRA ACIDENTAL
    Então parcelo a compra do produto ${busca_produto} com o pagamento com dois cartões de crédito

Suporte técnico - Pagamento Parcelado com dois cartões, um produto verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de SUPORTE TÉCNICO
    Então parcelo a compra do produto ${busca_produto} com o pagamento com dois cartões de crédito

Proteção Digital - Pagamento Parcelado com dois cartões, um produto verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de PROTEÇÃO DIGITAL
    Então parcelo a compra do produto ${busca_produto} com o pagamento com dois cartões de crédito

Busca de dois produtos sem serviços, verificação e adição ao carrinho de um item no site da FASTSHOP
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}            ${busca_produto_dois}                  
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto_dois}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    Quando um segundo produto é preenchido no campo de busca${busca_produto_dois}, verifico se o mesmo é retornado na lista
    Então parcelo a compra do produto ${busca_produto} com o pagamento com dois cartões de crédito


Dois produtos, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço pagamento cartão de crédito
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}            ${busca_produto_dois}                  
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto_dois}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    Quando um segundo produto é preenchido no campo de busca${busca_produto_dois}, verifico se o mesmo é retornado na lista
    E adiciono um serviço de GARANTIA ESTENDIDA
    Então parcelo a compra do produto ${busca_produto} com o pagamento com dois cartões de crédito
      