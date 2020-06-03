*** Settings ***
Documentation      FASTSHOP - CADASTRO
...                Como um usuário e-commerce
...                Desejo criar uma conta no site da Fast Shop
...                Para que ele possa realizar a compra de produtos através do site
...                Como pessoa física gostaria de realizar o cadastro no site da Fast Shop https://www.fastshop.com.br
...                Primeiro inserir o CPF ainda não cadastrado no site, deve ser feita a validação se esse CPF já está cadastrado, 
...                caso já esteja cadastrado deve aparecer o campo de senha.

Resource           ../resources/base.robot
Suite Setup        Start Session
Suite Teardown     End Session
Test Teardown      End Test


*** Test Cases ***
CADASTRO COM SUCESSO
    [Template]                  Cadastro com sucesso 
    #CPF                        #Senha                      #Nome                                                       
    941.861.830-31              12345678                    Teste       

      
CPF INVÁLIDO - Cadastro com dados inválidos 
    [Template]                  CPF INVÁLIDO - Cadastro com dados inválidos 
    #CPF                                                                            
    999.999.999-99     
	
FORMULÁRIO EM BRANCO
    [Template]              FORMULÁRIO EM BRANCO - Cadastro criar um usuario com dados inválidos                          
    ${EMPTY}          

FORMULÁRIO EM BRANCO DADOS DE ENTREGA      
    [Template]              FORMULÁRIO EM BRANCO DADOS DE ENTREGA - Cadastro criar um usuario com dados inválidos                                 
    ${EMPTY}                     

APENAS O PRIMEIRO NOME - CADASTRO 
    [Template]                      CADASTRO APENAS COM O PRIMEIRO NOME - Cadastro criar um usuario com dados inválidos
    #NOME     #DATA DE NASCIMENTO       #GENERO       #TELEFONE     #EMAIL                  #SENHA      #SENHA2
    André     03061986                  Male          987488175     teste@fastshoptes.com   12345678    12345678    

DATA DE NASCIMENTO INVÁLIDA 
    [Template]                      DATA INVÁLIDA - Cadastro criar um usuario com dados inválidos
    #NOME               #DATA DE NASCIMENTO       #GENERO       #TELEFONE     #EMAIL                  #SENHA      #SENHA2
    Teste Automatico     03060000                 Male          987488175     teste@fastshoptes.com   12345678    12345678      
	
TELEFONE INCOMPLETO - Cadastro criar um usuario com dados inválidos 
    [Template]                      TELEFONE INCOMPLETO - Cadastro criar um usuario com dados inválidos
    #NOME               #DATA DE NASCIMENTO       #GENERO       #TELEFONE     #EMAIL                  #SENHA      #SENHA2
    Teste Automatico    03061985                  Male          9874          teste@fastshoptes.com   12345678    12345678            

E-MAIL INVÁLIDO - Cadastro criar um usuario com dados inválidos                             
    [Template]                      E-MAIL INVÁLIDO - Cadastro criar um usuario com dados inválidos                             
    #NOME               #DATA DE NASCIMENTO       #GENERO       #TELEFONE     #EMAIL                  #SENHA      #SENHA2
    Teste Automatico    03061986                  Male          987488175     testefastshoptes.com   12345678    12345678            

SENHA MENOR QUE 8 CARACTERES - Cadastro criar um usuario com dados inválidos                                
    [Template]                      SENHA MENOR QUE 8 CARACTERES - Cadastro criar um usuario com dados inválidos                                             
    #NOME               #DATA DE NASCIMENTO       #GENERO       #TELEFONE     #EMAIL                  #SENHA      #SENHA2
    Teste Automatico    03061986                  Male          987488175     teste@fastshoptes.com   1234567     1234567            
 	
SENHAS DIFERENTES - Cadastro criar um usuario com dados inválidos                                
    [Template]                      SENHAS DIFERENTES - Cadastro criar um usuario com dados inválidos                                          
    #NOME               #DATA DE NASCIMENTO       #GENERO       #TELEFONE     #EMAIL                  #SENHA      #SENHA2
    Teste Automatico    03061986                  Male          987488175     teste@fastshoptes.com   12345678    12345679            

CEP INCOMPLETO - Cadastro criar um usuario com dados inválidos                              
    [Template]                            CEP INCOMPLETO - Cadastro criar um usuario com dados inválidos                                                                        
    #CEP        #TIPO DE IMÓVEL           #NÚMERO DO IMÓVEL     #COMPLEMENTO
    0711004     1                         84                    APARTAMENTO                 

CEP INVÁLIDO - Cadastro criar um usuario com dados inválidos
    [Template]                            CEP INVÁLIDO - Cadastro criar um usuario com dados inválidos                                                                        
    #CEP        #TIPO DE IMÓVEL           #NÚMERO DO IMÓVEL     #COMPLEMENTO
    00000000    1                         84                    APARTAMENTO                 

