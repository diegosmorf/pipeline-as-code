param namePrefix string
param nameSufix string
param location string = resourceGroup().location
param subnetId string
param privateIPAddress string =  '10.0.0.4'
param tagValues object

resource nic 'Microsoft.Network/networkInterfaces@2021-02-01' = {
  name: '${namePrefix}-vm-${nameSufix}'
  tags: tagValues
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAddress: privateIPAddress
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: subnetId
          }
          primary: true
          privateIPAddressVersion: 'IPv4'
        }
      }
    ]
    dnsSettings: {
      dnsServers: []
    }
    enableAcceleratedNetworking: false
    enableIPForwarding: false
  }
}

output nicId string = nic.id
