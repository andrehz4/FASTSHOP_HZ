*** Settings ***
Resource    base.robot

*** Keywords ***
###################### FASTSHOP - INSERIR PRODUTO NO CARRINHO
Dado que acesso e verifico que estou no site da FASTSHOP
    Go To                               ${BASE_URL}
    Title Should Be                     Bem-vindo à Fast Shop

Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    Go To                               ${BASE_URL}web/p/d/${busca_produto}/teste
    Wait Until Element Is Visible       ${SPAN_ADICIONAR_AO_CARRINHO}
    Element Text Should Be              ${H2_NOME_DO_PRODUTO}              ${busca_produto} 
    Set Focus To Element                ${SPAN_ADICIONAR_AO_CARRINHO}
    Click Element	                    ${SPAN_ADICIONAR_AO_CARRINHO}
    Capture Page Screenshot
    
E e logo no site com o CPF ${cpf} e a senha ${senha}
    Wait Until Element Is Visible       ${ID_LOGIN_CPF}  
    Input Text	                        ${ID_LOGIN_CPF}                    ${cpf}
    Input Text	                        ${ID_LOGIN_SENHA}                  ${senha}
    Click Element                       ${BUTTON_CONFIRMAR_VERDE}
    Capture Page Screenshot
    Sleep                               5
    Go To                               ${CARRINHO_URL}   

Então o produto o é adicionado e verificado que está no carrinho 
    Wait Until Element Is Visible       ${SPAN_ADICIONAR_AO_CARRINHO}
    Capture Page Screenshot
    Click Element                       ${SPAN_ADICIONAR_AO_CARRINHO}
    Wait Until Element Is Visible       ${A_BOTAO_VERDE_CONTINUAR}
    Capture Page Screenshot
    Click Element                       ${A_BOTAO_VERDE_CONTINUAR}
    Wait Until Element Is Visible       ${P_NOME_DA_TV}
    Title Should Be                     Sacola de compras - Magazine Luiza
    Element Text Should Be              ${P_NOME_DA_TV}                               ${NOME_DA_TV}                                       
    Capture Page Screenshot


#Wait Until Element Is Enabled  Input Text	                        ${INPUT_BUSCA_PRODUTO}                       ${busca_produto}