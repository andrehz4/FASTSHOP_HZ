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

###################### FASTSHOP - INSERIR PRODUTO NO CARRINHO COM SEGURO
E adiciono um serviço
    Wait Until Element Is Visible       ${BUTTON_SELECIONAR_SERVICO}                 10
    Set Focus To Element                ${BUTTON_SELECIONAR_SERVICO}
    Capture Page Screenshot
    Click Element                       ${BUTTON_SELECIONAR_SERVICO}
    Wait Until Element Is Visible       //div[@class='checkbox']
    Click Element                       //div[@class='checkbox']
    sleep   2
    #Select Radio Button                 period                                        0          
    Click Element                       //button[contains(text(), 'APLICAR')]   
    #//label[@for='${PRODUTO}_THEFT']//..      

#Login com sucesso
Quando logo com o usuário ${usuario_existente} e insiro a sua senha válida ${senha_valida}
    Go To                                   ${BASE_URL}web/login
    Input Text                              ${ID_LOGIN_CPF}                        ${usuario_existente}
    Input Text                              ${ID_LOGIN_SENHA}                      ${senha_valida}
    Click Element                           ${BUTTON_CONFIRMAR_VERDE}
    Capture Page Screenshot

Então o site me direciona para a tela inicial e exibe meu nome no canto superior direito ${nome_cliente_logado}  
    Should Contain                          ${A_NOME_CLIENTE_LOGADO}                ${nome_cliente_logado}  
    Wait Until Element Is Visible           ${A_NOME_CLIENTE_LOGADO}                10
    Capture Page Screenshot

#Login inválido
Quando tento logar com o usuário ${usuario} e insiro a sua senha ${senha} 
    Delete All Cookies
    Go To                                   ${BASE_URL}web/login
    Input Text                              ${ID_LOGIN_CPF}                        ${usuario}
    Input Text                              ${ID_LOGIN_SENHA}                      ${senha}
    Click Element                           ${BUTTON_CONFIRMAR_VERDE}
    Capture Page Screenshot

Entao deve ser apresentada a mensagem que os dados são inválidos ${mensagem_login_invalido} 
    Element Text Should Be                  ${P_MENSSAGEM_ERRO_LOGIN}              ${mensagem_login_invalido}
    Capture Page Screenshot

#Login inválido
Entao será apresentada a mensagem que o cpf é inválido ${mensagem_login_cpf_invalido} 
    Element Text Should Be                  ${DIV_CPF_INVALIDO}                    ${mensagem_login_cpf_invalido}
    Capture Page Screenshot