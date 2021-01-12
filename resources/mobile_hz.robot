*** Settings ***
Resource    ../resources/app/android.robot
Resource    ../resources/app/app_elements.robot
Resource    ../resources/mobile_hz.robot


*** Keywords ***  
###################### FASTSHOP - LOGIN ANDROID COM SUCESSO
Dado que acesso e verifico que estou no app android da FASTSHOP
    Log to console                           Abrir Aplcativo Fastshop

Quando logo com o usuário ${usuario_existente} e insiro a sua senha válida ${senha_valida}
    Click Element                            ${ICONE_LOGIN}
    Wait Until Element Is Visible            ${ENTRAR_CADASTRAR}               ${timeout}    
    Click Element                            ${ENTRAR_CADASTRAR}    
    Wait Until Element Is Visible            ${INFORMAR_CPF}                   ${timeout}              
    Input Text	                             ${INFORMAR_CPF}                   ${usuario_existente}
    Wait Until Element Is Visible            ${INFORMAR_SENHA}
    Input Text	                             ${INFORMAR_SENHA}                 ${senha_valida}
    Wait Until Element Is Visible            ${BUTTON_ENTRAR}                  ${timeout}
    Click Element                            ${BUTTON_ENTRAR}
    Log to console                           Quando - OK

Então o app me direciona para a tela inicial e exibe meu nome no canto superior esquerdo ${nome_cliente_logado}  
    Page Should Contain Element              ${ICONE_LOGIN}                    ${timeout} 
        Sleep                                    5
    Click Element                            ${ICONE_LOGIN}                
    Wait Until Element Is Visible            ${LOGIN_NOME_DO_CLIENTE}          ${timeout}  
    Capture Page Screenshot
    Log to console                           Então - OK

###################### FASTSHOP - LOGIN ANDROID COM SUCESSO VERIFICAR EMAIL
Então o aplicativo me direciona para a tela inicial e exibe meu nome no canto superior esquerdo ${email_cliente_logado} 
    Page Should Contain Element              ${ICONE_LOGIN}                    ${timeout} 
        Sleep                                5
    Click Element                            ${ICONE_LOGIN}
    Wait Until Element Is Visible            ${LOGIN_EMAIL_DO_CLIENTE}         ${timeout}   
    Capture Page Screenshot
    Log to console                           Então - OK

###################### FASTSHOP - CADASTRO ANDROID COM SUCESSO 
Quando acesso e verifico que estou na página de cadastro, insiro um cpf não existente
    Click Element                            ${ICONE_LOGIN}
    Wait Until Element Is Visible            ${ENTRAR_CADASTRAR}               ${timeout}    
    Click Element                            ${ENTRAR_CADASTRAR}    
    Wait Until Element Is Visible            ${INFORMAR_CPF}                   ${timeout}            
    ${CPF}                                   FakerLibrary.cpf                           
    Log to console                           CPF: ${CPF}
    Log to console                           Senha 12345678 
    Input Text                               ${INFORMAR_CPF}                   ${CPF} 
    Wait Until Element Is Visible            ${MENSAGEM_CLIENTE_NÃO_CADASTRADO}			
    Click Element                            ${BUTTON_FACA_SEU_CADASTRO}	
        Sleep                                5	
    Log to console                           Quando - OK ***TELA 1
 
