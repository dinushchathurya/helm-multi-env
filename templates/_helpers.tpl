{{- define "tomcat-chart.labels" -}}
app: tomcat
env: {{ .Values.app.env }}
{{- end -}}