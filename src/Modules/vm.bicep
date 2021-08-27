param namePrefix string
param nameSufix string
param nicId string
param imagePublisher string = 'Canonical'
param imageOffer string = 'UbuntuServer'
param imageSku string = '18.04-LTS'
param imageVersion string = 'latest'
param osDiskType string = 'Standard_LRS'
param vmSize string = 'Standard_B1s'
param username string
param password string
param tagValues object

var vmName = '${namePrefix}-vm-${nameSufix}'

// Create the vm
resource vm 'Microsoft.Compute/virtualMachines@2021-04-01' = {
  name : vmName
  location: resourceGroup().location
  tags: tagValues
  zones: [
    '1'
  ]
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    storageProfile: {
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: osDiskType
        }
      }
      imageReference: {
        publisher: imagePublisher
        offer: imageOffer
        sku: imageSku
        version: imageVersion
      }
    }
    osProfile: {
      computerName: vmName
      adminUsername: username
      adminPassword: password
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nicId
        }
      ]
    }
  }
}

output id string = vm.id
