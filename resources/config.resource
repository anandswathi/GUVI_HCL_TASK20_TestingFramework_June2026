*** Settings ***
Documentation    Shared configuration used across all test cases.
...              Configuration values such as URL, browser type,
...              login credentials, and checkout details are
...              loaded from config.json using the Python
...              variable file (config_reader.py).

Library          SeleniumLibrary

# Load variables from the Python file.
# This makes values like ${URL}, ${BROWSER},
# ${VALID_USERNAME}, ${FIRST_NAME}, etc. available globally.
Variables        ../utils/config_reader.py


*** Keywords ***
Open Application
    [Documentation]    Open the browser and navigate to the
    ...                Sauce Demo application.
    ...                Typically used as Test Setup.

    # Launch the browser and open the application URL
    Open Browser    ${URL}    ${BROWSER}

    # Maximize the browser window for better visibility
    Maximize Browser Window


Close Application
    [Documentation]    Close the browser after test execution.
    ...                Test Teardown.
    ...                Runs regardless of whether the test
    ...                passes or fails.

    # Close the currently active browser window
    Close Browser