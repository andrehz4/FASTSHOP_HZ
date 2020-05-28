Documentation  Cadastro de CEP invalido.	
...  O cadastro de endereço esta permitindo realizar cadastro de CEP invalido.
...  1 - Clicar em Adicionar novo endereço.
...  2 - Preencher no campo CEP 00000000 e preencher todos os outros campos de forma manual.
...  3 - Clicar em Adicionar.
...  4 - Clicar no botão continuar no resumo do pedido após selecionar esse endereço cadastrado com o CEP invalido.
...  Resultado obtido:
...  Ao inserir CEP invalido o cadastro pode ser finalizado e permite ir pro próximo passo.
...  Resultado esperado:
...  Que quando inserir um CEP invalido o cadastro não seja permito e que se a regra de negócio permita esse cadastro que mostre a mensagem " CEP não localizado. Acesse a Central de Atendimento ou ligue... conforme é exibido atualmente em produção conforme evidencia anexa.

*** Settings ***
Resource         ../resources/base.robot
Suite Setup      Start Session
Suite Teardown   End Session
Test Teardown    End Test



*** Test Cases ***        
INSERIR DOIS PRODUTOS NO CARRINHO COM SERVIÇO 
    [Template]                  CEP inválido não deixa concluir a compra

    #CPF                        #Senha                      #Produto                                 #CEP                                                             
    941.861.830-31              12345678                    AEMWHJ2BZACNZB                           00000000  


*** Keywords ***
CEP inválido não deixa concluir a compra
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}            ${cep}                  

    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    E adiciono um serviço
    E entro na página de acionar um novo endereço a mesma é carregada 
    
