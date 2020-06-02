*** Settings ***
Resource    base.robot
Resource    Helpers.robot

*** Keywords ***
###################### FASTSHOP - INSERIR PRODUTO NO CARRINHO
Então o produto ${busca_produto} é adicionado e verificado que está no carrinho 
    Wait Until Element Is Visible       ${BUTTON_CONTINUAR_COMPRA_VERDE}            10 
    ${PRODUTO}=                         Get Text                                    ${DIV_NOME_DO_PRODUTO}
    Set Global Variable                 ${PRODUTO}
    Log                                 ${PRODUTO}   
    Capture Page Screenshot

###################### FASTSHOP - EXCLUIR UM PRODUTO DO CARRINHO
Então o produto ${busca_produto} é adicionado e verificado e excluido do carrinho, ficando vazio
    Wait Until Element Is Visible       ${BUTTON_CONTINUAR_COMPRA_VERDE}            10
    Set Focus To Element                ${DIV_EXCLUIR_PRODUTO}
    Capture Page Screenshot
    Click Element                       ${DIV_EXCLUIR_PRODUTO}
    Wait Until Element Is Visible       ${P_CARRINHO_VAZIO}                         10  
    Capture Page Screenshot

###################### FASTSHOP - CONCLUIR A COMPRA SEM SERVIÇO
Dado que acesso e verifico que estou no site da FASTSHOP
    Delete All Cookies
    Go To                               ${BASE_URL}

Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    Go To                               ${BASE_URL}web/p/d/${busca_produto}/teste
    Wait Until Element Is Visible       ${SPAN_ADICIONAR_AO_CARRINHO}               20
    ${PRODUTO}=                         Get Text                                    ${H1_NOME_DO_PRODUTO}
    Set Global Variable                 ${PRODUTO}
    Log                                 ${PRODUTO}     
    Element Text Should Be              ${H2_NOME_DO_PRODUTO}                       ${busca_produto} 
    Set Focus To Element                ${SPAN_ADICIONAR_AO_CARRINHO}
    Click Element	                    ${SPAN_ADICIONAR_AO_CARRINHO}
    Capture Page Screenshot

Quando um segundo produto é preenchido no campo de busca${busca_produto_dois}, verifico se o mesmo é retornado na lista
    #Segundo produto
    Go To                               ${BASE_URL}web/p/d/${busca_produto_dois}/teste
    Wait Until Element Is Visible       ${SPAN_ADICIONAR_AO_CARRINHO}               20
    ${PRODUTO}=                         Get Text                                    ${H1_NOME_DO_PRODUTO}
    Set Global Variable                 ${PRODUTO}
    Log                                 ${PRODUTO}     
    Element Text Should Be              ${H2_NOME_DO_PRODUTO}                       ${busca_produto_dois} 
    Set Focus To Element                ${SPAN_ADICIONAR_AO_CARRINHO}
    Click Element	                    ${SPAN_ADICIONAR_AO_CARRINHO}
    Capture Page Screenshot

Quando um terceiro produto é preenchido no campo de busca${busca_produto_tres}, verifico se o mesmo é retornado na lista
    #terceiro produto
    Go To                               ${BASE_URL}web/p/d/${busca_produto_tres}/teste
    Wait Until Element Is Visible       ${SPAN_ADICIONAR_AO_CARRINHO}               20
    ${PRODUTO}=                         Get Text                                    ${H1_NOME_DO_PRODUTO}
    Set Global Variable                 ${PRODUTO}
    Log                                 ${PRODUTO}     
    Element Text Should Be              ${H2_NOME_DO_PRODUTO}                       ${busca_produto_tres} 
    Set Focus To Element                ${SPAN_ADICIONAR_AO_CARRINHO}
    Click Element	                    ${SPAN_ADICIONAR_AO_CARRINHO}
    Capture Page Screenshot

Quando um quarto produto é preenchido no campo de busca${busca_produto_quatro}, verifico se o mesmo é retornado na lista
    #quarto produto
    Go To                               ${BASE_URL}web/p/d/${busca_produto_quatro}/teste
    Wait Until Element Is Visible       ${SPAN_ADICIONAR_AO_CARRINHO}               20
    ${PRODUTO}=                         Get Text                                    ${H1_NOME_DO_PRODUTO}
    Set Global Variable                 ${PRODUTO}
    Log                                 ${PRODUTO}     
    Element Text Should Be              ${H2_NOME_DO_PRODUTO}                       ${busca_produto_quatro} 
    Set Focus To Element                ${SPAN_ADICIONAR_AO_CARRINHO}
    Click Element	                    ${SPAN_ADICIONAR_AO_CARRINHO}
    Capture Page Screenshot

