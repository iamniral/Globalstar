*** Settings ***
Library    SerialLibrary

*** Variables ***
${PORT}          COM10          # Or /dev/ttyUSB0 on Linux
${BAUD}          115200
${TERMINATOR}    \r\n

*** Keywords ***
Connect To Nordic Device
# 1. Clean up any existing port sessions first
    delete all ports
    Add Port    ${PORT}    baudrate=${BAUD}    timeout=2
    Open Port   ${PORT}
    Reset Input Buffer    ${PORT}

Send AT Command
    [Arguments]    ${command}
    Write Data     ${command}${TERMINATOR}      encoding=utf-8
    ${response} =  Read Until    ${TERMINATOR}
    RETURN         ${response}

Check BLE Device Status
    ${output} =    Send AT Command    AT+ABC?   # Replace with your actual status command
    Should Contain    ${output}    OK