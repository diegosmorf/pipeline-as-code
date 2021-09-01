param appserviceName string
param location string = resourceGroup().location
param dockerImage string
param dockerImageTag string
param appPlanId string
param tagValues object

resource appService 'Microsoft.Web/sites@2021-01-15'  = {
  name: appserviceName
  location: location    
  tags: tagValues
  properties: {    
    siteConfig: {
      appSettings: [
        {
          name: 'DOCKER_REGISTRY_SERVER_URL'
          value: 'https://index.docker.io'
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_USERNAME'
          value: ''
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_PASSWORD'
          value: ''
        }
        {
          name: 'WEBSITES_ENABLE_APP_SERVICE_STORAGE'
          value: 'false'
        }
      ]
      linuxFxVersion: 'DOCKER|${dockerImage}:${dockerImageTag}'      
    }    
    serverFarmId: appPlanId
  }  
}

output siteUrl string = appService.properties.hostNames[0]
