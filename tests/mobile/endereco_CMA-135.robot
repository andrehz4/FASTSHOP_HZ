*** Settings ***
Resource    ../../resources/app/android.robot
Resource    ../../resources/app/app_elements.robot
Resource    ../../resources/mobile_hz.robot

Documentation      FASTSHOP - Endereço
...                Dado que o usuário está com a bottom sheet de alteração de endereço aberta (no carrinho), 
...                quando clicar na opção 'informar outro CEP', então deve ser aberto um dialog para digitação do novo CEP. 
...                Como usuário do app Fast Shop, quero informar um novo CEP como endereço de entrega, 
...                para que os produtos que estou comprando sejam entregues em um endereço que ainda não está cadastrado.


Test Setup         Abrir app
Test Teardown      Fechar app


*** Test Cases ***
VALIDAR EXIBIÇÃO DO CAMPO "INFORMAR OUTRO CEP"

     [Template]                       Login, inserir produto no carrinho e validar campo de endereço                                                                        
     #CPF            #SENHA           #Produto
     87054962338     12345678        ANDRE HENRIQUE ZIMERMANN


LOGIN COM SUCESSO NO APLICATIVO ANDROID DA FASTSHOP - VERIFICAR E-MAIL
     [Template]                       Login android com sucesso verificando o email                                                                    
     #CPF            #SENHA           #Produto
     87054962338     12345678         eng.andrehz@gmail.com

#Cpf não cadastrado
#CPF INVALIDO
#Senha invalida


*** Keywords ***
Login, inserir produto no carrinho e validar campo de endereço
    [Arguments]                 ${usuario_existente}                    ${senha_valida}                 ${busca_produto}                   
    
    Dado que acesso e verifico que estou no app android da FASTSHOP
    Quando logo com o usuário ${usuario_existente} e insiro a sua senha válida ${senha_valida}
    E busco, verifico o produto e adiciono ao carrinho ${busca_produto} 
    