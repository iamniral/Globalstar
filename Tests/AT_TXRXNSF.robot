*** Settings ***
Resource    ../Resource/nordic_ble_keywords.resource
Library     SerialLibrary    # Add this line
Test Setup       Connect To Nordic Device
#Test Teardown    Close All Ports

*** Test Cases ***
Write Transceiver Notify Settings Flags
    [Documentation]    Checks if the device responds to a basic AT ping.
    ${response} =    Send AT Command    AT+TXRXNSF?
    should contain    ${response}    1114118
    Log To Console   Received: ${response}

Read Transceiver Notify Settings Flags
    [Documentation]    Checks if the device responds to a basic AT ping.
    ${response} =    Send AT Command    AT+TXRXNSF=1114118
    should contain    ${response}    OK

