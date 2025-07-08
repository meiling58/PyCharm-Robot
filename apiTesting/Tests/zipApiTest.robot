*** Comments ***
test data:
Zip code 19403
country: United States
country abbreviation:US
post code:19403
places
place name:Norristown
longitude: "-75.3796"
latitude: "40.1496"
state:Pennsylvania
state abbreviation: PA
Test Case:
Test zipApi
1. Verify zipApi url valid
2. Verify country data
3. Verify country abbreviation data
4. Verfiy post code
5. Verfiy place name
6. Verify longitude data
7. Verify latitude
8. Verify state
9. Verify State abbreviation

*** Settings ***
Resource  ../commons/zipApi.robot


*** Variables ***
&{testData}  zip_code=19403  country=United States  country_abbreviation=US  post_code=19403  place_name=Norristown  longitude=-75.3796  latitude=40.1496  state=Pennsylvania  state_abbreviation=PA

*** Test Cases ***
Test zipApi
    ${zipCode}=  Get From Dictionary    ${testData}    zip_code
    ${url}=  Get zipApi url  ${zipCode}

    ${isValid}=  Is zipApi url valid  ${url}
    Should Be True    ${isValid}

    ${country}=  Get country    ${url}
    ${data_country}=   Get From Dictionary    ${testData}    country
    Should Be Equal As Strings    ${country}    ${data_country}

    ${country_abbreviation}=  Get country abbreviation    ${url}
    ${data_country_abbreviation}=   Get From Dictionary    ${testData}    country_abbreviation
    Should Be Equal As Strings    ${country_abbreviation}    ${data_country_abbreviation}

    ${post_code}=  Get Post Code    ${url}
    ${data_post_code}=   Get From Dictionary    ${testData}    post_code
    Should Be Equal As Strings    ${post_code}    ${data_post_code}

    ${place_name}=  Get place name    ${url}
    ${data_place_name}=   Get From Dictionary    ${testData}    place_name
    Should Be Equal As Strings    ${place_name}    ${data_place_name}

    ${longitude}=  Get longitude    ${url}
    ${data_longitude}=   Get From Dictionary    ${testData}    longitude
    Should Be Equal As Strings    ${longitude}    ${data_longitude}

    ${latitude}=  Get latitude    ${url}
    ${data_latitude}=   Get From Dictionary    ${testData}    latitude
    Should Be Equal As Strings    ${latitude}    ${data_latitude}

    ${state}=  Get State    ${url}
    ${data_state}=   Get From Dictionary    ${testData}    state
    Should Be Equal As Strings    ${state}    ${data_state}

    ${state_abbreviation}=  Get State abbreviation    ${url}
    ${data_state_abbreviation}=   Get From Dictionary    ${testData}    state_abbreviation
    Should Be Equal As Strings    ${state_abbreviation}    ${data_state_abbreviation}

    Delete All Sessions




