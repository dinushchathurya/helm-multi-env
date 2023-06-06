{{/*
Common labels
*/}}
{{- define "tomcat-chart.labels" -}}
helm.sh/chart: {{ include "tomcat-chart.chart" . }}
{{ include "tomcat-chart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Expand the name of the chart.
*/}}
{{- define "tomcat-chart.name" -}}
{{- default .Chart.Name .Values.app.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "tomcat-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "tomcat-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "tomcat-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}