targetScope = 'subscription'

param environmentName string
param applicationName string
param createdBy string
param billingCodeArea string
param buildNumber string = '001'
param vmUserName string
param vmUserPass string
param currentDate string = utcNow('yyyy-MM-dd')


param tagValues object = {  
  Environment: environmentName
  CreatedBy: createdBy
  DeploymentDate: currentDate
  BillingCodeArea: billingCodeArea
  BuildNumber: buildNumber
}

var namePrefix = 'br-${environmentName}'
var nameSufix = buildNumber

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: '${namePrefix}-rg-${nameSufix}'
  location: deployment().location
  tags: tagValues
}

module vnet 'Modules/vnet-generic.bicep'  = {
  name: '${namePrefix}-vnet-${nameSufix}'
  scope: resourceGroup
  params: {
    namePrefix: namePrefix
    nameSufix: nameSufix    
  }
}

module nic 'Modules/vm-small-nic.bicep' = {
  name: '${namePrefix}-vnet-${nameSufix}-nic'
  scope: resourceGroup
  params: {
    namePrefix: namePrefix
    nameSufix: nameSufix
    subnetId: vnet.outputs.subnetId
  }
}

module vmLinux 'Modules/vm-small.bicep'  = {
  name: '${namePrefix}-vm-${nameSufix}'
  scope: resourceGroup
  params: {
    namePrefix: namePrefix
    nameSufix:nameSufix    
    subnetId: vnet.outputs.subnetId
    nicId: nic.outputs.nicId
    username: vmUserName
    password: vmUserPass
  }
}
