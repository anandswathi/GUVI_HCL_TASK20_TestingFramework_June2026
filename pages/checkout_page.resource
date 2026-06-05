*** Settings ***
Documentation    PAGE OBJECT for the Checkout process.
...              Handles both:
...              1. Customer Information Form
...              2. Checkout Overview / Order Summary Page

Library          SeleniumLibrary
Resource         ../resources/config.resource


*** Variables ***
# ============================================================
# Customer Information Form Locators
# ============================================================

${FIRST_NAME_INPUT}     id:first-name
${LAST_NAME_INPUT}      id:last-name
${POSTAL_CODE_INPUT}    id:postal-code
${CONTINUE_BUTTON}      id:continue


# ============================================================
# Checkout Overview / Summary Page Locators
# ============================================================

# Summary section displayed after clicking Continue
${SUMMARY_INFO}         css:.summary_info

# Represents a single product row in the checkout summary
${CART_ITEM}            css:.cart_item


*** Keywords ***
Fill Customer Information
    [Documentation]    Enter customer details and navigate to the
    ...                Checkout Overview page.

    # Wait until the checkout form is loaded
    Wait Until Element Is Visible    ${FIRST_NAME_INPUT}    timeout=10s

    # Enter customer details
    Input Text    ${FIRST_NAME_INPUT}     ${FIRST_NAME}
    Input Text    ${LAST_NAME_INPUT}      ${LAST_NAME}
    Input Text    ${POSTAL_CODE_INPUT}    ${POSTAL_CODE}

    # Click Continue to proceed to the summary page
    Click Button    ${CONTINUE_BUTTON}

    # Verify that the summary page is displayed
    Wait Until Element Is Visible    ${SUMMARY_INFO}    timeout=10s


Checkout Summary Should Contain Product
    [Documentation]    Verify that the specified product appears
    ...                in the checkout summary.

    [Arguments]    ${product_name}

    # Check whether the product exists in the summary page
    Page Should Contain Element
    ...    xpath://div[contains(@class,'inventory_item_name')][text()='${product_name}']


Checkout Item Count Should Be
    [Documentation]    Verify the total number of products listed
    ...                in the checkout summary.

    [Arguments]    ${expected_count}

    # Count all products displayed in the summary
    ${actual_count}=    Get Element Count    ${CART_ITEM}

    # Compare actual count with expected count
    Should Be Equal As Integers    ${actual_count}    ${expected_count}


Summary Quantity For Product Should Be
    [Documentation]    Verify the quantity displayed for a specific product.
    ...                Sauce Demo always displays quantity as 1.

    [Arguments]    ${product_name}    ${expected_quantity}

    # Locate the product row and verify its quantity
    Element Text Should Be
    ...    xpath://div[contains(@class,'cart_item')][.//div[text()='${product_name}']]//div[contains(@class,'cart_quantity')]
    ...    ${expected_quantity}