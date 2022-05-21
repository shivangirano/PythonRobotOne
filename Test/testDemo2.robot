*** Settings ***
Documentation   To validate the Login form
Test Setup      Open the browser with mortage payment url
Library     SeleniumLibrary
Test Teardown       Close the browser session
Resource        resource.robot

*** Variables ***
${invalid_error_message_loacator}       xpath://form[@id='login-form']/div[1]


*** Test Cases ***
Validate Unsuccesfull Login
    # Open the browser with mortage payment url
    Fill the login form
    Wait until it checks and display error message
    Verify if error message is correct


*** Keywords ***

Fill the login form
    input text      xpath://input[@id='username']       ${userName}
    input password      xpath://input[@id='password']       ${invalidPassword}
    click element       //input[@id='signInBtn']

Wait until it checks and display error message
    wait until element is visible       ${invalid_error_message_loacator}

Verify if error message is correct
    element text should be      ${invalid_error_message_loacator}       Incorrect username/password.

