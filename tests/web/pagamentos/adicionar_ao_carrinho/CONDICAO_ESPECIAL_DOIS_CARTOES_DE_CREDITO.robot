*** Settings ***
Documentation      FASTSHOP - REALIZAR PAGAMENTO VIA DOIS CARTÕES DE CRÉDITO COM CONDIÇÃO ESPECIAL
...                Para que eu possa acessar o site da FastShop, sendo um cliente, quero poder adicionar um produto ao carrinho e efetuar o pagamento.
...                1- Entre no portal da FASTSHOP
...                2- Faça uma busca por um produto
...                3- Valide o retorno da busca
...                4- Escolha um produto na lista
...                5- Adicione ao carrinho
...                6- Valide o produto no carrinho
...                7- Insira um serviço
...                8- Realizar o pagamento via dois cartões de crédito com condição especial

Resource         ../../../../resources/base.robot
Suite Setup      Start Session
Suite Teardown   End Session
Test Teardown    End Test


*** Test Cases ***    
CONCLUIR UMA COMPRA COM DOIS CARTÕES DE CRÉDITO COM CONDIÇÃO ESPECIAL
    [Template]                  Pagamento com dois cartões, um produto verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento
    [Tags]                      DOISCARTOESPECIAL1          COMESTOQUE            DOISCARTOESESPECIALPIPE
    #CPF                        #Senha                      #Produto                                                       
    92160754307                 12345678                    UXZS660128PTOB

PRODUTO COM SERVIÇO DE GARANTIA ESTENDIDA CARTÃO DE CRÉDITO COM CONDIÇÃO ESPECIAL
    [Template]                  Garantia estendida - Pagamento com dois cartões, um produto verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento
    [Tags]                      DOISCARTOESPECIAL2          COMESTOQUE            DOISCARTOESESPECIALPIPE    
    #CPF                        #Senha                      #Produto                                                       
    73109625407                 12345678                    UXZS660128PTOB  

PRODUTO COM SERVIÇO DE SEGURO DOIS CARTÕES DE CRÉDITO COM CONDIÇÃO ESPECIAL
    [Template]                  Seguro - Pagamento com dois cartões, um produto verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento
    [Tags]                      DOISCARTOESPECIAL3          COMESTOQUE            DOISCARTOESESPECIALPIPE
    #CPF                        #Senha                      #Produto                                                       
    59782063410                 12345678                    UXZS660128PTOB  

PRODUTO COM SERVIÇO DE INSTALAÇÃO DOIS CARTÕES DE CRÉDITO COM CONDIÇÃO ESPECIAL
    [Template]                  Instalação - Pagamento com dois cartões, um produto verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento
    [Tags]                      DOISCARTOESPECIAL4          
    #CPF                        #Senha                      #Produto                                                       
    10984536701                 12345678                    UXZS660128PTOB  

PRODUTO COM SERVIÇO DE SEGURO QUEBRA ACIDENTAL DOIS CARTÕES DE CRÉDITO COM CONDIÇÃO ESPECIAL
    [Template]                  Quebra acidental - Pagamento com dois cartões, um produto verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento
    [Tags]                      DOISCARTOESPECIAL5          COMESTOQUE            DOISCARTOESESPECIALPIPE
    #CPF                        #Senha                      #Produto                                                       
    20718469585                 12345678                    UXZS660128PTOB  

PRODUTO COM SERVIÇO DE SUPORTE TÉCNICO DOIS CARTÕES DE CRÉDITO COM CONDIÇÃO ESPECIAL
    [Template]                  Suporte técnico - Pagamento com dois cartões, um produto verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento
    #CPF                        #Senha                      #Produto                                                       
    27046358117                 12345678                    SGQN55Q60RAB  

PRODUTO COM SERVIÇO DE PROTEÇÃO DIGITAL DOIS CARTÕES DE CRÉDITO COM CONDIÇÃO ESPECIAL
    [Template]                  Proteção Digital - Pagamento com dois cartões, um produto verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento
    #CPF                        #Senha                      #Produto                                                       
    38472501914                 12345678                    SGQN55Q60RAB  


DOIS PRODUTOS NO CARRINHO COM SERVIÇO PAGAMENTO DOIS CARTÕES DE CRÉDITO COM CONDIÇÃO ESPECIAL
    [Template]                  Busca de dois produtos sem serviços, verificação e adição ao carrinho de um item no site da FASTSHOP
    #CPF                        #Senha                      #Produto                    #Produto2                                                       
    35618209489                 12345678                    PANAF160B5W1                8S311310222PTO



*** Keywords ***
Pagamento com dois cartões, um produto verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    Então na condição especial realizo a compra do produto ${busca_produto} com o pagamento com dois cartões de crédito


Garantia estendida - Pagamento com dois cartões, um produto verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de GARANTIA ESTENDIDA
    Então na condição especial realizo a compra do produto ${busca_produto} com o pagamento com dois cartões de crédito



Seguro - Pagamento com dois cartões, um produto verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de SEGURO
    Então na condição especial realizo a compra do produto ${busca_produto} com o pagamento com dois cartões de crédito



Instalação - Pagamento com dois cartões, um produto verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de INSTALAÇÃO
    Então na condição especial realizo a compra do produto ${busca_produto} com o pagamento com dois cartões de crédito


Quebra acidental - Pagamento com dois cartões, um produto verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de QUEBRA ACIDENTAL
    Então na condição especial realizo a compra do produto ${busca_produto} com o pagamento com dois cartões de crédito


Suporte técnico - Pagamento com dois cartões, um produto verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de SUPORTE TÉCNICO
    Então na condição especial realizo a compra do produto ${busca_produto} com o pagamento com dois cartões de crédito


Proteção Digital - Pagamento com dois cartões, um produto verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de PROTEÇÃO DIGITAL
    Então na condição especial realizo a compra do produto ${busca_produto} com o pagamento com dois cartões de crédito


Busca de dois produtos sem serviços, verificação e adição ao carrinho de um item no site da FASTSHOP
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}            ${busca_produto_dois}                  
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto_dois}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    Quando um segundo produto é preenchido no campo de busca${busca_produto_dois}, verifico se o mesmo é retornado na lista
    Então na condição especial realizo a compra do produto ${busca_produto} com o pagamento com dois cartões de crédito
 


Dois produtos, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço pagamento cartão de crédito
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}            ${busca_produto_dois}                  
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto_dois}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    Quando um segundo produto é preenchido no campo de busca${busca_produto_dois}, verifico se o mesmo é retornado na lista
    E adiciono um serviço de GARANTIA ESTENDIDA
    Então na condição especial realizo a compra do produto ${busca_produto} com o pagamento com dois cartões de crédito

      