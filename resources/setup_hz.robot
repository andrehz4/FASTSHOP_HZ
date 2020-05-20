*** Settings ***
Resource    base.robot

*** Keywords ***
###################### FASTSHOP - INSERIR PRODUTO NO CARRINHO
Dado que acesso e verifico que estou no site da FASTSHOP
    Go To                               ${BASE_URL}
    #Title Should Be                     Bem-vindo à Fast Shop

Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    Go To                               ${BASE_URL}web/p/d/${busca_produto}/teste
    Wait Until Element Is Visible       ${SPAN_ADICIONAR_AO_CARRINHO}
    ${PRODUTO}=                         Get Text                            ${H1_NOME_DO_PRODUTO}
    Log                                 ${PRODUTO}     
    Element Text Should Be              ${H2_NOME_DO_PRODUTO}               ${busca_produto} 
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

Então o produto ${busca_produto} é adicionado e verificado que está no carrinho 
    Wait Until Element Is Visible       ${BUTTON_CONTINUAR_COMPRA_VERDE}
    Set Focus To Element                ${BUTTON_CONTINUAR_COMPRA_VERDE}
    Click Element                       ${BUTTON_CONTINUAR_COMPRA_VERDE}
    Capture Page Screenshot
    Wait Until Element Is Visible       ${BUTTON_CONTINUAR_VERDE_ENDERECO}
    Set Focus To Element                ${BUTTON_CONTINUAR_VERDE_ENDERECO}
    Click Element                       ${BUTTON_CONTINUAR_VERDE_ENDERECO}
    Capture Page Screenshot
    Sleep                               2
    Wait Until Element Is Visible       ${BUTTON_CONTINUAR_VERDE_DADOS_PESSOAIS}
    Log                                 ${PRODUTO}
    Set Focus To Element                ${BUTTON_CONTINUAR_VERDE_DADOS_PESSOAIS}
    Click Element                       ${BUTTON_CONTINUAR_VERDE_DADOS_PESSOAIS}
    Capture Page Screenshot
    Sleep                               2
    Wait Until Element Is Visible       ${BUTTON_CONTINUAR_VERDE}
    Set Focus To Element                ${BUTTON_CONTINUAR_VERDE}
    Click Element                       ${BUTTON_CONTINUAR_VERDE}
    Capture Page Screenshot
    Sleep                               2
    

#Wait Until Element Is Enabled  Input Text	                        ${INPUT_BUSCA_PRODUTO}                       ${busca_produto}