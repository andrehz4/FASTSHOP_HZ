*** Settings ***
Resource         ../resources/setup_hz.robot

*** Variables ***
### Busca Produto
${INPUT_BUSCA_PRODUTO}                                id:inpHeaderSearch
${SPAN_LUPA_BUSCA_PRODUTO}                            id:btnHeaderSearch
${H2_NOME_DO_PRODUTO}                             	  //h2[@class='product-detail-partnumber']
${SPAN_ADICIONAR_AO_CARRINHO}                         //span[@class='lb-add-cart']

### Login
${ID_LOGIN_CPF}                                       id:document
${ID_LOGIN_SENHA}                                     id:password
${BUTTON_CONFIRMAR_VERDE}                             //button[@class='btn btn-green']  
${CARRINHO_URL}                                       http://webapp2-qa.fastshop.com.br/web/checkout-v2/carrinho  