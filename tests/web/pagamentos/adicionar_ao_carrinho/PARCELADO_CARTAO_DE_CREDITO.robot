*** Settings ***
Documentation      FASTSHOP - REALIZAR PAGAMENTO PARCELADO VIA CARTÃO DE CRÉDITO
...                Para que eu possa acessar o site da FastShop, sendo um cliente, quero poder adicionar um produto ao carrinho e efetuar o pagamento.
...                1- Entre no portal da FASTSHOP
...                2- Faça uma busca por um produto
...                3- Valide o retorno da busca
...                4- Escolha um produto na lista
...                5- Adicione ao carrinho
...                6- Valide o produto no carrinho
...                7- Insira um serviço
...                8- Realizar o pagamento Parcelado via cartão de crédito

Resource         ../../../../resources/base.robot
Suite Setup      Start Session
Suite Teardown   End Session
Test Teardown    End Test


*** Test Cases ***    
CONCLUIR UMA COMPRA PARCELADA COM CARTÃO DE CRÉDITO
    [Template]                  Busca, verificação e adição no carrinho e conclusão da compra de um item sem serviço no site da FASTSHOP
    [Tags]                      PARCELADOCOMCARTAO1         COMESTOQUE                PARCELADOCARTAOPIPE
    #CPF                        #Senha                      #Produto                                                       
    74862590365                 12345678                    PANAF160B5W1    

PRODUTO COM SERVIÇO DE GARANTIA ESTENDIDA PARCELADA CARTÃO DE CRÉDITO
    [Template]                  Cartão Garantia estendida - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Tags]                      PARCELADOCOMCARTAO2         COMESTOQUE               PARCELADOCARTAOPIPE   
    #CPF                        #Senha                      #Produto                                                       
    95640813784                 12345678                    PANAF160B5W1  

PRODUTO COM SERVIÇO DE SEGURO PARCELADA CARTÃO DE CRÉDITO
    [Template]                  Cartão com serviço SEGURO - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Tags]                      PARCELADOCOMCARTAO3         COMESTOQUE               PARCELADOCARTAOPIPE
    #CPF                        #Senha                      #Produto                                                       
    65893421728                 12345678                    JBLXTREME2PTO  

PRODUTO COM SERVIÇO DE INSTALAÇÃO PARCELADA CARTÃO DE CRÉDITO
    [Template]                  Cartão Instalação - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Tags]                      PARCELADOCOMCARTAO4         COMESTOQUE               PARCELADOCARTAOPIPE
    #CPF                        #Senha                      #Produto                                                       
    54230761961                 12345678                    PANAF160B5W1  

PRODUTO COM SERVIÇO DE SEGURO QUEBRA ACIDENTAL PARCELADA CARTÃO DE CRÉDITO
    [Template]                  Cartão Quebra acidental - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Tags]                      PARCELADOCOMCARTAO5         COMESTOQUE               PARCELADOCARTAOPIPE
    #CPF                        #Senha                      #Produto                                                       
    73429508665                 12345678                    JBLXTREME2PTO  

PRODUTO COM SERVIÇO DE SUPORTE TÉCNICO PARCELADA CARTÃO DE CRÉDITO
    [Template]                  Cartão Suporte Técnico - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    #CPF                        #Senha                      #Produto                                                       
    43718695219                 12345678                    SGQN55Q60RAB  

PRODUTO COM SERVIÇO DE PROTEÇÃO DIGITAL PARCELADA CARTÃO DE CRÉDITO
    [Template]                  Cartão Proteção digital - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    #CPF                        #Senha                      #Produto                                                       
    23476581900                 12345678                    SGQN55Q60RAB  


DOIS PRODUTOS NO CARRINHO COM SERVIÇO PAGAMENTO PARCELADA CARTÃO DE CRÉDITO
    [Template]                  Dois produtos, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço pagamento cartão de crédito
    #CPF                        #Senha                      #Produto                    #Produto2                                                       
    28179503488                  12345678                    PANAF160B5W1                8S311310222PTO



*** Keywords ***
Busca, verificação e adição no carrinho e conclusão da compra de um item sem serviço no site da FASTSHOP
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    Então quero parcelar no cartão de crédito, o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada

Dois produtos, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço pagamento cartão de crédito
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}            ${busca_produto_dois}                  
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto_dois}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    Quando um segundo produto é preenchido no campo de busca${busca_produto_dois}, verifico se o mesmo é retornado na lista
    E adiciono um serviço de GARANTIA ESTENDIDA
    Então quero parcelar no cartão de crédito, o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada
      
Busca um produto, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço e pagamento no cartão de crédito
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    Então quero parcelar no cartão de crédito, o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada

Cartão Garantia estendida - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de GARANTIA ESTENDIDA
    Então quero parcelar no cartão de crédito, o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada


Cartão com serviço SEGURO - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de SEGURO
    Então quero parcelar no cartão de crédito, o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada

Cartão Instalação - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de INSTALAÇÃO
    Então quero parcelar no cartão de crédito, o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada

Cartão Quebra acidental - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de QUEBRA ACIDENTAL
    Então quero parcelar no cartão de crédito, o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada

Cartão Suporte Técnico - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de SUPORTE TÉCNICO
    Então quero parcelar no cartão de crédito, o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada

Cartão Proteção digital - Busca, verificação e adição ao carrinho de um item no site da FASTSHOP com serviço
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço de PROTEÇÃO DIGITAL
    Então quero parcelar no cartão de crédito, o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada
