*** Settings ***
Resource    ../Keywords/LoginPage.resource
Test Template    Login should be failed
Test Teardown    Close Browser


*** Test Cases ***                         User Name             Password
Invalid User Name, Invalid Password        ${INVALID_USERNAME}    ${INVALID_PASSWORD}
Invalid User Name, Valid Password          ${INVALID_USERNAME}    ${VALID_PASSWORD} 
Valid User Name, Invalid Password          ${VALID_USERNAME}     ${INVALID_PASSWORD}
Empty User Name and Password               ${EMPTY}              ${EMPTY}
Valid User Name and Password               [Template]    Login should be succeed
                                           ${VALID_USERNAME}     ${VALID_PASSWORD}

*** Keywords ***
Login should be succeed
    [Arguments]    ${username}    ${password}
    Given Go to Login Page
    When Login with username and password    ${username}    ${password}
    Then Verify Login succeed

Login should be failed
    [Arguments]    ${username}    ${password}
    Given Go to Login Page
    When Login with username and password    ${username}    ${password}
    Then Verify Login failed