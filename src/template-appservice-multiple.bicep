//az deployment sub create -f .\src\template-appservice-multiple.bicep -l eastus -p .\src\parameters-appservice.json
targetScope = 'subscription'

param environmentName string
param applicationName string 
param createdBy string
param billingCodeArea string
param buildNumber string = '001'
param currentDate string = utcNow('yyyy-MM-dd')

param tagValues object = {  
  ApplicationName: applicationName
  Environment: environmentName
  CreatedBy: createdBy
  DeploymentDate: currentDate
  BillingCodeArea: billingCodeArea
  BuildNumber: buildNumber
}

var namePrefix = 'br-${environmentName}'
var nameSufix = buildNumber

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: '${namePrefix}-rg-appservice'
  location: deployment().location
  tags: tagValues
}

module appPlanDeploy 'Modules/appPlan.bicep' = {
  name: '${namePrefix}-appplan-${applicationName}-${nameSufix}'
  scope: resourceGroup
  params:{
    namePrefix: namePrefix
    nameSufix: nameSufix
    tagValues: tagValues
  }
}

var websites = [
  {
    name:'fancy'
    tag:'latest'
  }
  {
    name:'plain'
    tag:'plain-text'
  }
]

module siteDeploy 'Modules/appservice.bicep' = [ for site in websites:{
  name: 'app-service-${site.name}'
  scope: resourceGroup
  params:{
    appserviceName: '${namePrefix}-app-service-${applicationName}-${site.name}'
    appPlanId: appPlanDeploy.outputs.planId
    dockerImage: 'nginxdemos/hello'
    dockerImageTag: site.tag    
    tagValues: tagValues
  }
}]
