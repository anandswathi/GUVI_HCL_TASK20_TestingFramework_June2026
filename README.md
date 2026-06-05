# GUVI_HCL_TASK20_TestingFramework_June2026
GUVI HCL TASK 20 - Testing Framework

The current repository contains python codes to the questions mentioned in HCL GUVI Python Task 20 - https://docs.google.com/document/d/1GTOnRc01Nx7GaYepguDeU4L5xe3aMNENPIo_Ek7l_5E/edit?tab=t.0

X-------------------------------------------------------------------------------------------------------------------------------------------------X

======================================================================================================================
                                    Project Structure (Page Object Model - POM)
======================================================================================================================

saucedemo-pom/
├── config.json                  # all constants (URL, credentials, checkout info)
├── requirements.txt
├── utils/
│   └── config_reader.py         # reads config.json -> Robot variables
├── resources/
│   └── config.resource          # loads the variable file + browser open/close
├── pages/
│   ├── login_page.resource      # the LOGIN page
│   ├── products_page.resource   # the PRODUCTS (inventory) page
│   ├── cart_page.resource       # the CART page
│   └── checkout_page.resource   # the CHECKOUT form + summary
└── tests/
    └── saucedemo_tests.robot    # the 4 test cases 

