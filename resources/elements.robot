*** Settings ***
Resource         ../resources/setup_hz.robot

*** Variables ***
### Busca Produto
${INPUT_BUSCA_PRODUTO}                                id:inpHeaderSearch
${SPAN_LUPA_BUSCA_PRODUTO}                            id:btnHeaderSearch
${BUTTON_SELECIONAR_SERVICO}                          //button[contains(text(), 'Selecionar')]
${H2_NOME_DO_PRODUTO}                             	  //h2[@class='product-detail-partnumber']
${H1_NOME_DO_PRODUTO}                                 //h2[@class='product-detail-partnumber']//..//h1
${A_ADICIONAR_NOVO_ENDERECO}                          //a[@class='btn btn-new-address']  
${SPAN_ADICIONAR_AO_CARRINHO}                         //span[@class='lb-add-cart']
${BUTTON_CONTINUAR_COMPRA_VERDE}                      //span[contains(text(), ' Subtotal ')]//..//button[contains(text(), 'Continuar compra')]  
${BUTTON_CONTINUAR_VERDE_ENDERECO}                    (//button[contains(text(), 'Continuar')])[last()]   
${DIV_QUANDO_RECEBER}                                 //div[contains(text(), 'Quando deseja receber?')]  
${H1_ADICIONAR_SERVICO}                               //h1[contains(text(), 'Deseja adicionar algum serviço?')] 
${H1_COMO_DESEJA_PAGAR}                               //h1[contains(text(), 'Como deseja pagar?')] 
${DIV_ADD_CARTAO_DE_CREDITO}                          //div[contains(text(), ' Adicionar Cartão de Crédito ')] 
${BUTTON_CONTINUAR_VERDE_DADOS_PESSOAIS}              (//button[contains(text(), 'Continuar')])[last()]   
${BUTTON_CONTINUAR_VERDE_SERVICOS}                    (//button[contains(text(), 'Continuar')])[last()]  
${BUTTON_CONTINUAR_VERDE_PAGAMENTO}                   (//button[contains(text(), 'Continuar')])[last()] 
${BUTTON_CONTINUAR_VERDE_ADD_CARTAO}                  (//button[contains(text(), 'Continuar')])[last()]  
${BUTTON_CONTINUAR_VERDE_FINALIZAR_COMPRA}            (//button[contains(text(), 'Finalizar compra')])[last()] 
${DIV_DESCRICAO_DO_PAGAMENTO}                         //div[@class='invoice-description']
${CARRINHO_URL}                                       http://webapp2-qa.fastshop.com.br/web/checkout-v2/carrinho  
${DIV_COMPRA_CONCLUIDA}                               //div[contains(text(), 'Você receberá no e-mail')]  
${DIV_EXCLUIR_PRODUTO}                                //div[@class='remove']  
${P_CARRINHO_VAZIO}                                   //p[@class='alert-text'][contains(text(), 'Seu carrinho está vazio.')]
${DIV_NOME_DO_PRODUTO}                                //div[@class='row']//span[1]
${LABEL_PERIODO_DO_SEGURO}                            //span[contains(text(), '+')]//..//..//label  
${BUTTON_APLICAR_SEGURO}                              //button[contains(text(), 'APLICAR')]        
${DIV_NOME_DO_TITULAR_DO_CARTAO}                      //div[contains(text(), 'NOME DO TITULAR')]  
${INPUT_NUMERO_CARTAO_DE_CREDITO}                     id:cardNumber                     
${INPUT_NOME_TITULAR_DO_CARTAO}                       id:holderName
${INPUT_VALIDADE_DO_CARTAO}                           id:expireDate
${INPUT_CPF_TITULAR_CARTAO}                           id:document    
${DIV_PAGAMENTO_CARTAO_JUROS}                         //div[contains(text(), ' Juros de')] 
${DIV_PAGAMENTO_PARCELAMENTO}                         //div[@class='select-items'] 
${DIV_PAGAMENTO_CVV}                                  //input[@formcontrolname='cvv']
${LABEL_PAGAMENTO_PARCELADO}                          //div[@class='box-virtual-select']
${DIV_PAGAMENTO_LISTA_1x}                             //div[contains(text(), '1x iguais')]    
${DIV_PAGAMENTO_LISTA_3x}                             //div[contains(text(), '3x iguais')]  

#ENDEREÇO
${INPUT_ENDEREÇO_NOME_DESTINATARIO}                   //input[@formcontrolname='name']
${ID_ENDEREÇO_CEP}                                    id:zipCode
${ID_ENDEREÇO_NOME_DA_RUA}                            id:streetName
${ID_ENDEREÇO_NUMERO}                                 id:number
${ID_ENDEREÇO_COMPLEMENTO}                            id:complement
${ID_ENDEREÇO_BAIRRO}                                 id:district
${ID_ENDEREÇO_CIDADE}                                 id:city
${ID_ENDEREÇO_ESTADO}                                 //select[@formcontrolname='state']
${ID_ENDEREÇO_TIPO_CASA}                              //select[@formcontrolname='housingType']
${ID_ENDEREÇO_TELEFONE}                               id:telephone
${BUTTON_SALVAR_ENDERÇO}                              //button[contains(text(), ' Adicionar ')]

### Login
${ID_LOGIN_CPF}                                       id:document
${ID_LOGIN_SENHA}                                     id:password
${BUTTON_CONFIRMAR_VERDE}                             //button[@class='btn btn-green']   
${A_NOME_CLIENTE_LOGADO}                              //a[contains(text(), 'Teste')] 
${P_MENSSAGEM_ERRO_LOGIN}                             //p[@class='err-msg']
${DIV_CPF_INVALIDO}                                   //div[@class='invalid-feedback']
${P_MENSSAGEM_ERRO_LOGIN}                             //p[contains(text(), ' Entre ou ')]
${A_LOGOUT}                                           //a[@class='logout']


### Cadastro API
${URL_CADASTRO_API}                         http://webapp2-qa.fastshop.com.br/web/checkout/cadastro  
${url}                                      http://webapp2-qa.fastshop.com.br/web/checkout/cadastro
${check_informe_Cpf_nao_cadastro}           id:document
${check_informe_Cpf}                        id:inputUser
${check_botao_verde_continuar}              class:btn-green
${check_label_senha_na_fastshop}            //label[contains(text(),'Senha na Fast Shop')]
${check_informe_senha}                      id:current-password
${check_botao_verde_continuar_comprando}    class:btn-success
${check_nome_andre}                         //span[contains(text(),'ANDRE')]
${check_mensagem_vermelha}                  //div[@class='invalid-feedback']
${check_mensagem_span_critica_vermelha}     class:invalid-feedback
${check_campo_cpf}                          id:document
${check_cadastro_nome}                      id:name
${check_cadastro_idade}                     id:birthday
${check_cadastro_sexo}                      //span[contains(text(),'Sexo')]//..//select
${check_cadastro_telefone}                  id:telephone
${check_cadastro_email}                     id:email
${check_cadastro_senha}                     id:password
${check_cadastro_confirmacao_senha}         id:password_confirmation
${check_cadastro_recebe_email}              id:receiveEmailFast
${check_cadastro_recebe_sms}                id:receiveSMSFast
${check_cadastro_cep}                       id:zipCode
${check_cadastro_rua}                       id:streetName
${check_cadastro_numero_casa}               id:number
${check_cadastro_bairro}                    id:district
${check_cadastro_cidade}                    id:city  
${check_cadastro_complemento}               id:complement
${check_cadastro_select_imovel}             //span[contains(text(),'Tipo de Imóvel')]//..//select
${check_icone_validador_verde_cep}          //span[contains(text(),'CEP')]//..//i[@class='validation-icon']          
${check_icone_validador_verde_rua}          //span[contains(text(),'Endereço')]//..//i[@class='validation-icon'] 
${check_icone_validador_verde_casa}         //span[contains(text(),'Número')]//..//i[@class='validation-icon'] 
${check_icone_validador_verde_bairro}       //span[contains(text(),'Bairro')]//..//i[@class='validation-icon'] 
${check_icone_validador_verde_cidade}       //span[contains(text(),'Cidade')]//..//i[@class='validation-icon']  
${check_icone_validador_verde_estado}       //span[contains(text(),'Estado')]//..//i[@class='validation-icon']
${check_icone_validador_verde_imovel}       //span[contains(text(),'Tipo de Imóvel')]//..//i[@class='validation-icon']         
