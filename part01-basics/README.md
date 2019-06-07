# Deep dive into Azure basics

The goal of this terraform project is to begin with Microsoft Azure Platform. The following steps are described :
- Create a network security group and network security rule allowing inbound trafic on TCP 8090
- Create a virtual network and a subnet 
- Create a virtual machine instance

Because we assume you have not any resource group nor any service account, we don't describe the creation of resource group with terraform. But this can be managed with the appropriate resource: https://www.terraform.io/docs/providers/azurerm/r/resource_group.html 
