# Level 2

## Level 2 Shared Services

### Shared services include each environment's core networking components (using hub and spoke or any other network topology). Level 2 also includes services like Azure Site Recovery Vault for Backup and Disaster Recovery, Azure Monitor settings for the monitoring of the environment alongside with Azure Automation for patch management of the resources. Other resources could be image management for virtual machines in the environment

## Deploying CAF Shared Services

### By default, the content of this landing zone is empty unless you specify a configuration file to enable it

## Resources to be deployed

### CAF Shared Services

### Common Services

- Azure Storage Account ADLS
- Application Insights
- Azure Container Registries
- Azure KeyVault

### Networking - Single Hub and Spoke

- Vnets
- Network Security Groups
- IPaddresses
- Firewall
- routes

## Deploy using Rover

### CAF Shared Services Command

```bash
rover -lz /tf/caf/public/landingzones/landingzones/caf_shared_services \
  -var-folder /tf/caf/configuration/${environment}/level2/shared_services \
  -level level2 \
  -env ${environment} \
  -a apply
```

### Common Services Command

```bash
rover -lz /tf/caf/public/landingzones/landingzones/common_landingzone \
  -var-folder /tf/caf/configuration/${environment}/level2/common_services \
  -parallelism 30 \
  -tfstate common_services.tfstate \
  -level level2 \
  -env ${environment} \
  -a apply
```

### Networking Spoke

```bash
rover -lz /tf/caf/public/landingzones/landingzones/caf_networking \
  -var-folder /tf/caf/configuration/${environment}/level2/networking \
  -parallelism 30 \
  -level level2 \
  -env ${environment} \
  -a apply
```
