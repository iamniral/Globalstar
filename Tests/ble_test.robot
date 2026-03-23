*** Settings ***
Resource    ../Resource/nordic_ble_keywords.resource
Library     SerialLibrary    # Add this line
Test Setup       Connect To Nordic Device
#Test Teardown    Close All Ports

*** Test Cases ***
Verify Nordic Device set Initialization
    [Documentation]    Checks if the device responds to a basic AT ping.
    ${response} =    Send AT Command    AT+SOS=1
#    should contain    ${response}    0

Verify Nordic Device Initialization
    [Documentation]    Checks if the device responds to a basic AT ping.
    ${response} =    Send AT Command    AT+SOS?
    should contain    ${response}    0

#Configure BLE Advertising Name
#    [Documentation]    Sets the device name and verifies success.
#    ${response} =    Send AT Command    AT+NAME=Robot_BLE
#    Should Contain   ${response}    OK

#    # Optional: Verify by reading it back
#    ${name_check} =  Send AT Command    AT+NAME?
#    Should Contain   ${name_check}    Robot_BLE


# New branch
