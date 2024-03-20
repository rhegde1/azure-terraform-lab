# azure-terraform-lab

## Introduction
- This lab is "Get-Started" lab for Terraform with Azure

## Pre-Requisite
- Windows or Mac system with following installed (Admin / Sudo rights are required)
- git, gh, vscode, Terraform and Active Azure Subscription
- On MacBook you can use "Brew" packet manager [Brew Install](https://docs.brew.sh/Installation)
- On windows you can use "chocolatey" packet manager [choco install](https://chocolatey.org/install)
- if you want to use "bash shell" on windows system then you will need to 
    - enable "wsl' from add/remove feature (not available on all windows version)   **OR**
    - install "git for windows", which will install bash for you.

## Configuring Azure to authenticate via terraform
- There are many different ways to do this, it can be [Found Here](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret)
- As best practice we will be using "**Authenticating to Azure using a Service Principal and a Client Secret**"
- We will be doing it via cli
 1. az login
 2. az account list (you will want to take note of Subscription ID). 
 If you have multiple subscription then set the desired susbscription id (az account set --subscription="20000000-0000-0000-0000-000000000000") **Replace with Subscription ID**
3. az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/20000000-0000-0000-0000-000000000000" **Replace with Subscription ID**
- it will generate an output like below:
"appId": "00000000-0000-0000-0000-000000000000",
"displayName": "azure-cli-2017-06-05-10-41-15",
"name": "http://azure-cli-2017-06-05-10-41-15",
"password": "0000-0000-0000-0000-000000000000",
"tenant": "00000000-0000-0000-0000-000000000000"

"appId" is the "client_id" defined above.
"password" is the "client_secret" defined above.
"tenant" is the "tenant_id" defined above.
4. We will use the above information to set and "$ENV" in our code and pass them.
### sh
- export ARM_CLIENT_ID="00000000-0000-0000-0000-000000000000"
- export ARM_CLIENT_SECRET="12345678-0000-0000-0000-000000000000"
- export ARM_TENANT_ID="10000000-0000-0000-0000-000000000000"
- export ARM_SUBSCRIPTION_ID="20000000-0000-0000-0000-000000000000"
### PowerShell
- $env:ARM_CLIENT_ID = "00000000-0000-0000-0000-000000000000"
- $env:ARM_CLIENT_SECRET = "12345678-0000-0000-0000-000000000000"
- $env:ARM_TENANT_ID = "10000000-0000-0000-0000-000000000000"
- $env:ARM_SUBSCRIPTION_ID = "20000000-0000-0000-0000-000000000000"

## Creating Terraform configuration
- Once above steps are completed, we will now start building our Terraform Code [(tf code)]
- Now [clone this repo](https://github.com/rhegde1/azure-terraform-lab)

### Understanding folder Struture
- azure-terraform-lab has child folder "get-started-tf-on-azure"