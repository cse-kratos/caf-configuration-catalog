# Level 3

## MLOps

### MLOps Resources to be deployed

* App Config
* App Insights
* App Service Plan
* App Service
* Container Registry (Admin Enabled)
* Cosmos DB Account
* Function App
* Key Vault + Dynamic Key Vault Secrets
* Machine Learning Workspace
* Managed Identities
* Logic App
* Storage Account (HNS Enabled)
* Storage Account (HNS Disable)

### Deploy MLOps using Rover

environment variable `environment` must be set to dev then run the following bash command below: 

```bash
rover -lz /tf/caf/public/landingzones/landingzones/caf_solutions \
-level level3 \
-tfstate caf_mlops.tfstate \
-var-folder /tf/caf/configuration/${environment}/level3/MLOps \
-env ${environment} \
-a apply
```
