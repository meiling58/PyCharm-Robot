*** Settings ***
Resource  ../commons/googlePage.robot


*** Test Cases ***
Test open google with different webdrivers
    Open google with chrome
    Open google with edge
    Open google with firefox
    Close All Browsers