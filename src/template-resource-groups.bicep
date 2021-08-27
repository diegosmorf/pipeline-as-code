//az deployment sub create -f .\src\template-resource-groups.bicep -l eastus -p .\src\parameters-resource-groups.json
targetScope = 'subscription'

param environmentName string
param applicationName string
param createdBy string
param billingCodeArea string 
param buildNumber string
param currentDate string = utcNow('yyyy-MM-dd')

param tagValues object = {  
  ApplicationName: applicationName
  Environment: environmentName
  CreatedBy: createdBy
  DeploymentDate: currentDate
  BillingCodeArea: billingCodeArea
  BuildNumber: buildNumber
}

var namePrefix = 'br-${environmentName}-${applicationName}'

resource rsVm 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: '${namePrefix}-rg-vm'
  location: deployment().location
  tags: tagValues
}

resource rsAppService 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: '${namePrefix}-rg-appservice'
  location: deployment().location
  tags: tagValues
}

resource rsKV 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: '${namePrefix}-rg-kv'
  location: deployment().location
  tags: tagValues
}
