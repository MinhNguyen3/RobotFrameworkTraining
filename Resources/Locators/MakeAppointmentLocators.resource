*** Variables ***
${make_hospital_readmission_locator}=    xpath=//input[@id='chk_hospotal_readmission']
${make_program_none_locator}=    xpath=//input[@id='radio_program_none']
${make_program_medicaid_locator}=    xpath=//input[@id='radio_program_medicaid']
${make_program_medicare_locator}=    xpath=//input[@id='radio_program_medicare']
${book_appointment_btn_locator}=    xpath=//button[@id='btn-book-appointment']
${make_input_comment_locator}=    xpath=//textarea[@id='txt_comment']
${make_input_date_locator}=    xpath=//input[@id='txt_visit_date']
${make_facility_locator}=    xpath=//select[@id='combo_facility']
${make_facility_tokyo_locator}=    xpath=//option[@value='Tokyo CURA Healthcare Center']
${make_facility_hongkong_locator}=    xpath=//option[@value='Hongkong CURA Healthcare Center']
${make_facility_seoul_locator}=    xpath=//option[@value='Seoul CURA Healthcare Center']
${make_date_picker_locator}=    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']
    



${confirm_facility_locator}=    xpath=//p[@id='facility']
${confirm_hospital_readmission_locator}=    xpath=//p[@id='hospital_readmission']
${confirm_program_locator}=    xpath=//p[@id='program']   
${confirm_date_locator}=    xpath=//p[@id='visit_date']
${confirm_comment_locator}=    xpath=//p[@id='comment']
${confirm_apointment_header}=    xpath=//h2[normalize-space()='Appointment Confirmation']

