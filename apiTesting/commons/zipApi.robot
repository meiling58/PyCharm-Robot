*** Settings ***
Documentation  Common Keywords for US zipcode api
Library    JSONLibrary
Library    RequestsLibrary
Library    Collections


*** Variables ***
${baseURL}    https://api.zippopotam.us/us


*** Keywords ***
Is zipApi url valid
    [Documentation]  Return true when zip cose is valid, type: bool
    [Arguments]  ${url}
    ${is_zipcode_corret}  Run Keyword And Return Status    RequestsLibrary.GET    ${url}
    RETURN  ${is_zipcode_corret}

Get zipApi url
    [Documentation]  return the url, type: str
    [Arguments]  ${zipcode}
    ${url}=  Set Variable  ${baseURL}/${zipcode}
    RETURN  ${url}

Get zipApi response
    [Documentation]  return requests.models.Response, type: class
    [Arguments]  ${enpoint}
    ${resp}=  RequestsLibrary.GET    ${enpoint}
    RETURN  ${resp}

Get country
    [Documentation]  return country full name, type: str
    [Arguments]  ${enpoint}
    ${resp}  Get zipApi response  ${enpoint}
    ${country}=  Set Variable  ${resp.json()}[country]
    RETURN  ${country}

Get country abbreviation
    [Documentation]  return country full name, type: str
    [Arguments]  ${enpoint}
    ${resp}  Get zipApi response  ${enpoint}
    ${country_abbreviation}=  Set Variable  ${resp.json()}[country abbreviation]
    RETURN  ${country_abbreviation}


Get Post Code
    [Documentation]  return post code, type: str
    [Arguments]  ${enpoint}
    ${resp}  Get zipApi response  ${enpoint}
    ${post_code}=  Set Variable  ${resp.json()}[post code]
    RETURN  ${post_code}

Get Places
    [Documentation]  return places, type: dict
    [Arguments]  ${enpoint}
    ${resp}  Get zipApi response  ${enpoint}
    ${places}=  Set Variable  ${resp.json()}[places]
    ${places}=  Get From List    ${places}    0
    RETURN  ${places}

Get place name
    [Documentation]  retunr place name, type: str
    [Arguments]  ${enpoint}
    ${places}=  Get Places    ${enpoint}
    ${place_name}=  Get From Dictionary    ${places}    place name
    RETURN  ${place_name}

Get longitude
    [Documentation]  retunr longitude, type: str
    [Arguments]  ${enpoint}
    ${places}=  Get Places    ${enpoint}
    ${longitude}=  Get From Dictionary    ${places}    longitude
    RETURN  ${longitude}

Get latitude
    [Documentation]  retunr latitude, type: str
    [Arguments]  ${enpoint}
    ${places}=  Get Places    ${enpoint}
    ${latitude}=  Get From Dictionary    ${places}    latitude
    RETURN  ${latitude}

Get State
    [Documentation]  retunr state fall name, type: str
    [Arguments]  ${enpoint}
    ${places}=  Get Places    ${enpoint}
    ${state}=  Get From Dictionary    ${places}    state
    RETURN  ${state}

Get State abbreviation
    [Documentation]  retunr state fall name, type: str
    [Arguments]  ${enpoint}
    ${places}=  Get Places    ${enpoint}
    ${state_abbreviation}=  Get From Dictionary    ${places}    state abbreviation
    RETURN  ${state_abbreviation}

