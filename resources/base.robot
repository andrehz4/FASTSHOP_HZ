*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    elements.robot
Resource    setup_hz.robot

*** Variables ***
${BASE_URL}     https://www.magazineluiza.com.br/

*** Keywords ***
Start Session
    Open Browser                    about:blank      chrome
    Set Selenium Implicit Wait      10
    Maximize Browser Window

End Session
    Close Browser

End Test
    Capture Page Screenshot	