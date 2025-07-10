*** Comments ***
Dummy REST Api: https://dummy.restapiexample.com/
Type: JSON
baseURL: https://dummy.restapiexample.com/api/v1/
GET all employees: {baseURL}/employees
GET a single: {baseURL}/employee/{id}
POST (create) a new record: {baseURL}/create
https://dummy.restapiexample.com/api/v1/create
PUT (update) an employee record
DELETE (delete) an employee record

*** Settings ***
Documentation  Common Keywords for Dummy REST api
Resource  myRESTapi.robot


*** Variables ***
${baseURL}    https://dummy.restapiexample.com/api/v1/
${endpoint}  https://dummy.restapiexample.com/api/v1/employee/1


*** Keywords ***
Get a single employee
    [Documentation]  Return a response with json format, type:dict
    [Arguments]  ${id}
    ${endpoint}  Set Variable  ${baseURL}employee/${id}
    ${response}=  Get Response    ${endpoint}
    Status Should Be    200
    ${response_json}=  Set Variable    ${response.json()}
    RETURN  ${response_json}

Get all employees
    [Documentation]  Return trun a respone with json foromat, type:dict
    ${endpoint}  Set Variable  ${baseURL}employees
    ${response}=  Get Response    ${endpoint}
    Status Should Be    200
    ${response_json}=  Set Variable    ${response.json()}
    RETURN  ${response_json}

Get all employees data
    [Documentation]  Return the all employees data, type:list
    ${content}=  Get all employees
    ${data}=  Get From Dictionary    ${content}  data
    RETURN  ${data}

Get employees list
    [Documentation]  Return a list of empolyees, type: list
    ${all_employees}=  Get all employees data
    ${employee_list}=  Create List
    FOR    ${element}    IN    @{all_employees}
        ${employee_name}=  Get From Dictionary    ${element}    employee_name
        Append To List    ${employee_list}  ${employee_name}
    END
    RETURN  ${employee_list}

Get id list
    [Documentation]  Return a list of empolyees, type: list
    ${all_employees}=  Get all employees data
    ${id_list}=  Create List
    FOR    ${element}    IN    @{all_employees}
        ${id}=  Get From Dictionary    ${element}    id
        ${type}=  Evaluate    type($id)
        Append To List    ${id_list}  ${id}
    END
    RETURN  ${id_list}

Get the name by id
    [Documentation]  Return the name by id, type: str
    [Arguments]  ${id}
    ${all_employees}=  Get all employees data
    ${name}=  Set Variable  ${None}
    FOR    ${element}    IN    @{all_employees}
        ${tid}=  Get From Dictionary    ${element}    id
        Convert To String    ${tid}
        IF    '${tid}' == '${id}'
             ${name}=  Get From Dictionary    ${element}    employee_name
        END
    END
    RETURN  ${name}

Get the id by name
    [Documentation]  Return the id by name, type: str
    [Arguments]  ${name}
    ${all_employees}=  Get all employees data
    ${id}=  Set Variable  ${None}
    FOR    ${element}    IN    @{all_employees}
        ${tname}=  Get From Dictionary    ${element}    employee_name
        IF    '${tname}' == '${name}'
             ${id}=  Get From Dictionary    ${element}    id
             Convert To String    ${id}
        END
    END
    RETURN  ${id}

Post a new employee
    [Documentation]  Return the response when employee created, type: dict/json format
    ${endpoint}   Set Variable  ${baseURL}create
    ${body}  Create Dictionary
    Set To Dictionary    ${body}  name=test  salary=123  age=23
    ${resp}  Post Response  ${endpoint}  ${body}
    Status Should Be    200
    ${response_json}=  Set Variable  ${resp.json()}
    RETURN  ${response_json}

Put an employee
    [Documentation]  Return the response when employee updated, type: dict/json format
    ${endpoint}   Set Variable  ${baseURL}update/21
    ${body}  Create Dictionary
    Set To Dictionary    ${body}  name=test  salary=123  age=23
    ${resp}  Put Response  ${endpoint}  ${body}
    Status Should Be    200
    ${response_json}=  Set Variable  ${resp.json()}
    RETURN  ${response_json}

Delete an employee
    [Documentation]  Return the response when employee deleted, type: dict/json format
    ${endpoint}   Set Variable  ${baseURL}delete/719
    ${resp}  Delete Response  ${endpoint}
    Status Should Be    200
    ${response_json}=  Set Variable  ${resp.json()}
    RETURN  ${response_json}
