# ARA Records Ansible Helm Chart

![ARA full logo](https://ara.recordsansible.org/static/ara-full-logo.png)

ARA is a Python and Django based visualization for Ansible Playbook runs. An Ansible callback plugin records the playbook results to an ARA instance via http(s). This work is a publicly hosted Open Source Helm Chart of ARA.

Overview of [ARA Records Ansible](https://ara.recordsansible.org).

## TL;DR

```shell
helm repo add spreitzer https://registry.spreitzer.ch/chartrepo/helm
helm install my-release spreitzer/ara
```

## Introduction

This Helm Chart deploys an ARA api instance. ARA api is the server component of the ARA software. It will serve Ansible playbook run reports and hosts in a user friendly web interface, as well as the api which the client part uses to submit reports.

The ARA api is neither secured or open for submitting reports. You will have to configure the ARA api for authentication. Please see the [ARA documentation](https://ara.readthedocs.io/en/latest/api-configuration.html). The ARA api may be secured by disabling authentication in ARA api and providing authentication over HTTPS via [ingress annotations](#ingress-parameters).

ARA api supports a multitude of database backends configurable via the aforementioned environment variables. This Helm Chart may in future support high availability and incorporate an easy configuration. However at the moment you will have to configure high availability and scalability via replicas, deployment strategy, persistence and the deployment environment variables by yourself.

## Contributing

Please contribute here:
 * [Issues](https://git.spreitzer.ch/helm/ara/-/issues)
 * [Merge Requests](https://git.spreitzer.ch/helm/ara/-/merge_requests)

Under the conditions of merit:
 * You create it (eg. features), you lead it
 * You break it, you fix it
 * Be kind and benevolent, but prefer contribution over harmony

With your contribution you agree that your work is published under the MIT license of this project. See [LICENSE](/LICENSE).

## Prerequisites

 * Kubernetes
 * Helm
 * Storage in Kubernetes

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

Please find ARA api environment variables and behavior documented [here](https://ara.readthedocs.io/en/latest/api-configuration.html).

Example

```yaml
replicas: 1
deploymentStrategy:
  type: Recreate
extraEnv:
  - name: ARA_EXTERNAL_AUTH
    value: 'True'
  - name: ARA_READ_LOGIN_REQUIRED
    value: 'False'
  - name: ARA_WRITE_LOGIN_REQUIRED
    value: 'False'
```

### Ingress Parameters

| Name                  | Description                         | Value                 |
| --------------------- | ----------------------------------- | --------------------- |
| `ingress.enabled`     | Switch to enable/disable an ingress | `false`               |
| `ingress.annotations` | Ingress annotations map             | `{}`                  |
| `ingress.tls`         | Switch to enable/disable TLS/SSL    | `false`               |
| `ingress.tlsSecret`   | Name of secret of tls certificate   | `"ara-tls"`           |
| `ingress.hosts`       | List of FQDN for the ingress        | `["ara.example.com"]` |

Example

```yaml
ingress:
  annotations:
    cert-manager.io/cluster-issuer: letsencrypt
    nginx.ingress.kubernetes.io/auth-type: basic
    nginx.ingress.kubernetes.io/auth-realm: "ARA Records Ansible"
    nginx.ingress.kubernetes.io/auth-secret: ara-htpasswd
  enabled: true
  tls: true
  hosts:
    - ara.example.com
```

### Persistence Parameters

| Name                       | Description                          | Value               |
| -------------------------- | ------------------------------------ | ------------------- |
| `persistence.enabled`      | Switch to enable/disable persistence | `false`             |
| `persistence.accessModes`  |  Volume access modes                 | `["ReadWriteOnce"]` |
| `persistence.size`         | Size of volume                       | `"8Gi"`             |
| `persistence.storageClass` | StorageClass of volume               | `""`                |

Example

```yaml
persistence:
  enabled: true
  accessModes:
    - ReadWriteOnce
  storageClass: default
```

## Configuration and Installation Details
tbd.

## Persistence
tbd.

## Upgrading
tbd.

## License

Free and Open Source, MIT license, See [LICENSE](/LICENSE).

## Credits

 * The [bitnami/charts/mariadb/README.md](https://github.com/bitnami/charts/blob/master/bitnami/mariadb/README.md) documentation served as inspiration for this documentation

## Authors

 * [Sascha Spreitzer](https://spreitzer.ch)
