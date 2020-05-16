*** Settings ***

Resource         ../resources/setup_hz.robot
# representação do padrão page object para Robot Framework

*** Variables ***
### login page
${INPUT_EMAIL}                                  	  id:email
${INPUT_PASSWORD}                               	  id:password
${BUTTON_LOGIN}                                 	  id:loginButton
${TEXTO_ESTA_PRESENTE}                          	  //span[contains(text(),'Rascunho')]
${TEXTO_GUIA_DE_USUARIO_PRESENTE}               	  //span[contains(text(),'Guia de usuário')]
													  
### Criação de CTs	                                  
${SPAN_CRIACAO_DE_CTS_ADICIONAR}                	   //div[@class='tcm-action-group']//span[@class='glyphicons glyphicons-plus']
${H4_CRIACAO_DE_CTS_LABEL_ADICIONAR}            	   id:addTestCaseLabel
${INPUT_CRIACAO_DE_CTS_NOME_TESTE_CASE}         	   id:testcasename
${BUTTOM_CRIACAO_DE_CTS_SALVAR_OK}              	   //h4[@id='addTestCaseLabel']//..//..//button[contains(text(),'OK')]
${SPAN_TRANSACOES}                              	   //crfo-panel[@title='Transações']//span[@class='glyphicon glyphicon-edit no-padding pull-right']
${SPAN_VALIDACOES_DE_HOST}                      	   //crfo-panel[@title='Validações de Host']//span[@class='glyphicon glyphicon-edit no-padding pull-right']
${SPAN_VALIDACOES_DE_HOST_TRANSACOES}           	   //div[@id='editTcHostvalidations']//h4[@class='ng-binding'][contains(text(),'transacoes')]/..//a[contains(text(),'Adicionar')]
