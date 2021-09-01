//az deployment group create -f ./src/template-kv-multi-secrets.bicep --resource-group 'br-dev-appTest001-rg-kv'
targetScope = 'resourceGroup'

param location string = resourceGroup().location
param userCode string
param tenantCode string
param environmentName string
param applicationName string
param createdBy string
param billingCodeArea string
param buildNumber string
param currentDate string = utcNow('yyyy-MM-dd')
param secretName string = 'sqlAdminUserPassword'
param secretValue string = 'Pa$$w0rdTest'

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

module kv 'components/key-vault.bicep' = { 
  name: '${namePrefix}-kv-${nameSufix}'  
  params: {
    namePrefix: namePrefix
    nameSufix: nameSufix    
    tagValues: tagValues
    applicationName: applicationName
    location: location
    tenantCode: tenantCode
    userCode: userCode
  }
}

module secret1 'components/key-vault-secret.bicep' = {
  name: '${namePrefix}-${secretName}' 
  params: {
    kvName: kv.outputs.kvName
    secretName: secretName
    secretValue: secretValue
    tagValues: tagValues
  }
}
