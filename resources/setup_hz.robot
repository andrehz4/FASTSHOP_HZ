*** Settings ***
Resource    base.robot

*** Keywords ***
###################### FASTSHOP - INSERIR PRODUTO NO CARRINHO
Dado que acesso e verifico que estou no site da FASTSHOP
    Go To                               ${BASE_URL}
    Title Should Be                     Bem-vindo à Fast Shop

Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    Go To                               ${BASE_URL}web/p/d/${busca_produto}/teste
    Wait Until Element Is Visible       ${SPAN_ADICIONAR_AO_CARRINHO}               10
    ${PRODUTO}=                         Get Text                                    ${H1_NOME_DO_PRODUTO}
    Set Global Variable                 ${PRODUTO}
    Log                                 ${PRODUTO}     
    Element Text Should Be              ${H2_NOME_DO_PRODUTO}                       ${busca_produto} 
    Set Focus To Element                ${SPAN_ADICIONAR_AO_CARRINHO}
    Click Element	                    ${SPAN_ADICIONAR_AO_CARRINHO}
    Capture Page Screenshot
    
E e logo no site com o CPF ${cpf} e a senha ${senha}
    Wait Until Element Is Visible       ${ID_LOGIN_CPF}                             10
    Input Text	                        ${ID_LOGIN_CPF}                             ${cpf}
    Input Text	                        ${ID_LOGIN_SENHA}                           ${senha}
    Click Element                       ${BUTTON_CONFIRMAR_VERDE} 
    Capture Page Screenshot
    Sleep                               5
    Go To                               ${CARRINHO_URL}   

Então o produto ${busca_produto} é adicionado e verificado que está no carrinho 
    Wait Until Element Is Visible       ${BUTTON_CONTINUAR_COMPRA_VERDE}            10
    Set Focus To Element                ${BUTTON_CONTINUAR_COMPRA_VERDE}
    Capture Page Screenshot
    Click Element                       ${BUTTON_CONTINUAR_COMPRA_VERDE}
    Wait Until Element Is Visible       ${A_ADICIONAR_NOVO_ENDERECO}                10  
    Set Focus To Element                ${BUTTON_CONTINUAR_VERDE_ENDERECO}
    Capture Page Screenshot
    Click Element                       ${BUTTON_CONTINUAR_VERDE_ENDERECO}
    Wait Until Element Is Visible       ${DIV_QUANDO_RECEBER}                       10
    Wait Until Element Is Visible       ${BUTTON_CONTINUAR_VERDE_DADOS_PESSOAIS}    10
    Wait Until Element Is Visible       //span[contains(text(), '${PRODUTO}')] 
    Log                                 ${PRODUTO}
    Set Focus To Element                ${BUTTON_CONTINUAR_VERDE_DADOS_PESSOAIS}
    Capture Page Screenshot
    Click Element                       ${BUTTON_CONTINUAR_VERDE_DADOS_PESSOAIS}
    Wait Until Element Is Visible       ${H1_ADICIONAR_SERVICO}                     10
    Wait Until Element Is Visible       ${BUTTON_CONTINUAR_VERDE_SERVICOS}          10
    Set Focus To Element                ${BUTTON_CONTINUAR_VERDE_SERVICOS}
    Capture Page Screenshot
    Click Element                       ${BUTTON_CONTINUAR_VERDE_SERVICOS}
    Wait Until Element Is Visible       ${H1_COMO_DESEJA_PAGAR}                     10
    Select Radio Button                 payment_option                              payment-option-3
    Set Focus To Element                ${BUTTON_CONTINUAR_VERDE_PAGAMENTO}
    Capture Page Screenshot
    Click Element                       ${BUTTON_CONTINUAR_VERDE_PAGAMENTO}
    Wait Until Element Is Visible       ${DIV_DESCRICAO_DO_PAGAMENTO}                10
    Set Focus To Element                ${BUTTON_CONTINUAR_VERDE_PAGAMENTO}
    Capture Page Screenshot
    Click Element                       ${BUTTON_CONTINUAR_VERDE_PAGAMENTO}                                

    

