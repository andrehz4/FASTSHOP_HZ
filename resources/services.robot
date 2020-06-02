*** Settings ***
Library	    Collections			
Library	    RequestsLibrary
Library     OperatingSystem

Resource    helpers.robot

*** Variables ***
${base_url}     https://apiqa.fastshop.com.br
${cpf_api}      94186183031                          


*** Keywords ***
### /sessions
Post Session
    [Arguments]     ${payload}

    &{headers}=	    Create Dictionary	Content-Type=application/json

    ${resp}=	    Post Request     FastShop      /fastshop-qa/wcs/resources/v1/auth/login     data=${payload}     headers=${headers}
    [return]        ${resp}
    Log             ${payload} 
    Log             ${headers}
    Log             ${resp} 


Logar na FastShop
    [Arguments]                         ${cpf_api}              ${senha_api}    ${resp.status_code_page}               
    ${payload}=                         Convert To Json         {"document":"${cpf_api}","password":"${senha_api}"}
    ${resp}=	                        Post Session            ${payload}
    Should Be Equal As Strings          ${resp.status_code}     ${resp.status_code_page} 


Visualizar o carrinho FASTSHOP
   
    [Arguments]                         ${cpf_api}          ${senha_api}               
    ${payload}=                         Convert To Json     {"document":"${cpf_api}","password":"${senha_api}"}
    Log                                 ${payload}
    ${resp}=                            Post Session        ${payload}
    Should Be Equal As Strings          ${resp.status_code}     201
    ${WCToken}=                         Convert To String   ${resp.json()['WCToken']}
    
    Log                                 ${payload}
    ${WCTrustedToken}=                  Convert To String   ${resp.json()['WCTrustedToken']}

    Log                                 ${WCTrustedToken}
    ${userID}=                          Convert To String   ${resp.json()['userID']}

    Log                                 ${userID}
    &{headers}=	                        Create Dictionary	storeId=${userID}       WCToken=${WCToken}       WCTrustedToken=${WCTrustedToken}        Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${resp}=	                        Get Request         FastShop      /v1/checkout/cart/self     data=${payload}     headers=${headers}     
    
    Should Be Equal As Strings          ${resp.status_code}     200


Deletar dois produtos do carrinho FastShop
   
    [Arguments]                         ${cpf}          ${senha}        ${busca_produto}    ${busca_produto_dois}               
    ${payload}=                         Convert To Json     {"document":"${cpf}","password":"${senha}"}
    Log                                 ${payload}
    ${resp}=                            Post Session        ${payload}
    Should Be Equal As Strings          ${resp.status_code}     201
    ${WCToken}=                         Convert To String   ${resp.json()['WCToken']}
    
    Log                                 ${payload}
    ${WCTrustedToken}=                  Convert To String   ${resp.json()['WCTrustedToken']}

    Log                                 ${WCTrustedToken}
    ${userID}=                          Convert To String   ${resp.json()['userID']}

    Log                                 ${userID}
    &{headers}=	                        Create Dictionary	storeId=${userID}       WCToken=${WCToken}               WCTrustedToken=${WCTrustedToken}        Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${resp}=	                          Delete Request         FastShop      /v1/checkout/cart/${busca_produto}    data=${payload}     headers=${headers}     
    Log to console                      ${resp}        
    &{headers}=	                        Create Dictionary	storeId=${userID}       WCToken=${WCToken}               WCTrustedToken=${WCTrustedToken}        Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${resp}=	                          Delete Request         FastShop      /v1/checkout/cart/${busca_produto_dois}    data=${payload}     headers=${headers}     
    Log to console                      ${resp}   
  



  #Wishlist
