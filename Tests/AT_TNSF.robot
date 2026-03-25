*** Settings ***
Resource    ../Resource/nordic_ble_keywords.resource
Library     SerialLibrary    # Add this line
Test Setup       Connect To Nordic Device
#Test Teardown    Close All Ports

*** Test Cases ***
Write Transceiver Notify Settings Flags
    [Documentation]    Checks if the device responds to a basic AT ping.
    ${response} =    Send AT Command    AT+TNSF=1
    should contain    ${response}    K
    Log To Console   Received: ${response}

Read Transceiver Notify Settings Flags
    [Documentation]    Checks if the device responds to a basic AT ping.
    ${response} =    Send AT Command    AT+TNSF?
    should contain    ${response}    1

