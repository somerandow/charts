{{/*
arr.metadata.labels templates the labels for a resource based on provided values,
and injects some common extras used by Helm.
*/}}
{{- define "arr.metadata.labels" -}}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | quote}}
app.kubernetes.io/version: {{ .Values.image.tag | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote}}
{{ include "arr.metadata.selectorLabels" . }}
{{- end -}}

{{/*
arr.metadata.selectorLabels templates the labels typically used when selecting resources with things like the
matchLabels: {} conditional
*/}}
{{- define "arr.metadata.selectorLabels" -}}
{{- /* Use "main" here so that the resourName template will render back the proper name */ -}}
app.kubernetes.io/name: {{ include "arr.resourceName" (dict "ctx" . "extraResourceName" "main") | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end -}}