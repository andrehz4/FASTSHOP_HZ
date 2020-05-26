*** Settings ***
Library	    Collections			
Library	    RequestsLibrary
Library     OperatingSystem
Resource    helpers.robot

*** Variables ***
${base_url}     https://apiqa.fastshop.com.br/fastshop-qa/wcs/resources/v1/customer/create

*** Keywords ***
### /sessions
Post Session
    [Arguments]     ${payload}

    &{headers}=	    Create Dictionary	Content-Type=application/json

    ${resp}=	    Post Request     Client      /sessions     data=${payload}     headers=${headers}
    [return]        ${resp}

Get User Id
    [Arguments]         ${email}
    ${payload}=         Convert To Json     {"email": "${email}"}
    Log                 ${payload}
    ${resp}=            Post Session        ${payload}
    ${user_id}=         Convert To String   ${resp.json()['_id']}
    [return]            ${user_id}

### Cadastro Fast
Post Client Ad
    [Arguments]     ${user_id}      ${payload}      ${thumb}

    &{headers}=	    Create Dictionary	user_id=${user_id}

    ${file_bin}=    Get Binary File     ${CURDIR}/images/${thumb}
    &{files}=       Create Dictionary   thumbnail=${file_bin}    

    ${resp}=	    Post Request     Client      /Client     data=${payload}     headers=${headers}     files=${files}
    [return]        ${resp}



