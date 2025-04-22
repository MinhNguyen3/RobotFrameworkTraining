*** Settings ***
Resource   ../Resources/Locators/MakeAppointmentLocators.resource
Library    Collections
Library    Zoomba.GUILibrary

*** Variables ***
&{facility_dictionary}    Tokyo=Tokyo CURA Healthcare Center    Hongkong=Hongkong CURA Healthcare Center    Seoul=Seoul CURA Healthcare Center

*** Keywords ***
Select Facility   
    [Arguments]    ${facility}
    Click Element      ${make_facility_locator}    

    ${facility_locator}    Set Variable    ${EMPTY}
    IF    '${facility}' == 'Tokyo'
        ${facility_locator}    Set Variable     ${make_facility_tokyo_locator}
    ELSE IF    '${facility}' == 'Hongkong'
        ${facility_locator}    Set Variable     ${make_facility_hongkong_locator}
    ELSE IF    '${facility}' == 'Seoul'
        ${facility_locator}    Set Variable     ${make_facility_seoul_locator}   
    END
    Click Element      ${facility_locator}   


Select Readmission   
    [Arguments]     ${readmission}
    IF   '${readmission}' == 'Yes'
        Click Element    ${make_hospital_readmission_locator}        
    END

    
    
Select Healthcare Program   
    [Arguments]    ${program}
    ${program_locator}    Set Variable    ${EMPTY}
    IF   '${program}' == 'None'
        ${program_locator}    Set Variable    ${make_program_none_locator}
    ELSE IF    '${program}' == 'Medicaid'
        ${program_locator}    Set Variable    ${make_program_medicaid_locator}
    ELSE IF    '${program}' == 'Medicare'
        ${program_locator}    Set Variable    ${make_program_medicare_locator}
    END
    Click Element    ${program_locator}
   
Enter Visit Date   
    [Arguments]    ${date}
    Input Text    ${make_input_date_locator}    ${date}

Enter Comment   
    [Arguments]    ${comment}
    Input Text    ${make_input_comment_locator}    ${comment}

Click Book Appointment Button
    Click Element    ${book_appointment_btn_locator}
