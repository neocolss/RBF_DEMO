*** Settings ***
Documentation     A test suite containing tests related to invalid login.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Test Setup        Go To Login Page
##TEST TEMPLATE : THE SAME SCENARIO BUT DIFFERENT DATA OF TEST (DATA DRIVEN TESTS)
Test Template     Login With Invalid Credentials Should Fail
Resource    ../core/home_page_core.robot

*** Test Cases ***               USER NAME        PASSWORD
Invalid Username                 invalid          ${VALID PASSWORD}
Invalid Password                 ${VALID USER}    invalid
Invalid Username And Password    invalid          whatever
Empty Username                   ${EMPTY}         ${VALID PASSWORD}
Empty Password                   ${VALID USER}    ${EMPTY}
Empty Username And Password      ${EMPTY}         ${EMPTY}

*** Keywords ***
Login With Invalid Credentials Should Fail
    [Tags]  RBF-9
    [Documentation]     TEST INVALID LOGIN USING TDD STRATEGY
    [Arguments]    ${username}    ${password}
    home_page_core.Input Username    ${username}
    home_page_core.Input Password    ${password}
    home_page_core.Submit Credentials
    Login Should Have Failed

Login Should Have Failed
    Location Should Be    ${ERROR URL}
    Title Should Be    Error Page
