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

module appPlanDeploy 'Modules/appPlan.bicep' = {
  name: '${namePrefix}-app-plan-${nameSufix}'
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
  name: '${namePrefix}-app-service-${site.name}-${nameSufix}'
  scope: resourceGroup
  params:{
    namePrefix: '${namePrefix}-${site.name}'
    appPlanId: appPlanDeploy.outputs.planId
    dockerImage: 'nginxdemos/hello'
    dockerImageTag: site.tag    
    tagValues: tagValues
  }
}]
