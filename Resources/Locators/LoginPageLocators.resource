*** Variables ***
${menu_locator}=    //a[@id='menu-toggle']
${login_page_locator}=    //a[@href='profile.php#login']
${user_name_locator}=    xpath=//input[@id='txt-username']
${password_locator}=    xpath=//input[@id='txt-password']
${login_btn_locator}=    xpath=//button[@id='btn-login']
${book_appointment_btn_locator}=    xpath=//button[@id='btn-book-appointment']
${login_failed_message_locator}=    xpath=//p[@class='lead text-danger']