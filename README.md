# Fundamentals of Bicep - Training

https://learn.microsoft.com/en-us/training/paths/fundamentals-bicep/

## Azure CLI configuration:

````bash
az bicep install && az bicep upgrade
az login
az account set --subscription "Subscription Name"
az configure --defaults group="resource group name"
````

## Templates deployment:

Exercise 1:

````bash
az deployment group create --template-file main.bicep
az deployment group list --output table
````

In this scenario, the storage account and the App Service app names have a hard-coded default value. This two resources need globally unique names (set the resources names, instead of the hard-coded value).

Exercises 2 and 3 (With parameter for EnvironmentType: prod or nonprod):

````bash
az deployment group create \
  --template-file main.bicep \
  --parameters environmentType=nonprod
````

Exercise 4 (You don't need to specify the parameter values because they have default values specified):

````bash
az deployment group create --template-file main.bicep
````
