//az deployment sub create -f .\src\template-appservice-single.bicep -l eastus -p .\src\parameters-appservice.json
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

var namePrefix = 'br-${environmentName}-${applicationName}'
var nameSufix = buildNumber

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: '${namePrefix}-rg-appservice'
  location: deployment().location
  tags: tagValues
}

module appPlanDeploy 'components/appPlan.bicep' = {
  name: '${namePrefix}-appplan-${nameSufix}'
  scope: resourceGroup
  params:{
    namePrefix: namePrefix
    nameSufix: nameSufix
    tagValues: tagValues
  }
}

module siteDeploy 'components/appservice.bicep' = {
  name: '${namePrefix}-appservice-${nameSufix}'
  scope: resourceGroup
  params:{
    appserviceName: '${namePrefix}-appservice-${nameSufix}'
    appPlanId: appPlanDeploy.outputs.planId
    dockerImage: 'nginxdemos/hello'
    dockerImageTag: 'plain-text'   
    tagValues: tagValues
  }
}
