## Pipeline as Code

As a developer, you want to have your code following best practices like:

-	no hardcoded strings in code
-	write methods to do one thing and one thing only
-	make your code testable
-	make your code general enough so you can reuse it

Many pipeline tools as Azure DevOps, GitHub and Jenkins has been providing options to create pipeline as code using YAML (Yet Another Markup Language) that allow developers to create simple and mature automated process.

Summarizing why things like YAML are better than classic pipelines:

-	Declarative
-	More readable
-	Wider used in the industry, thus you need to tech less (that’s why JavaScript got so famous…. And not because it is the best programming language)
-	Easier to reuse
•	Consciously reduced degrees of freedom (think of Markdown docs vs HTML or MS Office docs)

## Infrastructure as Code (IaC) and Immutability

The basic premise of IaC is everything is a code. We can compare to application development lifecycle, when you have new features or bugfix to deploy, you build new version and promote among the environments until touch production.  Patches/changes during this promotion process are not permitted. The benefits go beyond to have a versioned infra but documentation, high level of testability, security, monitoring, and reusability. You easily apply conventions, componentization and patterns that is new on infra context but very old on software development area.

## Get started with Bicep

To get going with Bicep:

1. **Start by [installing the tooling](https://github.com/Azure/bicep/blob/main/docs/installing.md).**
1. **Complete the [Bicep tutorial](https://github.com/Azure/bicep/blob/main/docs/tutorial/01-simple-template.md)**

Alternatively, you can try the [Bicep Playground](https://aka.ms/bicepdemo) or use the [VS Code Devcontainer/Codespaces](https://github.com/Azure/vscode-remote-try-bicep) repo to get a preconfigured environment.

If you have an existing ARM Template or set of resources that you would like to convert to `.bicep` format, see [Decompiling an ARM Template](https://github.com/Azure/bicep/blob/main/docs/decompiling.md).

Full details of how the bicep language works can be found in the [Bicep documentation](https://github.com/Azure/bicep/tree/main/docs) and there is a rich library of [examples](https://github.com/Azure/bicep/tree/main/docs/examples) to help you get a jumpstart.

## What unique benefits do you get with Bicep?

* Day 0 resource provider support. Any Azure resource — whether in private or public preview or GA — can be provisioned using Bicep.
* Much simpler syntax compared to equivalent ARM Template JSON
* No state or state files to manage. All state is stored in Azure, so makes it easy to collaborate and make changes to resources confidently.
* Tooling is the cornerstone to any great experience with a programming language. Our VS Code extension for Bicep makes it extremely easy to author and get started with advanced type validation based on all Azure resource type API definitions.
* Easily break apart your code with native modules
* Supported by Microsoft support and 100% free to use.

## Why create a new language instead of using an existing one?

Bicep is more of a revision to the existing ARM template language rather than an entirely new language. While most of the syntax has been changed, the core functionality of ARM templates and the runtime remains the same. You have the same template functions, same resource declarations, etc. Part of the complexity with ARM Templates is due to the "DSL" being embedded inside of JSON. With Bicep, we are revising the syntax of this DSL and moving it into its own .bicep file format. Before going down this path, we closely evaluated using an existing high-level programming language, but ultimately determined that Bicep would be easier to learn for our target audience. We are open to other implementations of Bicep in other languages.

## How does Bicep work?

First, author your Bicep code using the Bicep language service as part of the [Bicep VS Code extension](https://github.com/Azure/bicep/blob/main/docs/installing.md#bicep-vs-code-extension)

Both [Az CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) (2.20.0+) and the [PowerShell Az module](https://docs.microsoft.com/en-us/powershell/azure/install-az-ps) (v5.6.0+) have Bicep support built-in. This means you can use the standard deployment commands with your `*.bicep` files and the tooling will transpile the code and send it to ARM on your behalf. For example, to deploy `main.bicep` to a resource group `my-rg`, we can use the CLI command we are already used to:

```bash

az deployment group create -f ./main.bicep -g my-rg

az deployment sub create -f ./template.001.bicep -l $(Location) -p ./template.parameters.json

```

For more detail on taking advantage of new Bicep constructs that replace an equivalent from ARM Templates, you can read the [moving from ARM => Bicep](https://github.com/Azure/bicep/blob/main/docs/arm2bicep.md) doc.