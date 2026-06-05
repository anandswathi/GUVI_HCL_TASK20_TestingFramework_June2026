"""
config_reader.py

This file acts as a Robot Framework Variable File.
"""

import json
import os


# ============================================================
# Locate config.json
# ============================================================

# Get the absolute path of the current directory (utils folder)
_THIS_DIR = os.path.dirname(os.path.abspath(__file__))

# Build the full path to config.json
_CONFIG_PATH = os.path.join(_THIS_DIR, "..", "config.json")


# ============================================================
# Robot Framework Variable Loader
# ============================================================

def get_variables():
    """
    Read data from config.json and expose it as Robot Framework variables.
    """

    # Open and read the JSON configuration file
    with open(_CONFIG_PATH, encoding="utf-8") as config_file:
        config = json.load(config_file)

    # Return configuration values as Robot variables
    return {
        "URL": config["url"],
        "BROWSER": config["browser"],

        # Valid login credentials
        "VALID_USERNAME": config["valid_username"],
        "VALID_PASSWORD": config["valid_password"],

        # Invalid login credentials
        "INVALID_USERNAME": config["invalid_username"],
        "INVALID_PASSWORD": config["invalid_password"],

        # Checkout customer information
        "FIRST_NAME": config["first_name"],
        "LAST_NAME": config["last_name"],
        "POSTAL_CODE": config["postal_code"],
    }