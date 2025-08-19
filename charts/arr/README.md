# arr

![Version: 0.7.5](https://img.shields.io/badge/Version-0.7.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A common Helm chart for *arr apps

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| somerandow | <wojoinc@pm.me> |  |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| image.pullPolicy | string | `"IfNotPresent"` | Sets the pullPolicy for the main container |
| image.repository | string | `"alpine"` | Sets the image to be used |
| image.tag | string | `""` | Sets the image tag. This should always be set as it will not fall back to chart appVersion |
| ingress.api.annotations | object | `{}` |  |
| ingress.api.className | string | `""` |  |
| ingress.api.enabled | bool | `false` |  |
| ingress.api.forwardAuth.allowedGroups | list | `[]` |  |
| ingress.api.forwardAuth.enabled | bool | `false` |  |
| ingress.api.forwardAuth.endpoint | string | `""` |  |
| ingress.api.host | string | `""` |  |
| ingress.api.path | string | `""` |  |
| ingress.api.pathType | string | `""` |  |
| ingress.api.tls | bool | `false` |  |
| ingress.main.annotations | object | `{}` |  |
| ingress.main.className | string | `""` |  |
| ingress.main.enabled | bool | `false` |  |
| ingress.main.forwardAuth.allowedGroups | list | `[]` |  |
| ingress.main.forwardAuth.enabled | bool | `false` |  |
| ingress.main.forwardAuth.endpoint | string | `""` |  |
| ingress.main.host | string | `""` |  |
| ingress.main.path | string | `""` |  |
| ingress.main.pathType | string | `""` |  |
| ingress.main.tls | bool | `false` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.config.accessModes | list | `[]` |  |
| persistence.config.annotations | object | `{}` |  |
| persistence.config.className | string | `""` |  |
| persistence.config.enabled | bool | `false` |  |
| persistence.config.size | string | `""` |  |
| persistence.media.accessModes | list | `[]` |  |
| persistence.media.annotations | object | `{}` |  |
| persistence.media.className | string | `""` |  |
| persistence.media.enabled | bool | `false` |  |
| persistence.media.existingClaim | string | `""` |  |
| persistence.media.size | string | `""` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| probes.livenessCmd | list | `[]` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `1111` | Sets the port to be used for the main service, should match the common port for the respective *arr app |
| serviceAccount.create | bool | `false` |  |
| tolerations | list | `[]` |  |