COMPLEMENTO MAIOR QUE 20 CARACTERES - Cadastro criar um usuario com dados inválidos
    [Template]                            COMPLEMENTO MAIOR QUE 20 CARACTERES - Cadastro criar um usuario com dados inválidos                                                                        
    #CEP        #TIPO DE IMÓVEL           #NÚMERO DO IMÓVEL     #COMPLEMENTO
    07110040    1                         84                    12345678910111213141516171819201234567891011121314151617181920                 

CEP MAIOR QUE 8 CARACTERES - Cadastro criar um usuario com dados inválidos
    [Template]                            CEP MAIOR QUE 8 CARACTERES - Cadastro criar um usuario com dados inválidos                                                                       
    #CEP            #TIPO DE IMÓVEL           #NÚMERO DO IMÓVEL     #COMPLEMENTO
    071100400000    1                         84                    APARTAMENTO                 


*** Keywords ***
Cadastro com sucesso 
    [Arguments]                 ${usuario_existente}                    ${senha_valida}                 ${nome_cliente_logado}                   
    
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando acesso e verifico que estou na página de cadastro, insiro um cpf não existente    
    E todos os campos da tela de cadastro são preenchidos
    E é autorizado o recebimento de ofertas via e-mail e sms
    Então ao clicar em continuar a primeira etapa do cadastrado é encerrada com sucesso
    E é preenchido o campo de endereço, todas as informações são recebidas 

CPF INVÁLIDO - Cadastro com dados inválidos 
    [Arguments]                 ${Cpf_invalido}                                       
    
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando verifico que estou na página de cadastro, insiro um cpf inexistente ${Cpf_invalido} 
    E todos os campos da tela de cadastro são preenchidos

FORMULÁRIO EM BRANCO - Cadastro criar um usuario com dados inválidos  
    [Arguments]                 ${Cpf_invalido}                                       

    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando acesso e verifico que estou na página de cadastro, insiro um cpf não existente 
    E todos os campos da primeira tela de cadastro estão em branco
    E não é autorizado o recebimento de ofertas via e-mail e sms
    Então ao clicar em continuar a primeira etapa do cadastrado é encerrada com sucesso

FORMULÁRIO EM BRANCO DADOS DE ENTREGA - Cadastro criar um usuario com dados inválidos    
    [Arguments]                 ${Cpf_invalido}   

    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando acesso e verifico que estou na página de cadastro, insiro um cpf não existente 
    E todos os campos da tela de cadastro são preenchidos
    E é autorizado o recebimento de ofertas via e-mail e sms
    Então ao clicar em continuar a primeira etapa do cadastrado é encerrada com sucesso
    E não são preenchidas as informações de endereço e clico em cadastrar

CADASTRO APENAS COM O PRIMEIRO NOME - Cadastro criar um usuario com dados inválidos
    [Arguments]     ${nome}     ${data_de_nascimento}       ${genero}       ${telefone}     ${email}    ${senha}    ${senha_dois}

    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando acesso e verifico que estou na página de cadastro, insiro um cpf não existente
    E os campos da tela de cadastro são preenchidos, porém com dados inválidos ${nome} ${data_de_nascimento} ${genero} ${telefone} ${email} ${senha} ${senha_dois} 
    E é autorizado o recebimento de ofertas via e-mail e sms
    Então ao clicar em continuar a primeira etapa do cadastrado é encerrada com sucesso


DATA INVÁLIDA - Cadastro criar um usuario com dados inválidos
    [Arguments]     ${nome}     ${data_de_nascimento}       ${genero}       ${telefone}     ${email}    ${senha}    ${senha_dois}

    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando acesso e verifico que estou na página de cadastro, insiro um cpf não existente
    E os campos da tela de cadastro são preenchidos, porém com dados inválidos ${nome} ${data_de_nascimento} ${genero} ${telefone} ${email} ${senha} ${senha_dois} 
    E é autorizado o recebimento de ofertas via e-mail e sms
    Então ao clicar em continuar a primeira etapa do cadastrado é encerrada com sucesso

TELEFONE INCOMPLETO - Cadastro criar um usuario com dados inválidos
    [Arguments]     ${nome}     ${data_de_nascimento}       ${genero}       ${telefone}     ${email}    ${senha}    ${senha_dois}

    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando acesso e verifico que estou na página de cadastro, insiro um cpf não existente
    E os campos da tela de cadastro são preenchidos, porém com dados inválidos ${nome} ${data_de_nascimento} ${genero} ${telefone} ${email} ${senha} ${senha_dois} 
    E é autorizado o recebimento de ofertas via e-mail e sms
    Então ao clicar em continuar a primeira etapa do cadastrado é encerrada com sucesso

