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

Exercise 1:

````bash
az deployment group create --template-file main.bicep
az deployment group list --output table
````

In this scenario, the storage account and the App Service app names have a hard-coded default value. This two resources need globally unique names: set the resources names, instead of the hard-coded value.

Exercises 2 and 3:

````bash
az deployment group create \
  --template-file main.bicep \
  --parameters environmentType=nonprod
````

With parameter for EnvironmentType: prod or nonprod.

Exercise 4:

````bash
az deployment group create --template-file main.bicep
````

You don't need to specify the parameter values because they have default values specified.

Exercise 5:

````bash
az deployment group create --template-file main.bicep --parameters main.parameters.dev.json
````

In the terminal, execute the commands to create the keyVaultName, login, and password variables; the key vault and secrets.
In main.parameters.dev.josn replace the keyVault id.
 