# ARA Records Ansible Helm Chart

ARA is a Python and Django based visualization for Ansible Playbook runs. An Ansible callback plugin records the playbook results to an ARA instance via http(s).

Overview of [ARA Records Ansible](https://ara.recordsansible.org).

## TL;DR

```shell
$ helm repo add spreitzer https://registry.spreitzer.ch/chartrepo/helm
$ helm install my-release spreitzer/ara
```

## Introduction
tbd.

## Prerequisites
tbd.

## Parameters
### Common Parameters

| Name                               | Description                  | Value                      |
| ---------------------------------- | ---------------------------- | -------------------------- |
| `replicas`                         | Amount of deployment replias | `1`                        |
| `extraEnv`                         | Extra environment variables  | `{}`                       |
| `deploymentStrategy.type`          | Deployment type              | `"RollingUpdate"`          |
| `deploymentStrategy.rollingUpdate` | RollingUpdate parameters     | `{}`                       |
| `image.repo`                       |  Image repository            | `"recordsansible/ara-api"` |
| `image.tag`                        | Image tag                    | `"latest"`                 |
| `service.type`                     | Type of kubernetes service   | `"ClusterIP"`              |

### Ingress Parameters
tbd.

### Persistence Parameters
tbd.

## Configuration and Installation Details
tbd.

## Persistence
tbd.

## Upgrading
tbd.

## License

See [LICENSE](/LICENSE).