E-MAIL INVÁLIDO - Cadastro criar um usuario com dados inválidos                             
    [Arguments]     ${nome}     ${data_de_nascimento}       ${genero}       ${telefone}     ${email}    ${senha}    ${senha_dois}

    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando acesso e verifico que estou na página de cadastro, insiro um cpf não existente
    E os campos da tela de cadastro são preenchidos, porém com dados inválidos ${nome} ${data_de_nascimento} ${genero} ${telefone} ${email} ${senha} ${senha_dois} 
    E é autorizado o recebimento de ofertas via e-mail e sms
    Então ao clicar em continuar a primeira etapa do cadastrado é encerrada com sucesso


SENHA MENOR QUE 8 CARACTERES - Cadastro criar um usuario com dados inválidos                
    [Arguments]     ${nome}     ${data_de_nascimento}       ${genero}       ${telefone}     ${email}    ${senha}    ${senha_dois}

    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando acesso e verifico que estou na página de cadastro, insiro um cpf não existente
    E os campos da tela de cadastro são preenchidos, porém com dados inválidos ${nome} ${data_de_nascimento} ${genero} ${telefone} ${email} ${senha} ${senha_dois} 
    E é autorizado o recebimento de ofertas via e-mail e sms
    Então ao clicar em continuar a primeira etapa do cadastrado é encerrada com sucesso

SENHAS DIFERENTES - Cadastro criar um usuario com dados inválidos                
    [Arguments]     ${nome}     ${data_de_nascimento}       ${genero}       ${telefone}     ${email}    ${senha}    ${senha_dois}

    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando acesso e verifico que estou na página de cadastro, insiro um cpf não existente
    E os campos da tela de cadastro são preenchidos, porém com dados inválidos ${nome} ${data_de_nascimento} ${genero} ${telefone} ${email} ${senha} ${senha_dois} 
    E é autorizado o recebimento de ofertas via e-mail e sms
    Então ao clicar em continuar a primeira etapa do cadastrado é encerrada com sucesso

CEP INCOMPLETO - Cadastro criar um usuario com dados inválidos                              
    [Arguments]     ${cep}    ${tipo_imovel}   ${numero_imovel}   ${complemento}     

    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando acesso e verifico que estou na página de cadastro, insiro um cpf não existente
    E todos os campos da tela de cadastro são preenchidos
    E é autorizado o recebimento de ofertas via e-mail e sms
    Então ao clicar em continuar a primeira etapa do cadastrado é encerrada com sucesso
    E não são preenchidos os campos de entrega da maneira correta ${cep} ${tipo_imovel} ${numero_imovel} ${complemento}          

CEP INVÁLIDO - Cadastro criar um usuario com dados inválidos                              
    [Arguments]     ${cep}    ${tipo_imovel}   ${numero_imovel}   ${complemento}     

    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando acesso e verifico que estou na página de cadastro, insiro um cpf não existente
    E todos os campos da tela de cadastro são preenchidos
    E é autorizado o recebimento de ofertas via e-mail e sms
    Então ao clicar em continuar a primeira etapa do cadastrado é encerrada com sucesso
    E não são preenchidos os campos de entrega da maneira correta ${cep} ${tipo_imovel} ${numero_imovel} ${complemento}          

COMPLEMENTO MAIOR QUE 20 CARACTERES - Cadastro criar um usuario com dados inválidos                             
    [Arguments]     ${cep}    ${tipo_imovel}   ${numero_imovel}   ${complemento}     

    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando acesso e verifico que estou na página de cadastro, insiro um cpf não existente
    E todos os campos da tela de cadastro são preenchidos
    E é autorizado o recebimento de ofertas via e-mail e sms
    Então ao clicar em continuar a primeira etapa do cadastrado é encerrada com sucesso
    E não são preenchidos os campos de entrega da maneira correta ${cep} ${tipo_imovel} ${numero_imovel} ${complemento} 

CEP MAIOR QUE 8 CARACTERES - Cadastro criar um usuario com dados inválidos
    [Arguments]     ${cep}    ${tipo_imovel}   ${numero_imovel}   ${complemento}     

    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando acesso e verifico que estou na página de cadastro, insiro um cpf não existente
    E todos os campos da tela de cadastro são preenchidos
    E é autorizado o recebimento de ofertas via e-mail e sms
    Então ao clicar em continuar a primeira etapa do cadastrado é encerrada com sucesso
    E não são preenchidos os campos de entrega da maneira correta ${cep} ${tipo_imovel} ${numero_imovel} ${complemento} 









