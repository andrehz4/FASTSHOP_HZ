*** Settings ***
Documentation      FASTSHOP - BUSCA NA HOME
...                Como um usuário do site Fast Shop
...                O cliente deseja pesquisar um produto especifico
...                Para que ele possa analisar preços e modelos do produto que deseja comprar

Resource         ../../../resources/base.robot
Suite Setup      Start Session
Suite Teardown   End Session
Test Teardown    End Test

  
*** Test Cases ***        
ACESSAR A HOME DA FASTSHOP E REALIZAR UMA BUSCA DE UM PRODUTO
    [Template]                  Entrar na home da Fastshop, pesquisar um produto e visualiza-lo
    [Tags]                      HOME1

    #CPF                        #Senha                      #Produto                                                                      
    941.861.830-31              12345678                    PANAF160B5W1               



*** Keywords ***
Entrar na home da Fastshop, pesquisar um produto e visualiza-lo
    [Arguments]                 ${cpf}                  ${senha}                    ${busca_produto}                   

    Dado que acesso e verifico que estou no site da FASTSHOP e realizo o login com o cpf ${cpf} e a senha ${senha}
    Quando acesso a vitrine e procurar um produto, então preencho o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    Então o produto ${busca_produto} é verificado que está no retorno da busca 













@webapp
Funcionalidade: Buscar um produto especifico no site da Fast Shop
  Como um usuário do site Fast Shop
  Otoniel deseja pesquisar um produto especifico
  Para que ele possa analisar preços e modelos do produto que deseja comprar


  Contexto:
    Dado que "Otoniel" acessa a página inicial da Fast Shop

  @prioridade:alta @valido
  Cenário: Busca de produtos através da página inicial
    Quando ele realiza a busca pelo produto "Liquidificador"
    Então ele deve visualizar que uma lista de itens referentes ao produto buscado
