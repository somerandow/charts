# omada-controller

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 5.15](https://img.shields.io/badge/AppVersion-5.15-informational?style=flat-square)

A Helm chart for Omada software controller

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| somerandow | <wojoinc@pm.me> |  |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| controller.logs.db | bool | `false` |  |
| controller.logs.server | bool | `true` |  |
| controller.pgid | int | `508` |  |
| controller.puid | int | `508` |  |
| controller.rootless | bool | `true` | Whether the container should expect to run rootless. If true, pgid and puid are ignored |
| controller.timezone | string | `"Etc/UTC"` |  |
| image.repository | string | `"docker.io/mbentley/omada-controller"` |  |
| image.tag | string | `"5.15.24.19"` |  |
| ingress.additionalAnnotations | object | `{}` |  |
| ingress.additionalLabels | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.host | string | `""` |  |
| persistence.data.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.data.enabled | bool | `false` |  |
| persistence.data.size | string | `"1Gi"` |  |
| persistence.data.storageClassName | string | `""` |  |
| persistence.logs.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.logs.enabled | bool | `false` |  |
| persistence.logs.size | string | `"1Gi"` |  |
| persistence.logs.storageClassName | string | `""` |  |
| services.controller.additionalAnnotations | object | `{}` |  |
| services.controller.additionalLabels | object | `{}` |  |
| services.controller.loadBalancerRanges | list | `[]` |  |
| services.controller.type | string | `"LoadBalancer"` |  |
| services.portal.additionalAnnotations | object | `{}` |  |
| services.portal.additionalLabels | object | `{}` |  |
| services.portal.loadBalancerRanges | list | `[]` |  |
| services.portal.type | string | `"ClusterIP"` |  |
| services.webUI.additionalAnnotations | object | `{}` |  |
| services.webUI.additionalLabels | object | `{}` |  |
| services.webUI.loadBalancerRanges | list | `[]` |  |
| services.webUI.type | string | `"ClusterIP"` |  |

