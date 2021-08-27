# Practical Trainings /Workshops

## Get started with Bicep

For step-by-step guidance on using Bicep to deploy your infrastructure to Azure, Microsoft Learn offers several learning modules.

* [Create Bicep files with Visual Studio Code](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/quickstart-create-bicep-use-visual-studio-code?tabs=CLI).
* [Best practices for Bicep](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/best-practices).

## DOJO - tutorial

- [1 - Working with a basic Bicep file](./01-simple-template.md)
- [2 - Deploying a bicep file](./02-deploying-a-bicep-file.md)
- [3 - Using expressions](./03-using-expressions.md)
- [4 - Using the symbolic resource name](./04-using-symbolic-resource-name.md)
- [5 - Advanced resource declarations](./05-loops-conditions-existing.md)
- [6 - Creating and consuming modules](./06-creating-modules.md)
- [7 - Convert any ARM template into a Bicep file](./07-convert-arm-template.md)

## Introductory path

The [Deploy and manage resources in Azure by using Bicep](https://docs.microsoft.com/en-us/learn/paths/bicep-deploy/) learning path is the best place to start. It introduces you to the concept of infrastructure as code. The path takes you through the steps of building increasingly complex Bicep files.

This path contains the following modules.

| Learn module | Description |
| ------------ | ----------- |
| [Introduction to infrastructure as code using Bicep](https://docs.microsoft.com/en-us/learn/modules/introduction-to-infrastructure-as-code-using-bicep/) | This module describes the benefits of using infrastructure as code, Azure Resource Manager, and Bicep to quickly and confidently scale your cloud deployments. It helps you determine the types of deployments for which Bicep is a good deployment tool. |
| [Build your first Bicep template](https://docs.microsoft.com/en-us/learn/modules/deploy-azure-resources-by-using-bicep-templates/) | In this module, you define Azure resources within a Bicep template. You improve the consistency and reliability of your deployments, reduce the manual effort required, and scale your deployments across environments. Your template will be flexible and reusable by using parameters, variables, expressions, and modules. |
| [Build reusable Bicep templates by using parameters](https://docs.microsoft.com/en-us/learn/modules/build-reusable-bicep-templates-parameters/) | This module describes how you can use Bicep parameters to provide information for your template during each deployment. You'll learn about parameter decorators, which make your parameters easy to understand and work with. You'll also learn about the different ways that you can provide parameter values and protect them when you're working with secure information. |
| [Build flexible Bicep templates by using conditions and loops](https://docs.microsoft.com/en-us/learn/modules/build-flexible-bicep-templates-conditions-loops/) | Learn how to use conditions to deploy resources only when specific constraints are in place. Also learn how to use loops to deploy multiple resources that have similar properties. |
| [Deploy child and extension resources by using Bicep](https://docs.microsoft.com/en-us/learn/modules/child-extension-bicep-templates/) | This module shows how to deploy various Azure resources in your Bicep code. Learn about child and extension resources, and how they can be defined and used within Bicep. Use Bicep to work with resources that you created outside a Bicep template or module. |
| [Deploy resources to subscriptions, management groups, and tenants by using Bicep](https://docs.microsoft.com/en-us/learn/modules/deploy-resources-scopes-bicep/) | Deploy Azure resources at the subscription, management group, and tenant scope. Learn what these resources are, why you would use them, and how you create Bicep code to deploy them. Also learn how to create a single set of Bicep files that you can deploy across multiple scopes in one operation. |
| [Extend templates by using deployment scripts](https://docs.microsoft.com/en-us/learn/modules/extend-resource-manager-template-deployment-scripts/) | Learn how to add custom steps to your Bicep file or Azure Resource Manager template (ARM template) by using deployment scripts. |

## Other modules

In addition to the preceding path, the following modules contain Bicep content.

| Learn module | Description |
| ------------ | ----------- |
| [Preview Azure deployment changes by using what-if](https://docs.microsoft.com/en-us/learn/modules/arm-template-whatif/) | This module teaches you how to preview your changes with the what-if operation. By using what-if, you can make sure your Bicep file only makes changes that you expect. |
| [Publish libraries of reusable infrastructure code by using template specs](https://docs.microsoft.com/en-us/learn/modules/arm-template-specs/) | Learn how to create and publish template specs, and how to deploy them. |
| [Authenticate your Azure deployment pipeline by using service principals](https://docs.microsoft.com/en-us/learn/modules/authenticate-azure-deployment-pipeline-service-principals/) | Service principals enable your deployment pipelines to authenticate securely with Azure. In this module, you'll learn what service principals are, how they work, and how to create them. You'll also learn how to grant them permission to your Azure resources so that your pipelines can deploy your Bicep files. |
| [Manage changes to your Bicep code by using Git](https://docs.microsoft.com/en-us/learn/modules/manage-changes-bicep-code-git/) | Learn how to use Git to support your Bicep development workflow by keeping track of the changes you make as you work. You'll find out how to commit files, view the history of the files you've changed, and how to use branches to develop multiple versions of your code at the same time. You'll also learn how to use GitHub or Azure Repos to publish a repository so that you can collaborate with team members. |