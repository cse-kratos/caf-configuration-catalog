# Level 0

This contains a scenario 200 which is necessary for AZDO pipelines.

## Manual Deployment

Clone the landing zone repo

```bash
git clone git@github.com:cse-kratos/caf-terraform-landingzones.git /tf/caf/public/landingzones
git clone git@github.com:cse-kratos/terraform-azurerm-caf.git /tf/caf/public/modules
git clone git@github.com:cse-kratos/terraform-provider-azurecaf.git /tf/caf/public/providers
```

Login to Azure and set the subscription

```bash
rover login

##FOLLOW PROMPTS FROM ROVER

## set Azure account, e.g. az account -s davisb_KRATOS_team_subscription
az account -s [NAME OF ACCOUNT OR ID OF ACCOUNT]
```

Set environment

```bash
export environment=dev
```

Run Rover

```bash
rover -lz /tf/caf/public/landingzones/landingzones/caf_launchpad \
  -launchpad \
  -var-folder /tf/caf/configuration/${environment}/level0 \
  -level level0 \
  -env ${environment} \
  -a apply
```

## Architecture Diagram

TBD

## Services

| Component             | Purpose                                                                                                                                                                                                                    |
| --------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Resource group        | Multiple resource groups are created to isolate the services.                                                                                                                                                              |
| Storage account       | A storage account for remote tfstate management is provided for each level of the framework. Additional storage accounts are created for diagnostic logs.                                                                  |
| Key Vault             | The launchpad Key Vault hosts all secrets required by the rover to access the remote states, the Key Vault policies are created allowing the logged-in user to see secrets created and stored.                             |
| Virtual network       | To secure the communication between the services a dedicated virtual network is deployed with a gateway subnet, bastion service, jumpbox and azure devops release agents. Service endpoints is enabled but not configured. |
| Azure AD Applications | An Azure AD application is created. This account is mainly use to bootstrap the services during the initialization. It is also considered as a breakglass account for the launchpad landing zones                          |
