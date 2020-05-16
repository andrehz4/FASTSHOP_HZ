*** Settings ***
Resource    base.robot

*** Keywords ***
###################### Magazine Luiza
Dado que acesso e verifico que estou no site Magazine Luiza
    Go To               ${BASE_URL}
    Title Should Be     Magazine Luiza | Pra você é Magalu! 

Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista



Então o produto o é adicionado e verificado que está no carrinho 
    



    
Então devo ir para a página de cadastro do TCM no modo rascunho "${expect_message}"
    Element Text Should Be                  ${TEXTO_ESTA_PRESENTE}                          ${expect_message}
    ${WebElement}=                          Get WebElement	                                ${TEXTO_ESTA_PRESENTE}
    Wait Until Element Is Visible           ${TEXTO_GUIA_DE_USUARIO_PRESENTE}               20
    

