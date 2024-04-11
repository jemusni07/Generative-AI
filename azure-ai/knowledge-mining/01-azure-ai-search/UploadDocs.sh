
#!/bin/bash

# Set values for your storage account
subscription_id="YOUR_SUBCRIPTION_ID"
azure_storage_account="YOUR_STORGE_ACCOUNT"
azure_storage_key="YOUR STORAGE_KEY"

echo "Creating container..."
az storage container create --account-name "$azure_storage_account" --subscription "$subscription_id" --name margies --public-access blob --auth-mode key --account-key "$azure_storage_key" --output none

echo "Uploading files..."
az storage blob upload-batch -d margies -s data --account-name "$azure_storage_account" --auth-mode key --account-key "$azure_storage_key" --output none
