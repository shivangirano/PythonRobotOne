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
    Fill the login form     ${userName}     ${invalidPassword}
    Wait until it checks and display error message
    Verify if error message is correct

Valiadte cards displayed on the shopping page
    Fill the login form     ${userName}     ${validPassword}


*** Keywords ***

Fill the login form
    [arguments]     ${user_name}    ${user_password}
    input text      xpath://input[@id='username']       ${user_name}
    input password      xpath://input[@id='password']       ${user_password}
    click element       //input[@id='signInBtn']

Wait until it checks and display error message
    wait until element is visible       ${invalid_error_message_loacator}

Verify if error message is correct
    element text should be      ${invalid_error_message_loacator}       Incorrect username/password.