Inserir um produto em favoritos no carrinho FASTSHOP
   
    [Arguments]                         ${cpf_api}          ${senha_api}            ${busca_produto}        ${resp.status_code_page}                       
    ${payload}=                         Convert To Json     {"document":"${cpf_api}","password":"${senha_api}"}
    Log                                 ${payload}
    ${resp}=                            Post Session        ${payload}
    Should Be Equal As Strings          ${resp.status_code}     201
    ${WCToken}=                         Convert To String   ${resp.json()['WCToken']}
    
    Log                                 ${payload}
    ${WCTrustedToken}=                  Convert To String   ${resp.json()['WCTrustedToken']}

    Log                                 ${WCTrustedToken}
    ${userID}=                          Convert To String   ${resp.json()['userID']}

    Log                                 ${userID}
    &{headers}=	                        Create Dictionary	storeId=${userID}       WCToken=${WCToken}       WCTrustedToken=${WCTrustedToken}        Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     [{"sku":"${busca_produto}","quantity":1,"url":"/p/d/JBLGO2PTOB/iphone-11-branco-com-tela-de-61-4g-64-gb-e-camera-de-12-mp-mwlu2bra"}]
    Log                                 ${payload}

    ${resp}=	                        Post Request            FastShop       /v1/checkout/cart/wishList?deleteCartItem=false        data=${payload}     headers=${headers}     
    Should Be Equal As Strings          ${resp.status_code}     ${resp.status_code_page}

    &{headers}=	                        Create Dictionary	    storeId=${userID}       WCToken=${WCToken}               WCTrustedToken=${WCTrustedToken}        Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${resp}=	                        Delete Request          FastShop      /v1/checkout/cart/wishList/${busca_produto}    data=${payload}     headers=${headers}     
    Log to console                      ${resp}   
  

### create
Cadastro criar um usuario com sucesso
    [Arguments]                         ${resp.status_code_page}  
    ${CPF}                              FakerLibrary.cpf  
    ${NOMEFAKE}                         FakerLibrary.Name
    ${TELEFONEFAKE}                     FakerLibrary.Phone Number
    ${PALAVRAFAKE}                      FakerLibrary.Word 
    ${PASSWORDFAKE}                     FakerLibrary.Password 
    &{headers}=	                        Create Dictionary	Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     {"document":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","name":"${NOMEFAKE}","birthday":"1985-06-03","gender":"Male","tradeName":"","companyName":"","ie":"","telephone":"(11) 987488195","cellphone":"(11) 987488195","email":"${PALAVRAFAKE}@fastshopteste.com","password":"${PASSWORDFAKE}","receiveEmailFast":true,"receiveSMSFast":true,"receiveEmailOthers":true,"cpf":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","emailVerify":"${PALAVRAFAKE}@fastshopteste.com","passwordVerify":"${PASSWORDFAKE}","zipCode":"07110040","streetName":"R R MARIA DE CASTRO MESQUITA","number":"84","complement":"56","district":"JARDIM SAO PAULO","city":"GUARULHOS","state":"SP","housingType":"2","country":"Brasil"}
    Log                                 ${payload}

    ${resp}=	                        Post Request            FastShop       /fastshop-qa/wcs/resources/v1/customer/create       data=${payload}     headers=${headers}     
    Log to console                      ${resp.status_code}
    Log to console                      ${resp.json()['nome']}
    Log to console                      ${payload}
    Should Be Equal As Strings          ${resp.status_code}         ${resp.status_code_page}


CPF INVÁLIDO - Cadastro criar um usuario com dados inválidos
    [Arguments]                         ${resp.status_code_page}  
    ${CPF}                              FakerLibrary.cpf  
    ${NOMEFAKE}                         FakerLibrary.Name
    ${TELEFONEFAKE}                     FakerLibrary.Phone Number
    ${PALAVRAFAKE}                      FakerLibrary.Word 
    ${PASSWORDFAKE}                     FakerLibrary.Password 
    &{headers}=	                        Create Dictionary	Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     {"document":"${CPF}","name":"${NOMEFAKE}","birthday":"1985-06-03","gender":"Male","tradeName":"","companyName":"","ie":"","telephone":"(11) 987488195","cellphone":"(11) 987488195","email":"${PALAVRAFAKE}@fastshopteste.com","password":"${PASSWORDFAKE}","receiveEmailFast":true,"receiveSMSFast":true,"receiveEmailOthers":true,"cpf":"${CPF}","emailVerify":"${PALAVRAFAKE}@fastshopteste.com","passwordVerify":"${PASSWORDFAKE}","zipCode":"07110040","streetName":"R R MARIA DE CASTRO MESQUITA","number":"84","complement":"56","district":"JARDIM SAO PAULO","city":"GUARULHOS","state":"SP","housingType":"2","country":"Brasil"}
    Log                                 ${payload}

    ${resp}=	                        Post Request            FastShop       /fastshop-qa/wcs/resources/v1/customer/create       data=${payload}     headers=${headers}     
    Log to console                      ${payload}
    Log to console                      ${resp.status_code}
    Should Be Equal As Strings          ${resp.status_code}         ${resp.status_code_page}

