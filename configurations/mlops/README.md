# ML Ops Pipeline

![image info](./assets/mlops.png)

## Cloud Adoption Framework layered approach

For the MLOps solution we followed the Cloud Adoption Framework layered appraoch. For more information on how CAF uses the reference architecture in their landing zones check out the [Landingzone Repo](https://github.com/Azure/caf-terraform-landingzones/blob/master/documentation/code_architecture/intro_architecture.md)

### Level 0

Creates permissions to each level, the storage account where the terraform state is stored per resource group, creates each place holder resource group for each level, role mappsings, dynamic secrets, and various keyvaults

### Level 1

TODO

### Level 2

TODO

### Level 3

TODO

## Setting up your environment

Within your repo, create the following structure:

```bash
├── configuration
│   ├── dev
│       ├── level0
│       ├── level1
│       ├── level2
│       ├── level3
│       ├── level4
│   ├── pre-prod
│       ├── level0
│       ├── level1
│       ├── level2
│       ├── level3
│       ├── level4
│   ├── qa
│       ├── level0
│       ├── level1
│       ├── level2
│       ├── level3
│       ├── level4
```

In your `.gitignore` file add `public`.

Next create a dev container to do your IAC work so that you bring in rover

```json
{
  "name": "CAF Landing Zones",

  // Update the 'dockerComposeFile' list if you have more compose files or use different names.
  "dockerComposeFile": "docker-compose.yml",

  // Container user to use in VSCode Online and GitHub Codespaces
  "containerUser": "vscode",

  // The 'service' property is the name of the service for the container that VS Code should
  // use. Update this value and .devcontainer/docker-compose.yml to the real service name.
  "service": "rover",

  // The optional 'workspaceFolder' property is the path VS Code should open by default when
  // connected. This is typically a volume mount in .devcontainer/docker-compose.yml
  "workspaceFolder": "/tf/caf",

  // Use 'settings' to set *default* container specific settings.json values on container create.
  // You can edit these settings after create using File > Preferences > Settings > Remote.
  "settings": {
    "files.eol": "\n",
    "terminal.integrated.shell.linux": "/bin/bash",
    "editor.tabSize": 2,
    "terminal.integrated.scrollback": 8000
  },

  // Uncomment the next line if you want start specific services in your Docker Compose config.
  // "runServices": [],

  // Uncomment this like if you want to keep your containers running after VS Code shuts down.
  // "shutdownAction": "none",

  // Uncomment the next line to run commands after the container is created.
  "postCreateCommand": "cp -R /tmp/.ssh-localhost/* ~/.ssh && sudo chmod 600 ~/.ssh/* && sudo chown -R $(whoami) /tf/caf && git config --global core.editor vi && pre-commit install && pre-commit update",

  // Add the IDs of extensions you want installed when the container is created in the array below.
  "extensions": [
    "4ops.terraform",
    "mutantdino.resourcemonitor",
    "ms-azure-devops.azure-pipelines",
    "omartawfik.github-actions-vscode"
  ]
}
```

and add a docker-compose file

```yaml
---
#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.
#-------------------------------------------------------------------------------------------------------------

version: "3.7"
services:
  rover:
    image: aztfmod/rover:2012.1109

    labels:
      - "caf=Azure CAF"

    volumes:
      # This is where VS Code should expect to find your project's source code
      # and the value of "workspaceFolder" in .devcontainer/devcontainer.json
      - ..:/tf/caf
      - volume-caf-vscode:/home/vscode
      - ~/.ssh:/tmp/.ssh-localhost:ro
      - /var/run/docker.sock:/var/run/docker.sock

    # Overrides default command so things don't shut down after the process ends.
    command: /bin/sh -c "while sleep 1000; do :; done"

volumes:
  volume-caf-vscode:
    labels:
      - "caf=Azure CAF"
```
