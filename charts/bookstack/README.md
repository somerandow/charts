# bookstack

![Version: 4.0.0](https://img.shields.io/badge/Version-4.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 25.2.0](https://img.shields.io/badge/AppVersion-25.2.0-informational?style=flat-square)

A Helm chart for deploying bookstack

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| WojoInc | <wojoinc@pm.me> |  |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry.gitlab.com/wojoinc/helm-charts | common | 0.4.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| deployments | object | `{}` |  |
| image.repository | string | `"docker.io/solidnerd/bookstack"` | the image repository |
| image.tag | string | the chart's appVersion | the image version |
| ingress.annotations | object | {} | extra annotations to add to the ingress object |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.host | string | `""` | the hostname for the Ingress |
| nameOverride | string | `""` |  |
| service.annotations | object | `{"foo":"bar"}` | extra annotations to add to the service object |

