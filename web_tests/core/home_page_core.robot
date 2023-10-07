*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

##Resources
Resource    ../pages/homepage.robot
Resource    ../conf/config.resource
Resource    ../urls/urls.resource

*** Variables ***
${VALID USER}     demo
${VALID PASSWORD}    mode

*** Keywords ***
Open Browser To Login Page
    Open Browser     ${_LOGIN_URL_}    ${_BROWSER_}
    Maximize Browser Window
    Set Selenium Speed    ${_DELAY_}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Login Page

Go To Login Page
    Go To    ${_LOGIN_URL_}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text     ${input_login}    ${username}

Input Password
    [Arguments]    ${password}
    Input Text     ${input_password}    ${password}

Submit Credentials
    Click Button    ${btn_submit}

Welcome Page Should Be Open
    Location Should Be    ${_WELCOME_URL_}
    Title Should Be    Welcome Page
