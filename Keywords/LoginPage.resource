*** Settings ***
Library    Zoomba.GUILibrary
Resource    ../Resources/Locators/LoginPageLocators.resource
Resource    ../Resources/Common.resource

*** Keywords ***
Go to Login Page
    Open Browser    https://katalon-demo-cura.herokuapp.com/    edge    
    Click Element    ${menu_locator}
    Click Element    ${login_page_locator}
    Wait Until Element Is Visible    ${login_btn_locator}

Login with username and password
    [Arguments]    ${username}    ${password}
    Input Text    ${username_locator}    ${username}
    Input Password    ${password_locator}    ${password}
    Click Button    ${login_btn_locator}

Verify Login succeed
    Wait Until Element Is Visible    ${book_appointment_btn_locator}    5

Verify Login failed
    Wait Until Element Is Visible    ${login_failed_message_locator}    5