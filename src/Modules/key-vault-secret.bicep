param secretName string 
param secretValue string 
param kvName string
param tagValues object 

resource mysecret 'Microsoft.KeyVault/vaults/secrets@2021-06-01-preview' = {
  name: '${kvName}/${secretName}'
  tags: tagValues
  properties: {
    attributes: {
      enabled: true    
    }
    value: secretValue
  }
}
