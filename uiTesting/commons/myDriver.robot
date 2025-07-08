*** Settings ***
Documentation  Common Keywords for webdrivers: chrome, edge and firefox
Library  SeleniumLibrary


*** Keywords ***
Open Browser with chrome
    [Arguments]  ${url}
    ${driverpath}=    Evaluate    webdriver_manager.chrome.ChromeDriverManager().install()    modules=webdriver_manager.chrome
	Open Browser  ${url}  Chrome 	executable_path=${driverpath}

Open Browser with edge
    [Arguments]  ${url}
    ${driverpath}=    Evaluate    webdriver_manager.microsoft.EdgeChromiumDriverManager().install()    modules=webdriver_manager.microsoft
	Open Browser  ${url}  Edge 	executable_path=${driverpath}

 Open Browser with firefox
    [Arguments]  ${url}
    ${driverpath}=    Evaluate    webdriver_manager.firefox.GeckoDriverManager().install()    modules=webdriver_manager.firefox
	Open Browser  ${url}  firefox 	executable_path=${driverpath}