E todos os campos da tela de cadastro são preenchidos
    Input Text                              ${TEXTO_NOME_COMPLETO}                   Andre teste mobile  
    Input Text                              ${TEXTO_RG}	                             275528850
 
    Click Element                           ${CLICK_SEXO} 							
    Wait Until Element Is Visible           ${CLICK_ESCOLHA_DO_SEXO_MASCULINO}				
    Click Element                           ${CLICK_ESCOLHA_DO_SEXO_MASCULINO} 
    Click Element                           ${BUTTON_CONFIRMA_OPCAO_DO_SEXO}				
        Sleep                               2	
    Input Text                              ${TEXTO_DATA_DE_NASCIMENTO}	             03061986  
    Click Element                           ${BUTTON_CONTINUAR_TELA_2_CADASTRO}
    Log to console                          ***TELA 2
        Sleep                               2
    Wait Until Element Is Visible           ${TEXTO_DIGITE_SEU_CEP} 
    Input Text                              ${TEXTO_DIGITE_SEU_CEP}		             07110-040  
        Sleep                               3
    Wait Until Element Is Visible           ${TEXTO_ENDERECO_NUMERO} 
    Input Text                              ${TEXTO_ENDERECO_NUMERO}		         85
    Input Text                              ${TEXTO_ENDERECO_COMPLEMENTO}            Casa 
    Input Text                              ${TEXTO_ENDERECO_TELEFONE}               (11)99252-2336 
    Input Text                              ${TEXTO_ENDERECO_CELULAR}                (11)99252-2337
    Click Element                           ${CLICK_TIPO_DE_IMOVEL} 						
    Wait Until Element Is Visible           ${CLICK_ESCOLHA_CASA}
    Click Element                           ${CLICK_ESCOLHA_CASA} 
        Sleep                               2	
    Click Element                           ${BUTTON_CONTINUAR_TELA_3_CADASTRO}				
    Log to console                          ***TELA 3
        Sleep                               2
    ${PALAVRAFAKE}                          FakerLibrary.Word            
    Input Text                              ${TEXTO_CADASTRO_EMAIL}			           ${PALAVRAFAKE}_hz@testemobilefastshopteste.com.br    				
    Input Text                              ${TEXTO_CADASTRO_CONFIRMA_EMAIL}		   ${PALAVRAFAKE}_hz@testemobilefastshopteste.com.br
    Log to console                          Email: ${PALAVRAFAKE}_hz@testemobilefastshopteste.com.br     
    Input Text                              ${TEXTO_CADASTRO_SENHA}                     12345678  
    Input Text                              ${TEXTO_CADASTRO_CONFIRMA_SENHA}            12345678
    Click Element    						${RADIO_OFERTAS_PROMOCOES}		
    Click Element                           ${RADIO_OFERTAS_PROMOCOES} 
    Click Element				            ${RADIO_INFORMACOES_POR_SMS}				
    Click Element                           ${RADIO_OFERTAS_PROMOCOES_PARCEIROS}			
    Click Element                           ${BUTTON_CONTINUAR_TELA_4_CADASTRO}	
    Sleep                                   60
        Log to console                          E - OK    ***TELA 3


Então sou cadastrado e meu email é exibido ao clicar no icone de perfil da tela inicial 
    Log to console                          ***HOME
    Page Should Contain Element              ${ICONE_LOGIN}                    ${timeout} 
        Sleep                                5
    Click Element                            ${ICONE_LOGIN}
    Wait Until Element Is Visible            ${LOGIN_EMAIL_DO_CLIENTE}         ${timeout}   
    Capture Page Screenshot
    Log to console                           Então - OK


###PAGAMENTO
E busco, insiro e verifico um produto no carrinho ${busca_produto} 
    Wait Until Element Is Visible            ${ICONE_BUSCA_PRODUTO_HOME}
    Click Element                            ${TEXTO_BUSCA_PRODUTO_HOME}
        Sleep                                2
    Input Text                               ${TEXTO_BUSCA_PRODUTO_HOME}        ${busca_produto} 
    Press Keycode                            66
    Wait Until Element Is Visible            ${IMAGEM_DESCRICAO_PRODUTO}
    Click Element                            ${IMAGEM_DESCRICAO_PRODUTO}
    Wait Until Element Is Visible            ${ICONES_ESTRELAS_RANKING}  
    Swipe                                    531    1680    562    932
        Sleep                                2
    Wait Until Element Is Visible            ${BUTTON_ADICIONAR_AO_CARRINHO}  
    Click Element                            ${BUTTON_COMPRAR_PRODUTO}                 #${BUTTON_ADICIONAR_AO_CARRINHO}
        Sleep                                2
    Wait Until Page Contains                 Adicionando ao carrinho...                20
    Wait Until Page Does Not Contain         Adicionando ao carrinho...                20   
    Wait Until Element Is Visible            ${TEXTO_FASTSHOP_CARRINHO}                20     

    Click Element                            ${SELECT_QUANTIDADE_PRODUTO}                    
    Wait Until Element Is Visible            id=br.com.fastshop.ecommerce.beta:id/bottomSheetTitleView
    Click Element                            xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/androidx.recyclerview.widget.RecyclerView/android.widget.RadioButton[1]
  
        Sleep    10
