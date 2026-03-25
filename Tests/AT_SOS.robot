*** Settings ***
Resource    ../Resource/nordic_ble_keywords.resource
Library     SerialLibrary    # Add this line
Test Setup       Connect To Nordic Device
#Test Teardown    Close All Ports

*** Test Cases ***
Write SOS command
    [Documentation]    Checks if the device responds to a basic AT ping.
    ${response} =    Send AT Command    AT+SOS=1
    should contain    ${response}    OK
    Log To Console   Received: ${response}

Read SOS command
    [Documentation]    Checks if the device responds to a basic AT ping.
    ${response} =    Send AT Command    AT+SOS?
    should contain    ${response}    1

