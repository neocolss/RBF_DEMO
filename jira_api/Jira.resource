*** Settings ***
Library     api_jira.py

*** Keywords ***
Save Status
    set suite variable  ${status}    ${TEST_STATUS}
    Log To Console    'status is : ' ${status}
    ${jira_issue_tags}=  Set Variable    @{TEST TAGS}
    Log To Console    'tags are : ' ${jira_issue_tags}
    ${jira_key}=    Set Variable    ${jira_issue_tags}[0]
    Log To Console    'Jira tag:'${jira_key}
    Assign Jira Status      ${jira_key}     'FAIL'
