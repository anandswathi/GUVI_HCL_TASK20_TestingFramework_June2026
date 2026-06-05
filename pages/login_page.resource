*** Settings ***
Documentation    PAGE OBJECT for the Sauce Demo Login Page.
...              Contains all locators and reusable actions related
...              to the login functionality.

Library          SeleniumLibrary
Resource         ../resources/config.resource


*** Variables ***
# ============================================================
# Login Page Locators
# ============================================================

# Username input field
${USERNAME_INPUT}       id:user-name

# Password input field
${PASSWORD_INPUT}       id:password

# Login button
${LOGIN_BUTTON}         id:login-button

# Error message displayed for invalid login attempts
${ERROR_MESSAGE}        css:h3[data-test="error"]


*** Keywords ***
Login Page Should Be Open
    [Documentation]    Verify that the Login page is loaded successfully.

    # Wait until the username field becomes visible
    Wait Until Element Is Visible    ${USERNAME_INPUT}    timeout=10s


Enter Username
    [Documentation]    Enter the username into the Username field.

    [Arguments]    ${username}

    # Type the username
    Input Text    ${USERNAME_INPUT}    ${username}


Enter Password
    [Documentation]    Enter the password into the Password field.

    [Arguments]    ${password}

    # Type the password securely
    Input Password    ${PASSWORD_INPUT}    ${password}


Click Login Button
    [Documentation]    Click the Login button to submit the login form.

    # Submit the login form
    Click Button    ${LOGIN_BUTTON}


Login With Credentials
    [Documentation]    Perform login using the provided username
    ...                and password.

    [Arguments]    ${username}    ${password}

    # Enter login details
    Enter Username    ${username}
    Enter Password    ${password}

    # Submit login form
    Click Login Button


Login With Valid Credentials
    [Documentation]    Log in using the valid credentials
    ...                stored in the configuration file.

    # Use reusable credentials from config.resource
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}


Login Error Should Be Visible
    [Documentation]    Verify that an error message appears after
    ...                an unsuccessful login attempt.

    # Wait for the error message to appear
    Wait Until Element Is Visible    ${ERROR_MESSAGE}    timeout=10s

    # Verify the expected error text is displayed
    Element Should Contain    ${ERROR_MESSAGE}    Epic sadface