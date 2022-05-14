# ARA Records Ansible Helm Chart

![ARA full logo](https://ara.recordsansible.org/static/ara-full-logo.png)

ARA is a Python and Django based visualization for Ansible Playbook runs. An Ansible callback plugin records the playbook results to an ARA instance via http(s). This is a publicly hosted Open Source Helm Chart of ARA.

Overview of [ARA Records Ansible](https://ara.recordsansible.org).

## TL;DR

```shell
helm repo add spreitzer https://registry.spreitzer.ch/chartrepo/helm
helm install my-release spreitzer/ara
```

## Introduction
tbd.

## Contributing

Please contribute here:
 * [Issues](https://git.spreitzer.ch/helm/ara/-/issues)
 * [Merge Requests](https://git.spreitzer.ch/helm/ara/-/merge_requests)

With your contribution you agree that your work is published under the MIT license of this project. See [LICENSE](/LICENSE).

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

Free and Open Source, MIT license, See [LICENSE](/LICENSE).

## Authors

 * [Sascha Spreitzer](https://spreitzer.ch)