FORMULÁRIO EM BRANCO - Cadastro criar um usuario com dados inválidos
    [Arguments]                         ${resp.status_code_page}  
    ${CPF}                              FakerLibrary.cpf  
    ${NOMEFAKE}                         FakerLibrary.Name
    ${TELEFONEFAKE}                     FakerLibrary.Phone Number
    ${PALAVRAFAKE}                      FakerLibrary.Word 
    ${PASSWORDFAKE}                     FakerLibrary.Password 
    &{headers}=	                        Create Dictionary	Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     {"document":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","name":"","birthday":"","gender":"","tradeName":"","companyName":"","ie":"","telephone":"","cellphone":"","email":"","password":"","receiveEmailFast":true,"receiveSMSFast":true,"receiveEmailOthers":true,"cpf":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","emailVerify":"","passwordVerify":"","zipCode":"07110040","streetName":"R R MARIA DE CASTRO MESQUITA","number":"84","complement":"56","district":"JARDIM SAO PAULO","city":"GUARULHOS","state":"SP","housingType":"2","country":"Brasil"}
    Log                                 ${payload}

    ${resp}=	                        Post Request            FastShop       /fastshop-qa/wcs/resources/v1/customer/create       data=${payload}     headers=${headers}     
    Log to console                      ${payload}
    Log to console                      ${resp.status_code}
    Should Be Equal As Strings          ${resp.status_code}         ${resp.status_code_page}


FORMULÁRIO EM BRANCO DADOS DE ENTREGA - Cadastro criar um usuario com dados inválidos
    [Arguments]                         ${resp.status_code_page}  
    ${CPF}                              FakerLibrary.cpf  
    ${NOMEFAKE}                         FakerLibrary.Name
    ${TELEFONEFAKE}                     FakerLibrary.Phone Number
    ${PALAVRAFAKE}                      FakerLibrary.Word 
    ${PASSWORDFAKE}                     FakerLibrary.Password 
    &{headers}=	                        Create Dictionary	Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     {"document":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","name":"${NOMEFAKE}","birthday":"1985-06-03","gender":"Male","tradeName":"","companyName":"","ie":"","telephone":"(11) 987488195","cellphone":"(11) 987488195","email":"${PALAVRAFAKE}@fastshopteste.com","password":"${PASSWORDFAKE}","receiveEmailFast":true,"receiveSMSFast":true,"receiveEmailOthers":true,"cpf":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","emailVerify":"${PALAVRAFAKE}@fastshopteste.com","passwordVerify":"${PASSWORDFAKE}","zipCode":"","streetName":"","number":"","complement":"","district":"","city":"","state":"","housingType":"","country":""}
    Log                                 ${payload}

    ${resp}=	                        Post Request            FastShop       /fastshop-qa/wcs/resources/v1/customer/create       data=${payload}     headers=${headers}     
    Log to console                      ${payload}
    Log to console                      ${resp.status_code}
    Should Be Equal As Strings          ${resp.status_code}         ${resp.status_code_page}

