//az deployment group create -f ./src/template-kv-sql.bicep --resource-group 'br-dev-appTest001-rg-kv'

targetScope = 'resourceGroup'

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

resource kv 'Microsoft.KeyVault/vaults@2021-06-01-preview' existing = {
  name: kvName
  scope: resourceGroup()
}

var adminLogin = 'sqlAdminUserLogin'
var kvName = 'br-dev-kv-appTest001-1'

var namePrefix = 'br-${environmentName}'
var nameSufix = buildNumber
var nameSqlServer = '${namePrefix}-sqlserver-${nameSufix}'

module sql 'components/sql-server.bicep' = {
  name: nameSqlServer
  
  params: {
    sqlServerName: nameSqlServer
    adminLogin: adminLogin
    location: resourceGroup().location
    tagValues:tagValues
    adminPassword: kv.getSecret('sqlAdminUserPassword')
  }
}
