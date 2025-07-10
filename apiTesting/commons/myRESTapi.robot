*** Settings ***
Documentation  Common Keywords for my local REST api
Library    JSONLibrary
Library    RequestsLibrary
Library    Collections

*** Variables ***


*** Keywords ***
Get Response
    [Arguments]  ${endpoint}
    ${headers}  Get header
    ${resp}  GET  ${endpoint}  headers=${headers}
    RETURN  ${resp}

Post Response
    [Arguments]  ${endpoint}  ${body}
    ${headers}  Get header
    ${resp}  POST  ${endpoint}  headers=${headers}  data=${body}
    RETURN  ${resp}

Put Response
    [Arguments]  ${endpoint}  ${body}
    ${headers}  Get header
    ${resp}  PUT  ${endpoint}  headers=${headers}  data=${body}
    RETURN  ${resp}

Delete Response
    [Arguments]  ${endpoint}
    ${headers}  Get header
    ${resp}  DELETE  ${endpoint}  headers=${headers}
    RETURN  ${resp}

Get header
    ${HEADERS}    Create Dictionary
    Set To Dictionary     ${HEADERS}    User-Agent=PostmanRuntime/7.29.0  Content-Type=application/json  accept=*/*
    RETURN  ${HEADERS}

