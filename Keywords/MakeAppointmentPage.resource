*** Settings ***
Resource   ../Resources/Common.resource
Resource   ../Resources/MakeAppointment.resource
Library    ../Resources/libs/CheckDateFormat.py
Library    Collections
Library    BuiltIn
Library    DateTime
Library    String


*** Keywords ***
Make appointment
    [Arguments]    ${facility}    ${readmission}    ${program}    ${date}    ${comment}
    Select Facility   ${facility}
    Select Readmission   ${readmission}
    Select Healthcare Program   ${program}
    Enter Visit Date   ${date}
    Enter Comment  ${comment}
    Click Book Appointment Button

Verify appointment is correct
    [Arguments]    ${facility}    ${readmission}    ${program}    ${date}    ${comment}
    &{expected_information}=    Get Expected Appointment Information    ${facility}    ${readmission}    ${program}    ${date}    ${comment}
    &{actual_informantion}=    Get Actual Appointment Information
    Dictionaries Should Be Equal    ${actual_informantion}    ${expected_information}    

Get Actual Appointment Information
    ${actual_facility}=    Get Text    ${confirm_facility_locator}
    ${actual_readmission}=    Get Text    ${confirm_hospital_readmission_locator}
    ${actual_program}=    Get Text    ${confirm_program_locator}
    ${actual_date}=    Get Text    ${confirm_date_locator}
    ${actual_comment}=    Get Text     ${confirm_comment_locator}
    
        
    &{actual_information}=    Create Dictionary    Facility=${actual_facility}    
    ...                                            Hospital Readmission=${actual_readmission}    
    ...                                            Program=${actual_program}    
    ...                                            Date=${actual_date}    
    ...                                            Comment=${actual_comment}

    RETURN    &{actual_information}
    


Get Expected Appointment Information
    [Arguments]    ${facility}    ${readmission}    ${program}    ${date}    ${comment}

    ${current_date}=    Get Current Date    result_format=%d/%m/%Y
    ${is_datetime}=    CheckDateFormat.Is Valid Datetime    ${date}
    IF    ${is_datetime}
        ${expected_date}=    Replace String    ${date}    -    /
    ELSE
        ${expected_date}=    Set Variable    ${current_date}
    END

    ${expected_facility}=    Get From Dictionary    ${facility_dictionary}    ${facility}
    &{expected_information}=    Create Dictionary    Facility=${expected_facility}       
    ...                                              Hospital Readmission=${readmission}
    ...                                              Program=${program}
    ...                                              Date=${expected_date}
    ...                                              Comment=${comment}

    RETURN    &{expected_information}


Date Picker Appears
    Wait Until Element Is Visible    ${make_date_picker_locator}