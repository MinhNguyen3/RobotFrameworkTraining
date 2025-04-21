*** Settings ***       
Library    BuiltIn
Resource    ../Keywords/LoginPage.resource
Resource    ../Resources/Locators/MakeAppointmentLocators.resource
*** Variables ***
${VALID_USERNAME}=    John Doe
${VALID_PASSWORD}=    ThisIsNotAPassword    
${INVALID_USERNAME}=    ABCDEFGHIJKLMNOPQRSTUVWXYZ
${INVALID_PASSWORD}=    123456789

*** Keywords ***
Login account
    Go to Login Page
    Login with username and password    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Wait Until Element Is Visible    ${book_appointment_btn_locator}    5s