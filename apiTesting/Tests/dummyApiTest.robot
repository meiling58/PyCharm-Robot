*** Comments ***
This is a dummpy api, only can verify 200 and message from response.
Cannot check the data after added/updated/deleted

*** Settings ***
Resource  ../commons/dummyApi.robot
#Suite Teardown  Delete All Sessions

*** Variables ***


*** Test Cases ***
01_Test Get all employees method
    [Tags]  all
    Testing Get all employees
    Delete All Sessions
    Sleep    2m

02_Test Get a single employee method
    [Tags]  all
    Testing Get a single employee
    Delete All Sessions
    Sleep    2m

03_Test Post method
    [Tags]  all
    ${resp}  Post a new employee
    ${status}=  Get From Dictionary    ${resp}    status
    Should Be Equal As Strings    ${status}    success
    ${message}=  Get From Dictionary    ${resp}    message
    Should Be Equal As Strings    ${message}    Successfully! Record has been added.
    Delete All Sessions
    Sleep    2m


04_Test Put method
    [Tags]  all
    ${resp}  Put an employee
    ${status}=  Get From Dictionary    ${resp}    status
    Should Be Equal As Strings    ${status}    success
    ${message}=  Get From Dictionary    ${resp}    message
    Should Be Equal As Strings    ${message}    Successfully! Record has been updated.
    Delete All Sessions
    Sleep    2m


05_Test Delete method
    [Tags]  all
    ${resp}  Delete an employee
    ${status}=  Get From Dictionary    ${resp}    status
    Should Be Equal As Strings    ${status}    success
    ${message}=  Get From Dictionary    ${resp}    message
    Should Be Equal As Strings    ${message}    Successfully! Record has been deleted
    Delete All Sessions



*** Keywords ***
Testing Get all employees
    ${response}=  Get all employees
    ${status}=  Get From Dictionary    ${response}    status
    Should Be Equal As Strings    ${status}    success
    ${all_employees}=  Get From Dictionary    ${response}  data
    ${employee_list}=  Create List
    FOR    ${element}    IN    @{all_employees}
        ${employee_name}=  Get From Dictionary    ${element}    employee_name
        Append To List    ${employee_list}  ${employee_name}
    END
    ${data1}  Set Variable  Garrett Winters
    ${data2}  Set Variable  Mei Liang
    List Should Contain Value    ${employee_list}    ${data1}
    List Should Not Contain Value    ${employee_list}    ${data2}

Testing Get a single employee
    ${id}  Set Variable  20
    ${response}=  Get a single employee    ${id}
    ${status}=  Get From Dictionary    ${response}    status
    Should Be Equal As Strings    ${status}    success
    ${message}=  Get From Dictionary    ${response}    message
    Should Be Equal As Strings    ${message}    Successfully! Record has been fetched.


