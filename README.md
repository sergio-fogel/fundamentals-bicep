# Fundamentals of Bicep - Training

https://learn.microsoft.com/en-us/training/paths/fundamentals-bicep/

## Azure CLI configuration:

````bash
az bicep install && az bicep upgrade
az login
az account set --subscription "Subscription Name"
az configure --defaults group="resource group name"
````

## Create a key vault and secrets:

````bash
keyVaultName='YOUR-KEY-VAULT-NAME'
read -s -p "Enter the login name: " login
read -s -p "Enter the password: " password

az keyvault create --name $keyVaultName --location eastus --enabled-for-template-deployment true
az keyvault secret set --vault-name $keyVaultName --name "sqlServerAdministratorLogin" --value $login --output none
az keyvault secret set --vault-name $keyVaultName --name "sqlServerAdministratorPassword" --value $password --output none

#Get the key vault's resource ID
az keyvault show --name $keyVaultName --query id --output tsv
````

## Templates deployment:

````bash
az deployment group create --template-file main.bicep
az deployment group list --output table
````

If you have to specify or override one parameter:

````bash
az deployment group create \
  --template-file main.bicep \
  --parameters environmentType=nonprod
````

If you have to deploy with a parameters file:

````bash
az deployment group create \
  --template-file main.bicep \
  --parameters main.parameters.dev.json
````
