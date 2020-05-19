*** Settings ***

Resource         ../resources/setup_hz.robot

*** Variables ***
### Busca Produto
${INPUT_BUSCA_PRODUTO}                                id:inpHeaderSearch
${SPAN_LUPA_BUSCA_PRODUTO}                            id:btnHeaderSearch
${H2_NOME_DA_TV}                                 	  //ul[@class='neemu-products-container nm-view-type-grid five-products priceapi-finish']//h2[contains(text(),'Smart TV 4K OLED 77” LG OLED77C9PSB')]
${SPAN_ADICIONAR_AO_CARRINHO}                         //div[@itemprop='offers']//button//span[contains(text(),'Adicionar à sacola')]
${A_BOTAO_VERDE_CONTINUAR}               	          //div[@class='warranty-wrapper']//a[contains(text(),'continuar')]
${P_NOME_DA_TV}                                       //p[contains(text(),'Smart TV 4K OLED 77” LG OLED77C9PSB Wi-Fi - Bluetooth HDR Inteligência Artificial 4 HDMI 3 USB ')]
${NOME_DA_TV}                                         Smart TV 4K OLED 77” LG OLED77C9PSB Wi-Fi - Bluetooth HDR Inteligência Artificial 4 HDMI 3 USB 
