# Fundamentals of Bicep - Training

https://learn.microsoft.com/en-us/training/paths/fundamentals-bicep/

## Azure CLI configuration:

````bash
az bicep install && az bicep upgrade
az login
az account set --subscription "Subscription ID"
az configure --defaults group="Group-name"
````

## Templates execution:

Exercise 1:

````bash
az deployment group create --template-file main.bicep
az deployment group list --output table
````

In this scenario, the storage account and the App Service app names have a hard-coded default value. This two resources need globally unique names (set the resources names, instead of the hard-coded value).

Exercises 2 and 3 (with parameter for EnvironmentType: prod or nonprod):

````bash
az deployment group create \
  --template-file main.bicep \
  --parameters environmentType=nonprod
````