APENAS PRIMEIRO NOME - Cadastro criar um usuario com dados inválidos
    [Arguments]                         ${resp.status_code_page}  
    ${CPF}                              FakerLibrary.cpf  
    ${NOMEFAKE}                         FakerLibrary.Name
    ${TELEFONEFAKE}                     FakerLibrary.Phone Number
    ${PALAVRAFAKE}                      FakerLibrary.Word 
    ${PASSWORDFAKE}                     FakerLibrary.Password 
    &{headers}=	                        Create Dictionary	Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     {"document":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","name":"ANDRE","birthday":"1985-06-03","gender":"Male","tradeName":"","companyName":"","ie":"","telephone":"(11) 987488195","cellphone":"(11) 987488195","email":"${PALAVRAFAKE}@fastshopteste.com","password":"${PASSWORDFAKE}","receiveEmailFast":true,"receiveSMSFast":true,"receiveEmailOthers":true,"cpf":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","emailVerify":"${PALAVRAFAKE}@fastshopteste.com","passwordVerify":"${PASSWORDFAKE}","zipCode":"07110040","streetName":"R R MARIA DE CASTRO MESQUITA","number":"84","complement":"56","district":"JARDIM SAO PAULO","city":"GUARULHOS","state":"SP","housingType":"2","country":"Brasil"}
    Log                                 ${payload}

    ${resp}=	                        Post Request            FastShop       /fastshop-qa/wcs/resources/v1/customer/create       data=${payload}     headers=${headers}     
    Log to console                      ${payload}
    Log to console                      ${resp.status_code}
    Should Be Equal As Strings          ${resp.status_code}         ${resp.status_code_page}

DATA INVÁLIDA - Cadastro criar um usuario com dados inválidos
    [Arguments]                         ${resp.status_code_page}  
    ${CPF}                              FakerLibrary.cpf  
    ${NOMEFAKE}                         FakerLibrary.Name
    ${TELEFONEFAKE}                     FakerLibrary.Phone Number
    ${PALAVRAFAKE}                      FakerLibrary.Word 
    ${PASSWORDFAKE}                     FakerLibrary.Password 
    &{headers}=	                        Create Dictionary	Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     {"document":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","name":"${NOMEFAKE}","birthday":"0000-06-03","gender":"Male","tradeName":"","companyName":"","ie":"","telephone":"(11) 987488195","cellphone":"(11) 987488195","email":"${PALAVRAFAKE}@fastshopteste.com","password":"${PASSWORDFAKE}","receiveEmailFast":true,"receiveSMSFast":true,"receiveEmailOthers":true,"cpf":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","emailVerify":"${PALAVRAFAKE}@fastshopteste.com","passwordVerify":"${PASSWORDFAKE}","zipCode":"07110040","streetName":"R R MARIA DE CASTRO MESQUITA","number":"84","complement":"56","district":"JARDIM SAO PAULO","city":"GUARULHOS","state":"SP","housingType":"2","country":"Brasil"}
    Log                                 ${payload}

    ${resp}=	                        Post Request            FastShop       /fastshop-qa/wcs/resources/v1/customer/create       data=${payload}     headers=${headers}     
    Log to console                      ${payload}
    Log to console                      ${resp.status_code}
    Should Be Equal As Strings          ${resp.status_code}         ${resp.status_code_page}

TELEFONE INCOMPLETO - Cadastro criar um usuario com dados inválidos
    [Arguments]                         ${resp.status_code_page}  
    ${CPF}                              FakerLibrary.cpf  
    ${NOMEFAKE}                         FakerLibrary.Name
    ${TELEFONEFAKE}                     FakerLibrary.Phone Number
    ${PALAVRAFAKE}                      FakerLibrary.Word 
    ${PASSWORDFAKE}                     FakerLibrary.Password 
    &{headers}=	                        Create Dictionary	Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     {"document":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","name":"${NOMEFAKE}","birthday":"1985-06-03","gender":"Male","tradeName":"","companyName":"","ie":"","telephone":"(11) 9874","cellphone":"(11) 9874","email":"${PALAVRAFAKE}@fastshopteste.com","password":"${PASSWORDFAKE}","receiveEmailFast":true,"receiveSMSFast":true,"receiveEmailOthers":true,"cpf":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","emailVerify":"${PALAVRAFAKE}@fastshopteste.com","passwordVerify":"${PASSWORDFAKE}","zipCode":"07110040","streetName":"R R MARIA DE CASTRO MESQUITA","number":"84","complement":"56","district":"JARDIM SAO PAULO","city":"GUARULHOS","state":"SP","housingType":"2","country":"Brasil"}
    Log                                 ${payload}

    ${resp}=	                        Post Request            FastShop       /fastshop-qa/wcs/resources/v1/customer/create       data=${payload}     headers=${headers}     
    Log to console                      ${payload}
    Log to console                      ${resp.status_code}
    Should Be Equal As Strings          ${resp.status_code}         ${resp.status_code_page}

