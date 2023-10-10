*** Settings ***
Documentation     A test suite with a single Gherkin style test.
...
...               This test is functionally identical to the example in
...               valid_login.robot file.
##Resources
Resource    ../core/home_page_core.robot
Test Teardown     Close Browser

*** Test Cases ***
Valid Login
    [Documentation]     TEST VALID LOGIN USING GHERKIN KEYWORD STRATEGY
    [Tags]  WEB_TEST
    Given browser is opened to login page
    When user "demo" logs in with password "mode"
    Then welcome page should be open

*** Keywords ***
Browser is opened to login page
    Open browser to login page

User "${username}" logs in with password "${password}"
    home_page_core.Input username    ${username}
    home_page_core.Input password    ${password}
    home_page_core.Submit credentials
