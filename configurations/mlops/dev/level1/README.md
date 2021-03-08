# Level 1

## Level 1 Description

### Level 1 is responsible for Role Based Access Control (RBAC) enforcement of the subscriptions, subscription behavior configuration using Azure Management groups. Azure Policies ensures deployment of preventive and reactive controls. This level is also in charge of deploying the fundamental configuration for Azure Monitor and Log analytics, shared security services, including Azure Event Hub namespace for integration with third parties SIEM solutions

## Deploying CAF Foundations

### By default, the content of this landing zone is empty unless you specify a configuration file to enable it

## Deploy using Rover

```bash
rover -lz /tf/caf/public/landingzones/landingzones/caf_foundations \
  -launchpad \
  -var-folder /tf/caf/configuration/${environment}/level1 \
  -level level1 \
  -env ${environment} \
  -a apply
```
