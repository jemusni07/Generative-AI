#!/bin/bash

# Set values for your Search service
url="YOUR_SEARCH_URL"
admin_key="YOUR_ADMIN_KEY"
directory="./your_absolute_directory_path"

echo "-----"
echo "Updating the skillset..."
skillset=$(cat "$directory/skillset.json")
curl -X PUT "$url/skillsets/margies-skillset?api-version=2020-06-30" -H "Content-Type: application/json" -H "api-key: $admin_key" -d "$skillset"
# wait
sleep 2

echo "-----"
echo "Updating the index..."
index=$(cat "$directory/index.json")
curl -X PUT "$url/indexes/margies-index?api-version=2020-06-30" -H "Content-Type: application/json" -H "api-key: $admin_key" -d "$index"

# wait
sleep 2

echo "-----"
echo "Updating the indexer..."
indexer=$(cat "$directory/indexer.json")
curl -X PUT "$url/indexers/margies-indexer?api-version=2020-06-30" -H "Content-Type: application/json" -H "api-key: $admin_key" -d "$indexer"

echo "-----"
echo "Resetting the indexer"
curl -X POST "$url/indexers/margies-indexer/reset?api-version=2020-06-30" -H "Content-Type: application/json" -H "Content-Length: 0" -H "api-key: $admin_key" 

# wait
sleep 5

echo "-----"
echo "Rerunning the indexer"
curl -X POST "$url/indexers/margies-indexer/run?api-version=2020-06-30" -H "Content-Type: application/json" -H "Content-Length: 0" -H "api-key: $admin_key"