Quando um quinto produto é preenchido no campo de busca${busca_produto_cinco}, verifico se o mesmo é retornado na lista
    #quinto produto
    Go To                               ${BASE_URL}web/p/d/${busca_produto_cinco}/teste
    Wait Until Element Is Visible       ${SPAN_ADICIONAR_AO_CARRINHO}               20
    ${PRODUTO}=                         Get Text                                    ${H1_NOME_DO_PRODUTO}
    Set Global Variable                 ${PRODUTO}
    Log                                 ${PRODUTO}     
    Element Text Should Be              ${H2_NOME_DO_PRODUTO}                       ${busca_produto_cinco} 
    Set Focus To Element                ${SPAN_ADICIONAR_AO_CARRINHO}
    Click Element	                    ${SPAN_ADICIONAR_AO_CARRINHO}
    Capture Page Screenshot

  

E e logo no site com o CPF ${cpf} e a senha ${senha}
    Wait Until Element Is Visible       ${ID_LOGIN_CPF}                             10
    Input Text	                        ${ID_LOGIN_CPF}                             ${cpf}
    Input Text	                        ${ID_LOGIN_SENHA}                           ${senha}
    Click Element                       ${BUTTON_CONFIRMAR_VERDE} 
    Capture Page Screenshot
    Go To                               ${CARRINHO_URL}   

Então o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada
    Wait Until Element Is Visible       ${BUTTON_CONTINUAR_COMPRA_VERDE}            20
    Set Focus To Element                ${BUTTON_CONTINUAR_COMPRA_VERDE}
      Sleep                               3
    Capture Page Screenshot
    Click Element                       ${BUTTON_CONTINUAR_COMPRA_VERDE}
    #endereço
    Wait Until Element Is Visible       ${A_ADICIONAR_NOVO_ENDERECO}                20  
    Set Focus To Element                ${BUTTON_CONTINUAR_VERDE_ENDERECO}
    Capture Page Screenshot
    Click Element                       ${BUTTON_CONTINUAR_VERDE_ENDERECO}
    
    Wait Until Element Is Visible       ${DIV_QUANDO_RECEBER}                       20
    Wait Until Element Is Visible       ${BUTTON_CONTINUAR_VERDE_DADOS_PESSOAIS}    20
    Wait Until Element Is Visible       //span[contains(text(), '${PRODUTO}')] 
    Log                                 ${PRODUTO}
    Set Focus To Element                ${BUTTON_CONTINUAR_VERDE_DADOS_PESSOAIS}
    Capture Page Screenshot
    Click Element                       ${BUTTON_CONTINUAR_VERDE_DADOS_PESSOAIS}
                Sleep                               6
    Wait Until Element Is Visible       ${H1_ADICIONAR_SERVICO}                     20
    Wait Until Element Is Visible       ${BUTTON_CONTINUAR_VERDE_SERVICOS}          20
    Set Focus To Element                ${BUTTON_CONTINUAR_VERDE_SERVICOS}
    Capture Page Screenshot
    Click Element                       ${BUTTON_CONTINUAR_VERDE_SERVICOS}
    Wait Until Element Is Visible       ${H1_COMO_DESEJA_PAGAR}                     20
    Wait Until Element Is Visible       ${DIV_ADD_CARTAO_DE_CREDITO}                20
    Select Radio Button                 payment_option                              payment-option-4
    Set Focus To Element                ${BUTTON_CONTINUAR_VERDE_PAGAMENTO}
    Capture Page Screenshot
    Click Element                       ${BUTTON_CONTINUAR_VERDE_PAGAMENTO}
    Wait Until Element Is Visible       ${DIV_DESCRICAO_DO_PAGAMENTO}                20
    Set Focus To Element                ${BUTTON_CONTINUAR_VERDE_FINALIZAR_COMPRA}
    Capture Page Screenshot
    Click Element                       ${BUTTON_CONTINUAR_VERDE_FINALIZAR_COMPRA} 
    Wait Until Element Is Enabled	    ${DIV_COMPRA_CONCLUIDA}                      30       
    Sleep                               4
    Capture Page Screenshot    
                              
###################### FASTSHOP - INSERIR PRODUTO NO CARRINHO COM SEGURO
E adiciono um serviço
    Wait Until Element Is Visible       ${BUTTON_SELECIONAR_SERVICO}                 10
    Set Focus To Element                ${BUTTON_SELECIONAR_SERVICO}
    Sleep                               2
    Capture Page Screenshot
    Click Element                       ${BUTTON_SELECIONAR_SERVICO}
    Wait Until Element Is Visible       //div[@class='checkbox']
    Click Element                       //div[@class='checkbox']
    Click Element                       ${LABEL_PERIODO_DO_SEGURO}                                             
    Click Element                       //button[contains(text(), 'APLICAR')]   
    Sleep                               4
    Click Element                       //button[contains(text(), 'APLICAR')]   
    Sleep                               7

