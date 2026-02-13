{{/*
bookstack.metadata.labels templates the labels for a resource based on provided values,
and injects some common extras used by Helm.
*/}}
{{- define "bookstack.metadata.labels" -}}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | quote}}
app.kubernetes.io/version: {{ .Values.image.tag | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote}}
{{ include "bookstack.metadata.selectorLabels" . }}
{{- end -}}

{{/*
bookstack.metadata.selectorLabels templates the labels typically used when selecting resources with things like the
matchLabels: {} conditional
*/}}
{{- define "bookstack.metadata.selectorLabels" -}}
{{- /* Use "main" here so that the resourName template will render back the proper name */ -}}
app.kubernetes.io/name: {{ include "bookstack.resourceName" (dict "ctx" . "extraResourceName" "main") | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end -}}

{{/*
bookstack.metadata.annotations templates an annotation block based on the supplied value scope
*/}}
{{- define "bookstack.metadata.annotations" }}
{{- $ctx := .ctx }}
{{- if $ctx.annotations }}
annotations: {{ $ctx.annotations | toYaml | nindent 2 }}
{{- end }}
{{- end }}