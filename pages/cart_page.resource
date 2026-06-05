*** Settings ***
Documentation    PAGE OBJECT for the Cart page where added products are displayed.

Library          SeleniumLibrary


*** Variables ***
# Container that holds all products added to the cart
${CART_LIST}          css:.cart_list

# Checkout button used to proceed with the purchase
${CHECKOUT_BUTTON}    id:checkout


*** Keywords ***
Cart Page Should Be Open
    [Documentation]    Verify that the Cart page is loaded successfully.

    # Wait until the cart section becomes visible
    Wait Until Element Is Visible    ${CART_LIST}    timeout=10s


Cart Should Contain Product
    [Documentation]    Verify that the specified product is present in the cart.
    [Arguments]    ${product_name}

    # Check whether the given product name exists in the cart
    Page Should Contain Element
    ...    xpath://div[contains(@class,'inventory_item_name')][text()='${product_name}']


Proceed To Checkout
    [Documentation]    Click the Checkout button to begin the checkout process.

    # Navigate to the Checkout page
    Click Button    ${CHECKOUT_BUTTON}