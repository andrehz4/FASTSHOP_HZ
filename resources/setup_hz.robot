*** Settings ***
Resource    base.robot

*** Keywords ***
###################### FASTSHOP - INSERIR PRODUTO NO CARRINHO
Dado que acesso e verifico que estou no site Magazine Luiza
    Go To               ${BASE_URL}/web/p/d/${busca_produto}
    Title Should Be     Bem-vindo à Fast Shop

Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    Wait Until Element Is Enabled       ${INPUT_BUSCA_PRODUTO}
    Input Text	                        ${INPUT_BUSCA_PRODUTO}                       ${busca_produto}
    Click Element	                    ${SPAN_LUPA_BUSCA_PRODUTO} 
    Wait Until Element Is Visible       ${H2_NOME_DA_TV} 
    Set Focus To Element                ${H2_NOME_DA_TV}
    Capture Page Screenshot
    Click Element                       ${H2_NOME_DA_TV}
    

Então o produto o é adicionado e verificado que está no carrinho 
    Wait Until Element Is Visible       ${SPAN_ADICIONAR_AO_CARRINHO}
    Capture Page Screenshot
    Click Element                       ${SPAN_ADICIONAR_AO_CARRINHO}
    Wait Until Element Is Visible       ${A_BOTAO_VERDE_CONTINUAR}
    Capture Page Screenshot
    Click Element                       ${A_BOTAO_VERDE_CONTINUAR}
    Wait Until Element Is Visible       ${P_NOME_DA_TV}
    Title Should Be                     Sacola de compras - Magazine Luiza
    Element Text Should Be              ${P_NOME_DA_TV}                                 ${NOME_DA_TV}                                       
    Capture Page Screenshot


