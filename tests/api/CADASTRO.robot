*** Settings ***

Resource       ../../resources/services.robot

Test Setup    Create Session    Client    ${base_url}

*** Test Cases ***

Empty Name
    [Template]      Require Fields
    {"name": "", "brand": "Shimano", "price": "15"}     1001        Client name is required

Empty Brand
    [Template]      Require Fields
    {"name": "Elleven Rocker", "brand": "", "price": "15"}     1002        Brand is required

*** Keywords ***
Require Fields
    [Arguments]     ${json}     ${expect_bcode}        ${expect_message}

    ${user_id}=    Get User Id           eu@papito.io
    ${payload}=    Convert To Json       ${json}

    ${resp}=    Post Client Ad    ${user_id}    ${payload}    elleven.jpg
    Log         ${resp.text}

    ${business_code}=    Convert To Integer    ${expect_bcode}

    Should Be Equal As Strings         ${resp.status_code}       412
    Should Be Equal                    ${resp.json()['code']}    ${business_code}
    Dictionary Should Contain Value    ${resp.json()}            ${expect_message}


