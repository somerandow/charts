{{/*
omada-controller.metadata.labels templates the labels for a resource based on provided values,
and injects some common extras used by Helm.
*/}}
{{- define "omada-controller.metadata.labels" -}}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | quote}}
app.kubernetes.io/version: {{ .Values.image.tag | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote}}
{{ include "omada-controller.metadata.selectorLabels" . }}
{{- end -}}

{{/*
omada-controller.metadata.selectorLabels templates the labels typically used when selecting resources with things like the
matchLabels: {} conditional
*/}}
{{- define "omada-controller.metadata.selectorLabels" -}}
{{- /* Use "main" here so that the resourceName template will render back the proper name */ -}}
app.kubernetes.io/name: {{ include "omada-controller.resourceName" (dict "ctx" . "extraResourceName" "main") | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end -}}
