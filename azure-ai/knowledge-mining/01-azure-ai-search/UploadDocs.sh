
#!/bin/bash

# Set values for your storage account
subscription_id="d140cb52-21fe-4b1b-a7ab-1a6586adbdf4"
azure_storage_account="jonathanaistorage"
azure_storage_key="Ipm3EINcZZUWBNIeDgdYWAn3DMoZBA/aF/LAROXPALz/u0pWEctg+uE9M5/g3JFunAEHjPMUMAfa+AStcGN/PQ=="

echo "Creating container..."
az storage container create --account-name "$azure_storage_account" --subscription "$subscription_id" --name margies --public-access blob --auth-mode key --account-key "$azure_storage_key" --output none

echo "Uploading files..."
az storage blob upload-batch -d margies -s data --account-name "$azure_storage_account" --auth-mode key --account-key "$azure_storage_key" --output none
