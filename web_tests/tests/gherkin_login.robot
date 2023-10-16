*** Settings ***
Documentation     A test suite with a single Gherkin style test.
...
...               This test is functionally identical to the example in
...               valid_login.robot file.
##Resources
Resource    ../core/home_page_core.robot

Resource     ../../jira_api/Jira.resource
Test Teardown     Run keywords   Close Browser
...     Save Status
#Suite Teardown  ResultVisitor.


*** Test Cases ***
Valid Login
    [Documentation]     TEST VALID LOGIN USING GHERKIN KEYWORD STRATEGY
    [Tags]      RBF-12       WEB_TEST
    Given browser is opened to login page
    When user "demo" logs in with password "mode"
    Then welcome page should be open
#    [Teardown]  Save status

*** Keywords ***
Browser is opened to login page
    Open browser to login page

User "${username}" logs in with password "${password}"
    home_page_core.Input username    ${username}
    home_page_core.Input password    ${password}
    home_page_core.Submit credentials
    
#Save Status
#    set suite variable  ${status}    ${TEST_STATUS}
#    Log To Console    'status is : ' ${status}