E adiciono um serviço de garantia estendida com data para instalação
    Wait Until Element Is Visible       ${BUTTON_SELECIONAR_SERVICO}                 10
    Set Focus To Element                ${BUTTON_SELECIONAR_SERVICO}
    Capture Page Screenshot
    Click Element                       ${BUTTON_SELECIONAR_SERVICO}
    Wait Until Element Is Visible       //div[@class='checkbox']
    Click Element                       //div[@class='checkbox']
    Click Element                       ${LABEL_PERIODO_DO_SEGURO}                                             
    Click Element                       //button[contains(text(), 'APLICAR')]   
    Sleep                               2
    #Click Element                       //button[contains(text(), 'APLICAR')]   
    #Sleep                               2
    Wait Until Element Is Visible       (//div[@class='checkbox'])[last()] 
    Sleep                               2
    Click Element                       (//div[@class='checkbox'])[last()] 
    Sleep                               2
    Wait Until Element Is Visible       //div[@class='calendar']
    Click Element                       //label
    Click Element                       //button[contains(text(), 'APLICAR')]  
    Sleep                               2
    Click Element                       //button[contains(text(), 'APLICAR')]   
    Sleep                               2
    Click Element                       //button[contains(text(), 'APLICAR')] 
    Sleep                               2

###################### FASTSHOP - ENDEREÇO
E entro na página de acionar um novo endereço a mesma é carregada 
    Wait Until Element Is Visible       ${BUTTON_CONTINUAR_COMPRA_VERDE}            10
    Set Focus To Element                ${BUTTON_CONTINUAR_COMPRA_VERDE}
    Capture Page Screenshot
    Click Element                       ${BUTTON_CONTINUAR_COMPRA_VERDE}
    #ENDEREÇO
    Wait Until Element Is Visible       ${A_ADICIONAR_NOVO_ENDERECO}                10  
    Set Focus To Element                ${A_ADICIONAR_NOVO_ENDERECO}
    Capture Page Screenshot
    Click Element                       ${A_ADICIONAR_NOVO_ENDERECO}
    Wait Until Element Is Visible       ${ID_ENDEREÇO_CEP}
    ${NOMEFAKE}                         FakerLibrary.Name
    ${ENDERECOFAKE}                     FakerLibrary.Address
    ${TELEFONEFAKE}                     FakerLibrary.Phone Number
    Input Text                          ${INPUT_ENDEREÇO_NOME_DESTINATARIO}         ${NOMEFAKE}                       
    Input Text                          ${ID_ENDEREÇO_CEP}                          00000000             
    Input Text                          ${ID_ENDEREÇO_NOME_DA_RUA}                  ${ENDERECOFAKE}     
    Input Text                          ${ID_ENDEREÇO_NUMERO}                       84     
    Input Text                          ${ID_ENDEREÇO_COMPLEMENTO}                  Teste
    Input Text                          ${ID_ENDEREÇO_BAIRRO}                       Centro
    Input Text                          ${ID_ENDEREÇO_CIDADE}                       Guarulhos                   
    Input Text                          ${ID_ENDEREÇO_TELEFONE}                     11${TELEFONEFAKE}   
    Select From List By Value           ${ID_ENDEREÇO_TIPO_CASA}                    1
    Select From List By Value           ${ID_ENDEREÇO_ESTADO}                       SP
    Sleep                               4

###################### FASTSHOP - INSERIR PRODUTO NO CARRINHO COM SEGURO PAGANDO VIA CARTÃO DE CRÉDITO
Então o produto ${busca_produto} é adicionado, verificado que está no carrinho e a compra é encerrada com pagamento via cartão de crédito
    Wait Until Element Is Visible       ${BUTTON_CONTINUAR_COMPRA_VERDE}            10
    Set Focus To Element                ${BUTTON_CONTINUAR_COMPRA_VERDE}
    Capture Page Screenshot
    Click Element                       ${BUTTON_CONTINUAR_COMPRA_VERDE}
    #ENDEREÇO
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
    Wait Until Element Is Visible       ${DIV_ADD_CARTAO_DE_CREDITO}                10
    Select Radio Button                 payment_option                              payment-option-2
    Set Focus To Element                ${BUTTON_CONTINUAR_VERDE_PAGAMENTO}
    Capture Page Screenshot
    Click Element                       ${BUTTON_CONTINUAR_VERDE_PAGAMENTO}
    Wait Until Element Is Enabled	    ${DIV_NOME_DO_TITULAR_DO_CARTAO}            15  
    ${CARTAODECREDITOFAKE}                                FakerLibrary.Credit Card Number 
    Input Text                                            ${INPUT_NUMERO_CARTAO_DE_CREDITO}                    4406 8008 8541 1673
    ${NOMEFAKE}                                           FakerLibrary.Name                         
    Input Text                                            ${INPUT_NOME_TITULAR_DO_CARTAO}                      WILLIAM MOORE       #${NOMEFAKE}
    Input Text                                            ${INPUT_VALIDADE_DO_CARTAO}                          01/24                                                                
    ${CPF}                                                FakerLibrary.cpf  
    Input Text                                            ${INPUT_CPF_TITULAR_CARTAO}                          ${CPF}             
    Log                                                   ${CARTAODECREDITOFAKE}/${NOMEFAKE}/01/2024/${CPF}                     
    Capture Page Screenshot
    Click Element                       ${BUTTON_CONTINUAR_VERDE_ADD_CARTAO}
    Wait Until Element Is Visible       ${DIV_PAGAMENTO_CARTAO_JUROS}                10
    Click Element                       ${LABEL_PAGAMENTO_PARCELADO} 
    Wait Until Element Is Visible       ${LABEL_PAGAMENTO_PARCELADO}     
    Click Element                       ${DIV_PAGAMENTO_LISTA_1x}                            
    Input Text                          ${DIV_PAGAMENTO_CVV}                         555
    Set Focus To Element                ${BUTTON_CONTINUAR_VERDE_FINALIZAR_COMPRA}
    Capture Page Screenshot
    Click Element                       ${BUTTON_CONTINUAR_VERDE_FINALIZAR_COMPRA} 
    Wait Until Element Is Enabled	    ${DIV_COMPRA_CONCLUIDA}                      60       
    Sleep                               6
    Capture Page Screenshot    


###################### FASTSHOP - INSERIR PRODUTO NO CARRINHO COM SEGURO PAGANDO VIA CARTÃO DE CRÉDITO
Então o produto ${busca_produto} ${busca_produto_dois} são adicionados, verificados que estão no carrinho e a compra é encerrada com pagamento via cartão de crédito
    Wait Until Element Is Visible       ${BUTTON_CONTINUAR_COMPRA_VERDE}            10
    Set Focus To Element                ${BUTTON_CONTINUAR_COMPRA_VERDE}
    Capture Page Screenshot
    Click Element                       ${BUTTON_CONTINUAR_COMPRA_VERDE}
    Sleep                               3
    Wait Until Element Is Visible       ${A_ADICIONAR_NOVO_ENDERECO}                10  
    Set Focus To Element                ${BUTTON_CONTINUAR_VERDE_ENDERECO}
    Capture Page Screenshot
    Click Element                       ${BUTTON_CONTINUAR_VERDE_ENDERECO}
    Sleep                               3
    Wait Until Element Is Visible       ${DIV_QUANDO_RECEBER}                       10
    Wait Until Element Is Visible       ${BUTTON_CONTINUAR_VERDE_DADOS_PESSOAIS}    10
    Wait Until Element Is Visible       //span[contains(text(), '${PRODUTO}')] 
    Log                                 ${PRODUTO}
    Set Focus To Element                ${BUTTON_CONTINUAR_VERDE_DADOS_PESSOAIS}
    Capture Page Screenshot
    Click Element                       ${BUTTON_CONTINUAR_VERDE_DADOS_PESSOAIS}
    Sleep                               3
    Wait Until Element Is Visible       ${H1_ADICIONAR_SERVICO}                     10
    Wait Until Element Is Visible       ${BUTTON_CONTINUAR_VERDE_SERVICOS}          10
    Set Focus To Element                ${BUTTON_CONTINUAR_VERDE_SERVICOS}
    Capture Page Screenshot
    Click Element                       ${BUTTON_CONTINUAR_VERDE_SERVICOS}
    Sleep                               3
    Wait Until Element Is Visible       ${H1_COMO_DESEJA_PAGAR}                     10
    Wait Until Element Is Visible       ${DIV_ADD_CARTAO_DE_CREDITO}                10
    Select Radio Button                 payment_option                              payment-option-2
    Set Focus To Element                ${BUTTON_CONTINUAR_VERDE_PAGAMENTO}
    Capture Page Screenshot
    Click Element                       ${BUTTON_CONTINUAR_VERDE_PAGAMENTO}
    Sleep                               3


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

#LOGOUT
E ao clicar em sair o nome ${nome_cliente_logado} não está presente no canto superior direito da tela. 
    Click Element                           ${A_NOME_CLIENTE_LOGADO}          
    Sleep                                   2      
    Click Element                           ${A_LOGOUT}               
    Capture Page Screenshot
    Sleep                                   4

#CADASTRO
Dado que acesso e verifico que estou na página inicial da FastShop
    Set Selenium Implicit Wait              5
    Maximize Browser Window


Quando acesso e verifico que estou na página de cadastro, insiro um cpf não existente
    Go To                                   ${URL_CADASTRO_API}
    Wait Until Element Is Visible           ${check_informe_Cpf_nao_cadastro}                    60 
    ${CPF}                                  FakerLibrary.cpf                           
    Input Text                              ${check_informe_Cpf_nao_cadastro}                    ${CPF} 
    Click Element                           ${check_botao_verde_continuar}

Quando verifico que estou na página de cadastro, insiro um cpf já existente "${Cpf_cadastrado}"
    Go To                                   ${url}/checkout/login
    Input Text                              ${check_informe_Cpf}                    ${Cpf_cadastrado}
    Click Element                           ${check_botao_verde_continuar}

E o campo de senha é exibido e a senha é inserida   
    ${label}=                               Get WebElement                          ${check_label_senha_na_fastshop}
    Should Contain                          ${label.text}                           Senha na Fast Shop
    Input Text	                            ${check_informe_senha}                  S@fra2019
    Click Element                           ${check_botao_verde_continuar}  

Então logo no site, exibindo um alerta que o meu carrinho está vazio 
    Click Element                           ${check_botao_verde_continuar_comprando}

E ao clicar no mesmo o site retorna a sua página inicial com o usuario André verificado
    Should Contain                          ${check_nome_andre}                     ANDRE
    Wait Until Element Is Visible           ${check_nome_andre}                     10


Quando verifico que estou na página de cadastro, insiro um cpf não existente
    Go To                                   ${url}/checkout/login
    Title Should Be                         Login | Fast Shop
    ${CPF}                                  FakerLibrary.cpf                           
    Input Text                              ${check_informe_Cpf}                    ${CPF} 
    Click Element                           ${check_botao_verde_continuar}

Então é exibido uma mensagem com a classe na cor vermelha. 
    ${mensagem}=                            Get Element Attribute                   ${check_mensagem_vermelha}          class
    ${mensagem3}=                           Get Text	                            ${check_mensagem_vermelha} 

E ao confirmar no botão cadastrar de cor verde sou direcionado a outra página para concluir o cadastrado
    ${mensagem}=                            Get Element Attribute                   ${check_mensagem_vermelha}           class
    ${mensagem3}=                           Get Text	                            ${check_mensagem_vermelha}       
    Click Element                           ${check_botao_verde_continuar}  


E efetuo o clique no botão continuar sem preencher os campos obrigatórios
    Wait Until Element Is Enabled           ${check_campo_cpf}                      10
    Set Focus To Element                    ${check_botao_verde_continuar}
    Element Text Should Be  	            ${check_botao_verde_continuar}          Continuar
    Set Selenium Speed                      0.5
    Click Element                           ${check_botao_verde_continuar}  

Então é exibida uma mensagens de crítica e um ícone de validação na cor vermelha.
    Wait Until Element Contains             ${check_mensagem_span_critica_vermelha}  Campo obrigatório              


E todos os campos da tela de cadastro são preenchidos
    ${NOMEFAKE}                             FakerLibrary.Name
    Input Text                              ${check_cadastro_nome}                   ${NOMEFAKE}  
    Input Text                              ${check_cadastro_idade}                  03061986   
    Select From List By Value               ${check_cadastro_sexo}                   Male   
    ${TELEFONEFAKE}                         FakerLibrary.Phone Number
    Input Text                              ${check_cadastro_telefone}               11${TELEFONEFAKE}     
    ${PALAVRAFAKE}                          FakerLibrary.Word            
    Input Text                              ${check_cadastro_email}                  ${PALAVRAFAKE}@fastshopteste.com
    ${PASSWORDFAKE}                         FakerLibrary.Password 
    Input Text                              ${check_cadastro_senha}                  ${PASSWORDFAKE}   
    Input Text                              ${check_cadastro_confirmacao_senha}      ${PASSWORDFAKE}   
    
E é autorizado apenas o recebimento de ofertas via SMS
    Set Focus To Element                    ${check_cadastro_recebe_sms}
    Set Selenium Speed                      0.1            
    Select Checkbox                         ${check_cadastro_recebe_sms}
    Set Selenium Speed                      0
    Checkbox Should Be Selected             ${check_cadastro_recebe_sms}   
    Checkbox Should Not Be Selected         ${check_cadastro_recebe_email}

E é autorizado apenas o recebimento de ofertas via e-mail
    Set Focus To Element                    ${check_cadastro_recebe_email} 
    Set Selenium Speed                      0.1
    Select Checkbox                         ${check_cadastro_recebe_email}  
    Set Selenium Speed                      0            
    Checkbox Should Be Selected             ${check_cadastro_recebe_email}
    Checkbox Should Not Be Selected         ${check_cadastro_recebe_sms} 

E não é autorizado o recebimento de ofertas via e-mail e sms
    Set Focus To Element                    ${check_cadastro_recebe_email} 
    Set Selenium Speed                      0.1          
    Checkbox Should Not Be Selected         ${check_cadastro_recebe_email}
    Checkbox Should Not Be Selected         ${check_cadastro_recebe_sms} 


E é autorizado o recebimento de ofertas via e-mail e sms
    Set Focus To Element                    ${check_cadastro_recebe_email} 
    Set Selenium Speed                      0.1
    Select Checkbox                         ${check_cadastro_recebe_email}  
    Select Checkbox                         ${check_cadastro_recebe_sms}
    Set Selenium Speed                      0            
    Checkbox Should Be Selected             ${check_cadastro_recebe_email}
    Checkbox Should Be Selected             ${check_cadastro_recebe_sms} 


Então ao clicar em continuar a primeira etapa do cadastrado é encerrada com sucesso
    Set Focus To Element                    ${check_botao_verde_continuar}
    Element Text Should Be  	            ${check_botao_verde_continuar}          Continuar
    Set Selenium Speed                      0.5
    Click Element                           ${check_botao_verde_continuar}  
    Set Selenium Speed                      0

E insiro um CEP inexistente e o meso retorna a cor vermelha
    Set Selenium Speed                      0.5
    Input Text                              ${check_cadastro_cep}                    00000000
    Input Text                              ${check_cadastro_complemento}            teste
    Sleep                                   5

Dado que a primeira etapa de cadastro foi realizada com sucesso 
    Dado que acesso e verifico que estou na página inicial da FastShop
    Quando verifico que estou na página de cadastro, insiro um cpf não existente
    E ao confirmar no botão cadastrar de cor verde sou direcionado a outra página para concluir o cadastrado
    E todos os campos da tela de cadastro são preenchidos
    E é autorizado o recebimento de ofertas via e-mail e sms
    Então ao clicar em continuar a primeira etapa do cadastrado é encerrada com sucesso


E é preenchido o campo de endereço, todas as informações são recebidas 
    Set Selenium Speed                      0.5
    Input Text                              ${check_cadastro_cep}                    07110040
    Select From List By Value               ${check_cadastro_select_imovel}          1
    Input Text                              ${check_cadastro_numero_casa}            84
    Select From List By Value               ${check_cadastro_select_imovel}          1
    Input Text                              ${check_cadastro_complemento}            teste
    Set Focus To Element                    ${check_botao_verde_cadastrar}
    Element Text Should Be  	            ${check_botao_verde_cadastrar}          Cadastrar
    Set Selenium Speed                      0.5
    Click Element                           ${check_botao_verde_cadastrar}  
    Set Selenium Speed                      0
        Sleep                               10
    Capture Page Screenshot
    
Então os campos são verificados se não são editáveis
    Set Selenium Speed                      0.5
    Element Should Be Disabled              ${check_cadastro_rua}                
    Element Should Be Enabled               ${check_cadastro_numero_casa}        
    Element Should Be Disabled              ${check_cadastro_bairro}             
    Element Should Be Disabled              ${check_cadastro_cidade}             
    Element Should Be Enabled               ${check_cadastro_select_imovel}     


E os campos preenchidos de forma correta devem possuir um ícone verde
    Wait Until Element Is Visible           ${check_icone_validador_verde_cep}       10
    Wait Until Element Is Visible           ${check_icone_validador_verde_rua}       10
    Wait Until Element Is Visible           ${check_icone_validador_verde_casa}      10
    Wait Until Element Is Visible           ${check_icone_validador_verde_bairro}    10 
    Wait Until Element Is Visible           ${check_icone_validador_verde_cidade}    10
    Wait Until Element Is Visible           ${check_icone_validador_verde_estado}    10 
    Wait Until Element Is Visible           ${check_icone_validador_verde_imovel}    10

#Dados para criação de massa
Exemplos relacionados a pessoa
  ${NOMEFAKE}                 FakerLibrary.Name
  ${ENDERECOFAKE}             FakerLibrary.Address
  ${TELEFONEFAKE}             FakerLibrary.Phone Number
  ${CPF}                      FakerLibrary.cpf
  ${CIDADEFAKE}               FakerLibrary.City
  ${TRABALHOFAKE}             FakerLibrary.Job
  @{PESSOA}                   Create List    Nome Aleatório: ${NOMEFAKE}  Endereço Aleatório: ${ENDERECOFAKE}
  ...                         Telefone Aleatório: ${TELEFONEFAKE}  Cidade Aleatória: ${CIDADEFAKE}
  ...                         Cpf: ${CPF}   Trabalho: ${TRABALHOFAKE}
  Log Many    @{PESSOA}

Exemplos relacionados a datas
  ${DATAFAKE}                 FakerLibrary.Date
  ${MESFAKE}                  FakerLibrary.Month
  ${ANOFAKE}                  FakerLibrary.Year
  ${DIADASEMANAFAKE}          FakerLibrary.Day Of Week
  ${DIADOMESFAKE}             FakerLibrary.Day Of Month
  @{DATAS}                    Create List    Data Aleatória: ${DATAFAKE}  Mês Aleatório: ${MESFAKE}  Ano Aleatório: ${ANOFAKE}
  ...                         Dia da Semana Aleatório: ${DIADASEMANAFAKE}   Dia do Mês Aleatório: ${DIADOMESFAKE}
  Log Many    @{DATAS}

Exemplos diversos
  ${EMAILFAKE}                FakerLibrary.Email
  ${PASSWORDFAKE}             FakerLibrary.Password
  ${CORFAKE}                  FakerLibrary.Color Name
  ${CARTAODECREDITOFAKE}      FakerLibrary.Credit Card Number
  ${PALAVRAFAKE}              FakerLibrary.Word
  @{OUTROS}                   Create List    E-mail Aleatório: ${EMAILFAKE}   Senha Aleatória: ${PASSWORDFAKE}
  ...                         Cor Aleatório: ${CORFAKE}   Cartão de Crédito Aleatório: ${CARTAODECREDITOFAKE}
  ...                         Palavra Aleatória: ${PALAVRAFAKE}
  Log Many    @{OUTROS}

###################### FASTSHOP - INSERIR PRODUTO EM FAVORITOS
Dado que acesso e verifico que estou no site da FASTSHOP e realizo o login com o cpf ${cpf} e a senha ${senha}
    Delete All Cookies
    Go To                               ${URL_FAVORITOS}
    Wait Until Element Is Visible       ${ID_LOGIN_CPF}                             30
    Input Text	                        ${ID_LOGIN_CPF}                             ${cpf}
    Input Text	                        ${ID_LOGIN_SENHA}                           ${senha}
    Click Element                       ${BUTTON_CONFIRMAR_VERDE} 
    Capture Page Screenshot
    

Quando quero add em favoritos preencho o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    Go To                               ${BASE_URL}web/p/d/${busca_produto}/teste
    Wait Until Element Is Visible       ${SPAN_ADICIONAR_AO_CARRINHO}               20
    ${PRODUTO}=                         Get Text                                    ${H1_NOME_DO_PRODUTO}
    Set Global Variable                 ${PRODUTO}
    Log                                 ${PRODUTO}     
    Element Text Should Be              ${H2_NOME_DO_PRODUTO}                       ${busca_produto} 
    Set Focus To Element                ${BUTTON_LISTA_DE_FAVORITOS}
    Click Element                       ${BUTTON_LISTA_DE_FAVORITOS}
        Sleep                           3
    Capture Page Screenshot

Quando acesso a vitrine quero add em favoritos preencho o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    Go To                               ${BASE_URL}web/s/${busca_produto}
    Wait Until Element Is Visible       ${BUTTON_FAVORITOS}                         20
    Set Focus To Element                ${BUTTON_FAVORITOS}
        Capture Page Screenshot
    Click Element                       ${BUTTON_FAVORITOS}
        Sleep                           3


Então em favoritos o produto ${busca_produto} é adicionado e verificado que ele está no carrinho 
    Go To                               ${URL_FAVORITOS}
    Wait Until Element Is Visible       //div[@class='prd'][contains(text(), '${busca_produto}')]           10 
    Capture Page Screenshot  
    Click Element                       //div[@class='prd'][contains(text(), '${busca_produto}')]//..//button 
    Capture Page Screenshot

Quando quero add em favoritos cinco prudutos então preencho o campo de busca ${busca_produto},${busca_produto_dois},${busca_produto_tres},${busca_produto_quatro},${busca_produto_cinco} verifico se o mesmo é retornado na lista
    Go To                               ${BASE_URL}web/p/d/${busca_produto}/teste
    Wait Until Element Is Visible       ${SPAN_ADICIONAR_AO_CARRINHO}               20
    ${PRODUTO}=                         Get Text                                    ${H1_NOME_DO_PRODUTO}
    Set Global Variable                 ${PRODUTO}
    Log                                 ${PRODUTO}     
    Element Text Should Be              ${H2_NOME_DO_PRODUTO}                       ${busca_produto} 
    Set Focus To Element                ${BUTTON_LISTA_DE_FAVORITOS}
    Click Element                       ${BUTTON_LISTA_DE_FAVORITOS}
        Sleep                           3
    Capture Page Screenshot
    Go To                               ${BASE_URL}web/p/d/${busca_produto_dois}/teste
    Wait Until Element Is Visible       ${SPAN_ADICIONAR_AO_CARRINHO}               20
    ${PRODUTO}=                         Get Text                                    ${H1_NOME_DO_PRODUTO}
    Set Global Variable                 ${PRODUTO}
    Log                                 ${PRODUTO}     
    Element Text Should Be              ${H2_NOME_DO_PRODUTO}                       ${busca_produto_dois} 
    Set Focus To Element                ${BUTTON_LISTA_DE_FAVORITOS}
    Click Element                       ${BUTTON_LISTA_DE_FAVORITOS}
        Sleep                           3
    Capture Page Screenshot
        Go To                               ${BASE_URL}web/p/d/${busca_produto_tres}/teste
    Wait Until Element Is Visible       ${SPAN_ADICIONAR_AO_CARRINHO}               20
    ${PRODUTO}=                         Get Text                                    ${H1_NOME_DO_PRODUTO}
    Set Global Variable                 ${PRODUTO}
    Log                                 ${PRODUTO}     
    Element Text Should Be              ${H2_NOME_DO_PRODUTO}                       ${busca_produto_tres} 
    Set Focus To Element                ${BUTTON_LISTA_DE_FAVORITOS}
    Click Element                       ${BUTTON_LISTA_DE_FAVORITOS}
        Sleep                           3
    Capture Page Screenshot
        Go To                               ${BASE_URL}web/p/d/${busca_produto_quatro}/teste
    Wait Until Element Is Visible       ${SPAN_ADICIONAR_AO_CARRINHO}               20
    ${PRODUTO}=                         Get Text                                    ${H1_NOME_DO_PRODUTO}
    Set Global Variable                 ${PRODUTO}
    Log                                 ${PRODUTO}     
    Element Text Should Be              ${H2_NOME_DO_PRODUTO}                       ${busca_produto_quatro} 
    Set Focus To Element                ${BUTTON_LISTA_DE_FAVORITOS}
    Click Element                       ${BUTTON_LISTA_DE_FAVORITOS}
        Sleep                           3
    Capture Page Screenshot
        Go To                               ${BASE_URL}web/p/d/${busca_produto_cinco}/teste
    Wait Until Element Is Visible       ${SPAN_ADICIONAR_AO_CARRINHO}               20
    ${PRODUTO}=                         Get Text                                    ${H1_NOME_DO_PRODUTO}
    Set Global Variable                 ${PRODUTO}
    Log                                 ${PRODUTO}     
    Element Text Should Be              ${H2_NOME_DO_PRODUTO}                       ${busca_produto_cinco} 
    Set Focus To Element                ${BUTTON_LISTA_DE_FAVORITOS}
    Click Element                       ${BUTTON_LISTA_DE_FAVORITOS}
        Sleep                           3
    Capture Page Screenshot    

Então em favoritos os produtos em favoritos ${busca_produto},${busca_produto_dois},${busca_produto_tres},${busca_produto_quatro},${busca_produto_cinco} são adicionados e verificados que estão no carrinho 
    Go To                               ${URL_FAVORITOS}
    Wait Until Element Is Visible       //div[@class='prd'][contains(text(), '${busca_produto}')]           10 
    Set Focus To Element                //div[@class='prd'][contains(text(), '${busca_produto}')]//..//button 
    Click Element                       //div[@class='prd'][contains(text(), '${busca_produto}')]//..//button 
        Sleep                           3
        Capture Page Screenshot
    Click Element                       //div[@class='prd'][contains(text(), '${busca_produto_dois}')]//..//button 
        Set Focus To Element            //div[@class='prd'][contains(text(), '${busca_produto_dois}')]//..//button
        Sleep                           3
        Capture Page Screenshot
    Click Element                       //div[@class='prd'][contains(text(), '${busca_produto_tres}')]//..//button 
        Set Focus To Element            //div[@class='prd'][contains(text(), '${busca_produto_tres}')]//..//button 
        Sleep                           3
        Capture Page Screenshot
    Click Element                       //div[@class='prd'][contains(text(), '${busca_produto_quatro}')]//..//button 
        Set Focus To Element            //div[@class='prd'][contains(text(), '${busca_produto_quatro}')]//..//button 
        Sleep                           3
        Capture Page Screenshot
    Click Element                       //div[@class='prd'][contains(text(), '${busca_produto_cinco}')]//..//button 
        Set Focus To Element            //div[@class='prd'][contains(text(), '${busca_produto_cinco}')]//..//button
        Sleep                           3
        Capture Page Screenshot