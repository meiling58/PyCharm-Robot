*** Settings ***
Resource  myDriver.robot

*** Variables ***
${google_url}  https://www.google.com

*** Keywords ***
Open google with chrome
    Open Browser with chrome    ${google_url}
    Title Should Be  Google

Open google with edge
    Open Browser with edge  ${google_url}
    Title Should Be  Google

Open google with firefox
    Open Browser with firefox  ${google_url}
    Title Should Be  Google
