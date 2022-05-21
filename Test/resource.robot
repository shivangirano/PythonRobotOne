*** Settings ***
Documentation       This resource file is for reusing the code
Library     SeleniumLibrary


*** Variables ***
${userName}         rahulshettyacademy
${invalidPassword}          12345


*** Keywords ***
Open the browser with mortage payment url
    create webdriver        Firefox     executable_path=C:/Users/Amit/Drivers/geckodriver
    maximize browser window
    go to   https://rahulshettyacademy.com/loginpagePractise/

Close the browser session
    Close Browser