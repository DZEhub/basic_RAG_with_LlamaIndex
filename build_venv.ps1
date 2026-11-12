# Script to build a virtual environment for the LlamaIndex demo with required dependencies

# Set custom virtual environment name
$env:VENV_CUSTOM_NAME=".venv"

# ===========================================================================
# Create virtual environment on Windows if it doesn't exist
# ===========================================================================
if (-not (Test-Path $env:VENV_CUSTOM_NAME)) {
    python -m venv $env:VENV_CUSTOM_NAME
}


# ===========================================================================
# Activate virtual environment
# ===========================================================================
# .\.venv\Scripts\Activate.ps1
& ".\$env:VENV_CUSTOM_NAME\Scripts\Activate.ps1"


# ===========================================================================
# upgrade pip before installing dependencies
# ===========================================================================
#  .llamaindex_venv\Scripts\python.exe -m pip install --upgrade pip ipykernel  
& "$env:VENV_CUSTOM_NAME\Scripts\python.exe" -m pip install --upgrade pip  

# Install required dependencies
& "$env:VENV_CUSTOM_NAME\Scripts\python.exe" -m pip install --upgrade -r requirements.txt

# Verify installation
& "$env:VENV_CUSTOM_NAME\Scripts\python.exe" -m pip list


# ===========================================================================
# DEACTIVATE your virtual environment: deactivate
# ===========================================================================
# deactivate


# ===========================================================================
# DELETE/REMOVE your virtual environment: rm -r -fo .\$env:VENV_CUSTOM_NAME\
# ===========================================================================
# # uncomment the following line if you want to delete the virtual environment
# # rm -r -fo $env:VENV_CUSTOM_NAME
# # Remove-Item -Recurse -Force $env:VENV_CUSTOM_NAME
# # rm -Recurse -Force $env:VENV_CUSTOM_NAME
# rm -r -fo .\$env:VENV_CUSTOM_NAME\