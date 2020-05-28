*** Settings ***
Documentation      FASTSHOP - FUNDO DE TELA
...                O fundo na tela de escolha de endereço está aparecendo cortado, não está ocupando 100% da tela.


Resource         ../resources/base.robot
Suite Setup      Start Session
Suite Teardown   End Session
Test Teardown    End Test


*** Test Cases ***        
FUNDO DE TELA NA PÁGINA DE ENDEREÇO ESTÁ OCUPANDO 100% DA TELA
    [Template]                  Busca, verificação e adição no carrinho e conclusão da compra de um item sem serviço no site da FASTSHOP

    #CPF                        #Senha                      #Produto                                                                           
    941.861.830-31              12345678                    8S311310222PTO                





*** Keywords ***
Busca, verificação e adição no carrinho e conclusão da compra de um item sem serviço no site da FASTSHOP
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   
    
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    Então o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada 

