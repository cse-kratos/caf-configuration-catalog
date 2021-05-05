# Level 3

## MLOps

The mlops landing zone allows you to deploy machine learning resources on Azure.

### MLOps Resources to be deployed

- Machine Learning Workspace
- App insights
- Key Vault
- Managed Identities
- Key Vault Secrets
- Storage Account
- Application Services
- Cosmos DB Account
- Logic App
- Container Registry (Admin Enabled)
- Container Registry (Admin Disabled)

### Deploy MLOps using Rover

```bash
rover -lz /tf/caf/public/landingzones/landingzones/caf_mlops \
-level level3 \
-tfstate caf_mlops.tfstate \
-var-folder /tf/caf/configuration/${environment}/level3 \
-env ${environment} \
-a apply
```
