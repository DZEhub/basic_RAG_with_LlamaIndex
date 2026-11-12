#!/bin/bash
# Script to build a virtual environment for the LlamaIndex demo with required dependencies

# Set custom virtual environment name
VENV_CUSTOM_NAME=".venv"

# ===========================================================================
# Create virtual environment on Linux if it doesn't exist
# ===========================================================================
if [ ! -d "$VENV_CUSTOM_NAME" ]; then
    python -m venv $VENV_CUSTOM_NAME
fi


# ===========================================================================
# Activate virtual environment
# ===========================================================================
source ./$VENV_CUSTOM_NAME/bin/activate


# ===========================================================================
# upgrade pip before installing dependencies
# ===========================================================================
#  .llamaindex_venv\Scripts\python.exe -m pip install --upgrade pip ipykernel  
"$VENV_CUSTOM_NAME/bin/python3" -m pip install --upgrade pip  

# Install required dependencies
"$VENV_CUSTOM_NAME/bin/python3" -m pip install --upgrade -r requirements.txt

# Verify installation
"$VENV_CUSTOM_NAME/bin/python3" -m pip list


# ===========================================================================
# DEACTIVATE your virtual environment: deactivate
# ===========================================================================
# deactivate


# ===========================================================================
# DELETE/REMOVE your virtual environment: rm -r -fo ./$VENV_CUSTOM_NAME
# ===========================================================================
# # uncomment the following line if you want to delete the virtual environment
# # rm -r -fo $VENV_CUSTOM_NAME
# rm -r -fo ./$VENV_CUSTOM_NAME