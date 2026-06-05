*** Settings ***
Documentation    Sauce Demo Automation Test Suite (Task 20)
...              Built using the Page Object Model (POM) design pattern.
...
...              This file contains NO locators.
...              It only calls reusable keywords from page objects,
...              making the test cases easy to read and maintain.
...
...              Test Cases Covered:
...              1. Valid Login
...              2. Invalid Login
...              3. Add Single Product to Cart
...              4. Multiple Product Checkout Verification

# ============================================================
# Resource Files
# ============================================================

# Shared configuration (URL, browser, credentials, test data)
Resource    ../resources/config.resource

# Page Objects
Resource    ../pages/login_page.resource
Resource    ../pages/products_page.resource
Resource    ../pages/cart_page.resource
Resource    ../pages/checkout_page.resource


# ============================================================
# Test Execution Settings
# ============================================================

# Launch browser before every test case
Test Setup       Open Application

# Close browser after every test case
Test Teardown    Close Application


*** Test Cases ***
TC1 - Valid Login Lands On Products Page
    [Documentation]    Verify that a user can successfully log in
    ...                using valid credentials and reach the
    ...                Products page.

    # Verify Login page is loaded
    Login Page Should Be Open

    # Login with valid credentials
    Login With Valid Credentials

    # Verify Products page is displayed
    Products Page Should Be Visible


TC2 - Invalid Login Shows Error Message
    [Documentation]    Verify that an appropriate error message
    ...                is displayed when invalid credentials
    ...                are used.

    # Verify Login page is loaded
    Login Page Should Be Open

    # Attempt login with invalid credentials
    Login With Credentials    ${INVALID_USERNAME}    ${INVALID_PASSWORD}

    # Verify login error message appears
    Login Error Should Be Visible


TC3 - Add Single Product To Cart
    [Documentation]    Verify that a user can add a product
    ...                to the cart and view it successfully.

    # Login to the application
    Login With Valid Credentials

    # Verify Products page is displayed
    Products Page Should Be Visible

    # Add Backpack product to cart
    Add Product To Cart    ${BACKPACK_BUTTON}

    # Verify cart badge count
    Cart Badge Should Show    1

    # Open cart page
    Open Cart

    # Verify cart page is displayed
    Cart Page Should Be Open

    # Verify Backpack product is present
    Cart Should Contain Product    ${BACKPACK_NAME}


TC4 - Add Multiple Products And Verify Checkout Summary
    [Documentation]    Verify that multiple products can be added
    ...                to the cart and correctly displayed
    ...                during checkout.

    # Login to the application
    Login With Valid Credentials

    # Verify Products page is displayed
    Products Page Should Be Visible

    # Add Backpack product
    Add Product To Cart    ${BACKPACK_BUTTON}

    # Add Bike Light product
    Add Product To Cart    ${BIKELIGHT_BUTTON}

    # Verify cart badge count
    Cart Badge Should Show    2

    # Open cart page
    Open Cart

    # Verify Cart page is loaded
    Cart Page Should Be Open

    # Verify both products are listed
    Cart Should Contain Product    ${BACKPACK_NAME}
    Cart Should Contain Product    ${BIKELIGHT_NAME}

    # Proceed to Checkout
    Proceed To Checkout

    # Enter customer information
    Fill Customer Information

    # Verify products appear in checkout summary
    Checkout Summary Should Contain Product    ${BACKPACK_NAME}
    Checkout Summary Should Contain Product    ${BIKELIGHT_NAME}

    # Verify total number of products
    Checkout Item Count Should Be    2

    # Verify quantity for Backpack
    Summary Quantity For Product Should Be    ${BACKPACK_NAME}    1

    # Verify quantity for Bike Light
    Summary Quantity For Product Should Be    ${BIKELIGHT_NAME}    1