E-MAIL INVÁLIDO - Cadastro criar um usuario com dados inválidos
    [Arguments]                         ${resp.status_code_page}  
    ${CPF}                              FakerLibrary.cpf  
    ${NOMEFAKE}                         FakerLibrary.Name
    ${TELEFONEFAKE}                     FakerLibrary.Phone Number
    ${PALAVRAFAKE}                      FakerLibrary.Word 
    ${PASSWORDFAKE}                     FakerLibrary.Password 
    &{headers}=	                        Create Dictionary	Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     {"document":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","name":"${NOMEFAKE}","birthday":"1985-06-03","gender":"Male","tradeName":"","companyName":"","ie":"","telephone":"(11) 987488174","cellphone":"(11) 987488174","email":"${PALAVRAFAKE}fastshopteste.com","password":"${PASSWORDFAKE}","receiveEmailFast":true,"receiveSMSFast":true,"receiveEmailOthers":true,"cpf":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","emailVerify":"${PALAVRAFAKE}fastshopteste.com","passwordVerify":"${PASSWORDFAKE}","zipCode":"07110040","streetName":"R R MARIA DE CASTRO MESQUITA","number":"84","complement":"56","district":"JARDIM SAO PAULO","city":"GUARULHOS","state":"SP","housingType":"2","country":"Brasil"}
    Log                                 ${payload}

    ${resp}=	                        Post Request            FastShop       /fastshop-qa/wcs/resources/v1/customer/create       data=${payload}     headers=${headers}     
    Log to console                      ${payload}
    Log to console                      ${resp.status_code}
    Should Be Equal As Strings          ${resp.status_code}         ${resp.status_code_page}

SENHA MENOR QUE 8 CARACTERES - Cadastro criar um usuario com dados inválidos
    [Arguments]                         ${resp.status_code_page}  
    ${CPF}                              FakerLibrary.cpf  
    ${NOMEFAKE}                         FakerLibrary.Name
    ${TELEFONEFAKE}                     FakerLibrary.Phone Number
    ${PALAVRAFAKE}                      FakerLibrary.Word 
    ${PASSWORDFAKE}                     FakerLibrary.Password 
    &{headers}=	                        Create Dictionary	Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     {"document":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","name":"${NOMEFAKE}","birthday":"1985-06-03","gender":"Male","tradeName":"","companyName":"","ie":"","telephone":"(11) 987488195","cellphone":"(11) 987488195","email":"${PALAVRAFAKE}@fastshopteste.com","password":"123","receiveEmailFast":true,"receiveSMSFast":true,"receiveEmailOthers":true,"cpf":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","emailVerify":"${PALAVRAFAKE}@fastshopteste.com","passwordVerify":"123","zipCode":"07110040","streetName":"R R MARIA DE CASTRO MESQUITA","number":"84","complement":"56","district":"JARDIM SAO PAULO","city":"GUARULHOS","state":"SP","housingType":"2","country":"Brasil"}
    Log                                 ${payload}

    ${resp}=	                        Post Request            FastShop       /fastshop-qa/wcs/resources/v1/customer/create       data=${payload}     headers=${headers}     
    Log to console                      ${payload}
    Log to console                      ${resp.status_code}
    Should Be Equal As Strings          ${resp.status_code}         ${resp.status_code_page}

