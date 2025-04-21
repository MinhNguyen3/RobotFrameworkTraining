*** Settings ***
Library    Zoomba.GUILibrary
Resource    ../Keywords/MakeAppointmentPage.resource
Test Template    Make appointment should be succeed
Test Teardown    Close Browser

*** Test Cases ***                                                   Facility    Hospital Readmission    Program        Date        Comment
Hongkong, Yes, Medicaid, 30/04/2025, Test comment 1                   Hongkong           Yes             Medicaid    30/04/2025    Test comment 1
Seoul, No, None, ABCDEF, Test comment 2                                Seoul              No              None        ABCDEF      Test comment 2
Tokyo, No, Medicare, 01-01-2020, EMPTY comment                         Tokyo              No              Medicare    01-01-2020      ${EMPTY}

A, B, C, D, EMPTY comment                                                A                 B               C            D              ${EMPTY}


Tokyo, No, Medicare, EMPTY, EMPTY Comment                            [Template]      Visit date can not be empty
                                                                        Tokyo              No              Medicare    ${EMPTY}     ${EMPTY}
*** Keywords ***
# ${facility}, ${hospital_readmission}, ${program}, ${date}, ${comment}
Make appointment should be succeed
    [Arguments]    ${facility}    ${hospital_readmission}    ${program}    ${date}    ${comment}
    Given Login account
    When Make appointment        ${facility}    ${hospital_readmission}    ${program}    ${date}    ${comment}
    Then Verify appointment is correct    ${facility}    ${hospital_readmission}    ${program}    ${date}    ${comment}

Visit date can not be empty
    [Arguments]    ${facility}    ${hospital_readmission}    ${program}    ${date}    ${comment}
    Given Login account
    When Make appointment        ${facility}    ${hospital_readmission}    ${program}    ${EMPTY}    ${comment}
    Then Date Picker Appears

