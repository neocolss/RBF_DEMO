*** Settings ***
Documentation  API Testing in Robot Framework
Library  SeleniumLibrary
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***

*** Test Cases ***
Do a GET Request and validate the response code and response body
    [documentation]  This test case verifies that the response code of the GET Request should be 200
    [tags]  API
    ${resp}=    GET   https://jsonplaceholder.typicode.com/posts
    Status Should Be  200  ${resp}
    Log to Console  "resp.json : ${resp.json()}"
    Log to Console  ${resp.json()}[0]

    ${id}=  Get Value From Json     ${resp.json()}[0]      id
    Log To Console    "id: ${id}"
    ${idFromList}=  Get From List   ${id}  0
    ${idFromListAsString}=  Convert To String  ${idFromList}
    Should be equal As Strings  ${idFromListAsString}  1

Do a POST Request and validate the response code, response body, and response headers
    [documentation]  This test case verifies that the response code of the POST Request should be 201,
    ...  the response body contains the 'id' key with value '101',
    ...  and the response header 'Content-Type' has the value 'application/json; charset=utf-8'.
    [tags]  API
    &{body}=  Create Dictionary  title=foo  body=bar  userId=9000
    ${resp}=  POST  https://jsonplaceholder.typicode.com/posts  json=${body}
    Status Should Be  201  ${resp}

    ## Check id as 101 from Response Body
    ${id}=  Get Value From Json  ${resp.json()}  id
    ${idFromList}=  Get From List   ${id}  0
    ${idFromListAsString}=  Convert To String  ${idFromList}
    Should be equal As Strings  ${idFromListAsString}  101

    ## Check the value of the header Content-Type
    ${getHeaderValue}=  Get From Dictionary  ${resp.headers}  Content-Type
    Should be equal  ${getHeaderValue}  application/json; charset=utf-8

*** Keywords ***