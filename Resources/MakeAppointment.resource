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

    Run Keyword If    '${facility}' == 'Tokyo'
    ...    Click Element    ${make_facility_tokyo_locator}
    ...  ELSE IF    '${facility}' == 'Hongkong'
    ...    Click Element    ${make_facility_hongkong_locator}
    ...  ELSE IF   '${facility}' == 'Seoul'
    ...    Click Element    ${make_facility_seoul_locator}
    ...  ELSE
    ...    Log    Invalid Facility    WARN    

    Click Element      ${make_facility_locator}    


Select Hospital Readmission   
    [Arguments]     ${readmission}
    Run Keyword If    '${readmission}' == 'Yes'
    ...    Click Element    ${make_hospital_readmission_locator}
    ...  ELSE IF    '${readmission}' != 'No'
    ...      Log    Invalid Hospital Readmission    WARN
    
    
Select Healthcare Program   
    [Arguments]    ${program}
    Run Keyword If    '${program}' == 'None'
    ...    Click Element    ${make_program_none_locator}
    ...  ELSE IF    '${program}' == 'Medicaid'
    ...    Click Element    ${make_program_medicaid_locator}
    ...  ELSE IF    '${program}' == 'Medicare'
    ...    Click Element    ${make_program_medicare_locator}
    ...  ELSE
    ...    Log    Invalid Healthcare Program    WARN

   
Enter Visit Date   
    [Arguments]    ${date}
    Input Text    ${make_input_date_locator}    ${date}

Enter Comment   
    [Arguments]    ${comment}
    Input Text    ${make_input_comment_locator}    ${comment}

Click Book Appointment Button
    Click Element    ${book_appointment_btn_locator}
