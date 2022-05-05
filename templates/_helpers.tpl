{{- define "ara.name" -}}
{{- printf "%s-%s" .Chart.Name .Release.Name | trunc 64 | trimSuffix "-" -}}
{{- end -}}

{{- define "ara.labels" -}}
app: {{ include "ara.name" . | quote }}
app.kubernetes.io/name: {{ include "ara.name" . | quote }}
helm.sh/chart: "{{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}"
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end -}}
