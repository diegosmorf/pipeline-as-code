param namePrefix string
param nameSufix string
param tagValues object
param sku string = 'B1'

resource appPlan 'Microsoft.Web/serverfarms@2021-01-15' = {
  name : '${namePrefix}-appPlan-${nameSufix}'
  location: resourceGroup().location
  kind: 'linux'
  tags: tagValues
  sku:{ 
    name: sku
  }
  properties:{
    reserved:true
  }
}

output planId string = appPlan.id
