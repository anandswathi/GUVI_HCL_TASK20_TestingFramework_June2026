*** Settings ***
Documentation    PAGE OBJECT for the Products (Inventory) Page.
...              This is the page displayed after a successful login.
...              It contains product listings and cart-related actions.

Library          SeleniumLibrary


*** Variables ***
# ============================================================
# Products Page Locators
# ============================================================

# Container that holds all available products
${INVENTORY_LIST}       css:.inventory_list

# Page title displayed at the top of the page
${PAGE_TITLE}           css:.title

# Shopping cart icon located in the top-right corner
${CART_LINK}            css:.shopping_cart_link

# Cart badge that displays the number of items added
${CART_BADGE}           css:.shopping_cart_badge


# ============================================================
# Product Add-To-Cart Button Locators
# ============================================================

# Add to Cart button for Sauce Labs Backpack
${BACKPACK_BUTTON}      id:add-to-cart-sauce-labs-backpack

# Add to Cart button for Sauce Labs Bike Light
${BIKELIGHT_BUTTON}     id:add-to-cart-sauce-labs-bike-light


# ============================================================
# Product Names
# ============================================================

# Product name used for validation in Cart and Checkout pages
${BACKPACK_NAME}        Sauce Labs Backpack

# Product name used for validation in Cart and Checkout pages
${BIKELIGHT_NAME}       Sauce Labs Bike Light


*** Keywords ***
Products Page Should Be Visible
    [Documentation]    Verify that the Products page is displayed
    ...                after a successful login.

    # Wait until the product list is visible
    Wait Until Element Is Visible    ${INVENTORY_LIST}    timeout=10s

    # Verify the page title is "Products"
    Element Text Should Be    ${PAGE_TITLE}    Products


Add Product To Cart
    [Documentation]    Add a product to the cart using the
    ...                provided product button locator.

    [Arguments]    ${product_button}

    # Click the selected product's Add to Cart button
    Click Button    ${product_button}


Cart Badge Should Show
    [Documentation]    Verify that the cart badge displays
    ...                the expected number of items.

    [Arguments]    ${expected_count}

    # Confirm the cart count matches the expected value
    Element Text Should Be    ${CART_BADGE}    ${expected_count}


Open Cart
    [Documentation]    Open the Shopping Cart page.

    # Click the cart icon
    Click Element    ${CART_LINK}