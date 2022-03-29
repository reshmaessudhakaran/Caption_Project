*** Settings ***
Documentation      This suite will handles all the test cases related to invalid
...     credential test for orangehrm. Test case - TC_OH_3,4,5
Resource      ../Resource/Base/CommonFunctionality.resource
#Resource    ../Resource/Pages/LoginPage.resource


Test Setup      Launch Browser And Navigate To URL
Test Teardown      Close Browser

Test Template       Verify Invalid Credential Template

*** Test Cases ***
TC1       reshmaes@gmail.com     reshma123     Login was unsuccessful
TC2       reshma@gmail.com     resh123     Login was unsuccessful
#TC3       ${EMPTY}      admin123        Username cannot be empty
#TC4       bala       ${EMPTY}       Password cannot be empty


*** Keywords ***
Verify Invalid Credential Template
    [Arguments]     ${Email}     ${Password}     ${Expected_error}
    Set Selenium Speed  2s
    Input Text        id=Email      ${Email}
    Input Password    id=Password       ${Password}
    Click Element    xpath=//*[@class="button-1 login-button"]
    Element Should Contain   xpath=//*[@class="message-error validation-summary-errors"]      ${Expected_error}
    Capture Page Screenshot
