*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource    ../core/home_page_core.robot
*** Test Cases ***
Valid Login
    [Documentation]     TEST VALID LOGIN
    [Tags]  RBF-8
    Open Browser To Login Page
    Input Username    demo
    home_page_core.Input Password    mode
    Submit Credentials
    Welcome Page Should Be Open
    [Teardown]    Close Browser
