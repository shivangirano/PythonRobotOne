*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary


*** Test Cases ***
Validate Unsuccesfull Login
    Open the browser with mortage payment url
    Fill the login form
    Wait until it checks and display error message
    Verify if error message is correct


*** Keywords ***
Open the browser with mortage payment url
    create webdriver        Firefox     executable_path=C:/Users/Amit/Drivers/geckodriver
    maximize browser window
    go to   https://rahulshettyacademy.com/loginpagePractise/

Fill the login form
    input text      xpath://input[@id='username']       rahulshettyacademy
    input password      xpath://input[@id='password']       12345
    click element       //input[@id='signInBtn']

Wait until it checks and display error message
    wait until element is visible       xpath://form[@id='login-form']/div[1]

Verify if error message is correct
    element text should be      xpath://form[@id='login-form']/div[1]       Incorrect username/password.

