resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'sflaunchstorage'
  location: 'eastus2'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

resource appServicePlan 'Microsoft.Web/serverFarms@2022-03-01' = {
  name: 'sf-product-launch-plan-starter'
  location: 'eastus2'
  sku: {
    name: 'F1'
  }
}

resource appServiceApp 'Microsoft.Web/sites@2022-03-01' = {
  name: 'sf-product-launch-1'
  location: 'eastus2'
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}