CEP INCOMPLETO - Cadastro criar um usuario com dados inválidos
    [Arguments]                         ${resp.status_code_page}  
    ${CPF}                              FakerLibrary.cpf  
    ${NOMEFAKE}                         FakerLibrary.Name
    ${TELEFONEFAKE}                     FakerLibrary.Phone Number
    ${PALAVRAFAKE}                      FakerLibrary.Word 
    ${PASSWORDFAKE}                     FakerLibrary.Password 
    &{headers}=	                        Create Dictionary	Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     {"document":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","name":"${NOMEFAKE}","birthday":"1985-06-03","gender":"Male","tradeName":"","companyName":"","ie":"","telephone":"(11) 987488195","cellphone":"(11) 987488195","email":"${PALAVRAFAKE}@fastshopteste.com","password":"${PASSWORDFAKE}","receiveEmailFast":true,"receiveSMSFast":true,"receiveEmailOthers":true,"cpf":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","emailVerify":"${PALAVRAFAKE}@fastshopteste.com","passwordVerify":"${PASSWORDFAKE}","zipCode":"071","streetName":"R R MARIA DE CASTRO MESQUITA","number":"84","complement":"56","district":"JARDIM SAO PAULO","city":"GUARULHOS","state":"SP","housingType":"2","country":"Brasil"}
    Log                                 ${payload}

    ${resp}=	                        Post Request            FastShop       /fastshop-qa/wcs/resources/v1/customer/create       data=${payload}     headers=${headers}     
    Log to console                      ${payload}
    Log to console                      ${resp.status_code}
    Should Be Equal As Strings          ${resp.status_code}         ${resp.status_code_page}

CEP INVÁLIDO - Cadastro criar um usuario com dados inválidos
    [Arguments]                         ${resp.status_code_page}  
    ${CPF}                              FakerLibrary.cpf  
    ${NOMEFAKE}                         FakerLibrary.Name
    ${TELEFONEFAKE}                     FakerLibrary.Phone Number
    ${PALAVRAFAKE}                      FakerLibrary.Word 
    ${PASSWORDFAKE}                     FakerLibrary.Password 
    &{headers}=	                        Create Dictionary	Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     {"document":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","name":"${NOMEFAKE}","birthday":"1985-06-03","gender":"Male","tradeName":"","companyName":"","ie":"","telephone":"(11) 987488195","cellphone":"(11) 987488195","email":"${PALAVRAFAKE}@fastshopteste.com","password":"${PASSWORDFAKE}","receiveEmailFast":true,"receiveSMSFast":true,"receiveEmailOthers":true,"cpf":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","emailVerify":"${PALAVRAFAKE}@fastshopteste.com","passwordVerify":"${PASSWORDFAKE}","zipCode":"00000000","streetName":"R R MARIA DE CASTRO MESQUITA","number":"84","complement":"56","district":"JARDIM SAO PAULO","city":"GUARULHOS","state":"SP","housingType":"2","country":"Brasil"}
    Log                                 ${payload}

    ${resp}=	                        Post Request            FastShop       /fastshop-qa/wcs/resources/v1/customer/create       data=${payload}     headers=${headers}     
    Log to console                      ${payload}
    Log to console                      ${resp.status_code}
    Should Be Equal As Strings          ${resp.status_code}         ${resp.status_code_page}


COMPLEMENTO MAIOR QUE 20 CARACTERES - Cadastro criar um usuario com dados inválidos
    [Arguments]                         ${resp.status_code_page}  
    ${CPF}                              FakerLibrary.cpf  
    ${NOMEFAKE}                         FakerLibrary.Name
    ${TELEFONEFAKE}                     FakerLibrary.Phone Number
    ${PALAVRAFAKE}                      FakerLibrary.Word 
    ${PASSWORDFAKE}                     FakerLibrary.Password 
    &{headers}=	                        Create Dictionary	Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     {"document":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","name":"${NOMEFAKE}","birthday":"1985-06-03","gender":"Male","tradeName":"","companyName":"","ie":"","telephone":"(11) 987488195","cellphone":"(11) 987488195","email":"${PALAVRAFAKE}@fastshopteste.com","password":"${PASSWORDFAKE}","receiveEmailFast":true,"receiveSMSFast":true,"receiveEmailOthers":true,"cpf":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","emailVerify":"${PALAVRAFAKE}@fastshopteste.com","passwordVerify":"${PASSWORDFAKE}","zipCode":"07110040","streetName":"R R MARIA DE CASTRO MESQUITA","number":"84","complement":"1234567891011121314151617181920","district":"JARDIM SAO PAULO","city":"GUARULHOS","state":"SP","housingType":"2","country":"Brasil"}
    Log                                 ${payload}

    ${resp}=	                        Post Request            FastShop       /fastshop-qa/wcs/resources/v1/customer/create       data=${payload}     headers=${headers}     
    Log to console                      ${payload}
    Log to console                      ${resp.status_code}
    Should Be Equal As Strings          ${resp.status_code}         ${resp.status_code_page}

