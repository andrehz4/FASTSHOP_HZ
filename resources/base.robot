*** Settings ***
Library     SeleniumLibrary
Library     RequestsLibrary
Library     Collections
Library     ScreenCapLibrary
Library     FakerLibrary    locale=pt_BR
Resource    elements.robot
Resource    services.robot
Resource    setup_hz.robot

*** Variables ***
${BASE_URL}     http://webapp2-qa.fastshop.com.br/

*** Keywords ***
Start Session
    Open Browser                    about:blank         chrome
    Set Selenium Implicit Wait      10
    Maximize Browser Window
    Start Video Recording
    #Start Gif Recording



End Session
    Close Browser
    Stop Video Recording
    #Stop Gif Recording

End Test
    Capture Page Screenshot	
    
    
End Test product
    Capture Page Screenshot	
    