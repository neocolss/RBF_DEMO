*** Settings ***
Library    AppiumLibrary
*** Variables ***
${REMOTE_URL}     http://127.0.0.1:4723/wd/hub
${PLATFORM_NAME}    Android
${PLATFORM_VERSION}    14
${DEVICE_NAME}    emulator-5554
${Activity_NAME}        com.android.calculator2.Calculator
${PACKAGE_NAME}     com.android.calculator2
*** Keywords ***
Open calculator
  Open Application   ${REMOTE_URL}
  ...        platformName=${PLATFORM_NAME}
  ...    platformVersion=${PLATFORM_VERSION}
  ...   deviceName=${DEVICE_NAME}
  ...   automationName=UiAutomator2
    ...    newCommandTimeout=2500
    ...    appActivity=${Activity_NAME}
    ...    appPackage=${PACKAGE_NAME}
*** Test Cases ***
Test calculator APK
    Open calculator
    Click Element    xpath=//android.widget.Button[contains(@text,'6')]
    Click Element    xpath=//android.widget.Button[contains(@text,'+')]
    Click Element    xpath=//android.widget.Button[contains(@text,'4')]
    Click Element    xpath=//android.widget.Button[contains(@text,'=')]
    Element Text Should Be  id=com.android.calculator2:id/result     10
    Sleep    5 seconds
    Close Application

Test Mobile Browser
    Open Application   ${REMOTE_URL}
     ...        platformName=${PLATFORM_NAME}
    ...    platformVersion=${PLATFORM_VERSION}
    ...   deviceName=${DEVICE_NAME}
    ...   automationName=UiAutomator2
    ...    newCommandTimeout=2500
    ...    appActivity=com.android.chrome
    ...    appPackage=com.google.android.apps.chrome.Main

