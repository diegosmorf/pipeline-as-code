param namePrefix string
param nameSufix string
param applicationName string
param location string 
param userCode string 
param tenantCode string
param tagValues object 

var name = '${namePrefix}-kv-${applicationName}-${nameSufix}'

resource kv 'Microsoft.KeyVault/vaults@2021-06-01-preview' = {
  name: name
  location: location  
  tags: tagValues
  properties: {    
    sku: {
      family: 'A'
      name: 'standard'
    }    
    tenantId: tenantCode
    enabledForTemplateDeployment:true
    enableSoftDelete:true
    publicNetworkAccess: 'enabled'
    accessPolicies: [
      {
        permissions: {
          secrets: [
              'get'
              'list'
          ]
        }
        objectId: userCode
        tenantId: tenantCode        
      }
    ]
  }
}

output kvName string = kv.name
