*** Settings ***
Library     SeleniumLibrary
Library     Collections
Library     ScreenCapLibrary
Resource    elements.robot
Resource    setup_hz.robot

*** Variables ***
${BASE_URL}     http://webapp2-qa.fastshop.com.br/

*** Keywords ***
Start Session
    Open Browser                    about:blank         headlesschrome
    Set Selenium Implicit Wait      10
    Maximize Browser Window
    #Start Video Recording
    #Start Gif Recording



End Session
    Close Browser

End Test
    Capture Page Screenshot	
    #Stop Video Recording
    #Stop Gif Recording
    
