{{/*
calibre.metadata.labels templates the labels for a resource based on provided values,
and injects some common extras used by Helm.
*/}}
{{- define "calibre.metadata.labels" -}}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | quote}}
app.kubernetes.io/version: {{ empty .Values.image.tag | ternary .Chart.AppVersion .Values.image.tag | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote}}
{{ include "calibre.metadata.selectorLabels" . }}
{{- end -}}

{{/*
calibre.metadata.selectorLabels templates the labels typically used when selecting resources with things like the
matchLabels: {} conditional
*/}}
{{- define "calibre.metadata.selectorLabels" -}}
{{- /* Use "main" here so that the resourName template will render back the proper name */ -}}
app.kubernetes.io/name: {{ include "calibre.resourceName" (dict "ctx" . "extraResourceName" "main") | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end -}}
