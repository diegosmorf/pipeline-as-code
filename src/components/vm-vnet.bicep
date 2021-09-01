param namePrefix string 
param nameSufix string
param location string = resourceGroup().location
param addressPrefix string = '10.0.0.0/24'
param tagValues object

var name = '${namePrefix}-vnet-${nameSufix}'
var subnetName = 'main-subnet'

resource vnet_generic 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: name
  location: location
  tags: tagValues
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: addressPrefix
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
    virtualNetworkPeerings: []
    enableDdosProtection: false
  }
}

output vnetId string = vnet_generic.id
output subnetId string = '${vnet_generic.id}/subnets/${subnetName}'
output subnetName string = subnetName
