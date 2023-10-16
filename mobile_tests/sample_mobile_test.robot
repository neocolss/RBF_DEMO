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
    [Documentation]     Test Calulator apk on emulated android device
    [Tags]  RBD-13  MOBILE
    Open calculator
    AppiumLibrary.Click Element    xpath=//android.widget.Button[contains(@text,'6')]
    Click Element    xpath=//android.widget.Button[contains(@text,'+')]
    Click Element    xpath=//android.widget.Button[contains(@text,'4')]
    Click Element    xpath=//android.widget.Button[contains(@text,'=')]
    Element Text Should Be  id=com.android.calculator2:id/result     10
    Sleep    5 seconds
    Close Application

#Test Mobile Browser
#    #${kwag}  Create Dictionary     chromeOptions=${COptions}
#    ${caps}    Create Dictionary    chromeOptions    ${Options}
#    #Set to Dictionary    ${caps}   add_experimental_option    ${v}
#    Set to Dictionary    ${caps}    platformName    Android
#    Set to Dictionary    ${caps}    platformVersion    14.0
#    Set To Dictionary    ${caps}    deviceName    emulator-5554
#    Set To Dictionary    ${caps}    browserName    Chrome
#    Set To Dictionary    ${caps}    autoGrantPermissions     true
#     Set To Dictionary   ${caps}    autoAcceptAlerts   true
#    #set to dictionary    ${caps}    chromeOptions   ${kwag}
#    Create Webdriver    Remote    command_executor=http://localhost:4723/wd/hub     desired_capabilities=${caps}
#    go to   https://google.com
#    #appium --allow-insecure chromedriver_autodownload
#    SeleniumLibrary.Input Text    id=com.android.chrome:id/search_box_text    robotFramework
#    SeleniumLibrary.Click Element    id=com.android.chrome:id/line_1
#    SeleniumLibrary.Click Element    xpath=//div[@id="rso"]/div[1]/div/div/div[1]/div/div/div[1]/a/div[1]/div[2]/div