CEP MAIOR QUE 8 CARACTERES - Cadastro criar um usuario com dados inválidos
    [Arguments]                         ${resp.status_code_page}  
    ${CPF}                              FakerLibrary.cpf  
    ${NOMEFAKE}                         FakerLibrary.Name
    ${TELEFONEFAKE}                     FakerLibrary.Phone Number
    ${PALAVRAFAKE}                      FakerLibrary.Word 
    ${PASSWORDFAKE}                     FakerLibrary.Password 
    &{headers}=	                        Create Dictionary	Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     {"document":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","name":"${NOMEFAKE}","birthday":"1985-06-03","gender":"Male","tradeName":"","companyName":"","ie":"","telephone":"(11) 987488195","cellphone":"(11) 987488195","email":"${PALAVRAFAKE}@fastshopteste.com","password":"${PASSWORDFAKE}","receiveEmailFast":true,"receiveSMSFast":true,"receiveEmailOthers":true,"cpf":"${CPF[0:3]}${CPF[4:7]}${CPF[8:11]}${CPF[12:]}","emailVerify":"${PALAVRAFAKE}@fastshopteste.com","passwordVerify":"${PASSWORDFAKE}","zipCode":"0000000000000000","streetName":"R R MARIA DE CASTRO MESQUITA","number":"84","complement":"56","district":"JARDIM SAO PAULO","city":"GUARULHOS","state":"SP","housingType":"2","country":"Brasil"}
    Log                                 ${payload}

    ${resp}=	                        Post Request            FastShop       /fastshop-qa/wcs/resources/v1/customer/create       data=${payload}     headers=${headers}     
    Log to console                      ${payload}
    Log to console                      ${resp.status_code}
    Should Be Equal As Strings          ${resp.status_code}         ${resp.status_code_page}


Cadastro criar uma empresa CNPJ
    [Arguments]                         ${CNPJ}                     ${resp.status_code_page}  
    ${CPF}                              FakerLibrary.cpf  
    ${NOMEFAKE}                         FakerLibrary.Name
    ${TELEFONEFAKE}                     FakerLibrary.Phone Number
    ${PALAVRAFAKE}                      FakerLibrary.Word 
    ${PASSWORDFAKE}                     FakerLibrary.Password 
    &{headers}=	                        Create Dictionary	Connection=Connection       User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36       Content-Type=application/json       Accept=application/json, text/plain, */*        checkout-api-version=v1     channel=webapp      
    ${payload}=                         Convert To Json     {"document":"${CNPJ}","name":"${NOMEFAKE}","birthday":"","gender":"","tradeName":"${PALAVRAFAKE}","companyName":"${PALAVRAFAKE}","ie":"andre","telephone":"(11) 98748-8174","cellphone":"(11) 98748-8174","email":"${PALAVRAFAKE}@fastshopteste.com","password":"${PASSWORDFAKE}","receiveEmailFast":true,"receiveSMSFast":true,"receiveEmailOthers":true,"cnpj":"${CNPJ}","emailVerify":"${PALAVRAFAKE}@fastshopteste.com","passwordVerify":"${PASSWORDFAKE}","zipCode":"07110040","streetName":"R R MARIA DE CASTRO MESQUITA","number":"55","complement":"aa","district":"JARDIM SAO PAULO","city":"GUARULHOS","state":"SP","housingType":"1","country":"Brasil"}
    Log                                 ${payload}

    ${resp}=	                        Post Request            FastShop       /fastshop-qa/wcs/resources/v1/customer/create       data=${payload}     headers=${headers}     
    Log to console                      ${payload}
    Log to console                      ${resp.status_code}
    Should Be Equal As Strings          ${resp.status_code}     ${resp.status_code_page}

   
   