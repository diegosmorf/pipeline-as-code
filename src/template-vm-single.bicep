//az deployment sub create -f ./src/template-vm-single.bicep -l eastus
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
  ApplicationName: applicationName
  Environment: environmentName
  CreatedBy: createdBy
  DeploymentDate: currentDate
  BillingCodeArea: billingCodeArea
  BuildNumber: buildNumber
}

var namePrefix = 'br-${environmentName}-${applicationName}'
var nameSufix = buildNumber

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: '${namePrefix}-rg-vm'
  location: deployment().location
  tags: tagValues
}

module vnet 'components/vm-vnet.bicep'  = {
  name: '${namePrefix}-vnet-${nameSufix}'
  scope: resourceGroup
  params: {
    namePrefix: namePrefix
    nameSufix: nameSufix    
    tagValues: tagValues
  }
}

module nic 'components/vm-nic.bicep' = {
  name: '${namePrefix}-nic-${nameSufix}'
  scope: resourceGroup
  params: {
    namePrefix: namePrefix
    nameSufix: nameSufix
    subnetId: vnet.outputs.subnetId
    tagValues: tagValues
  }
}

module vmLinux 'components/vm.bicep'  = {
  name: '${namePrefix}-vm-${nameSufix}'
  scope: resourceGroup
  params: {
    namePrefix: namePrefix
    nameSufix:nameSufix        
    nicId: nic.outputs.nicId
    username: vmUserName
    password: vmUserPass
    tagValues: tagValues
  }
}
