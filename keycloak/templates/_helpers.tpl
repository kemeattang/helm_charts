{{- define "keycloak.name" -}}
{{ .Chart.Name }}
{{- end }}

{{- define "keycloak.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{- define "keycloak.adminSecretName" -}}
{{- if .Values.admin.existingSecret }}
{{- .Values.admin.existingSecret }}
{{- else }}
{{- printf "%s-admin" (include "keycloak.fullname" .) }}
{{- end }}
{{- end }}

{{- define "keycloak.dbHost" -}}
{{- if eq .Values.database.mode "embedded" }}
{{- printf "%s-postgres" (include "keycloak.fullname" .) }}
{{- else }}
{{- .Values.database.external.host }}
{{- end }}
{{- end }}

{{- define "keycloak.dbPort" -}}
{{- if eq .Values.database.mode "embedded" }}
5432
{{- else }}
{{- .Values.database.external.port }}
{{- end }}
{{- end }}

{{- define "keycloak.dbName" -}}
{{- if eq .Values.database.mode "embedded" }}
{{- .Values.database.embedded.database }}
{{- else }}
{{- .Values.database.external.name }}
{{- end }}
{{- end }}

{{- define "keycloak.dbUsername" -}}
{{- if eq .Values.database.mode "embedded" }}
{{- .Values.database.embedded.username }}
{{- else }}
{{- .Values.database.external.username }}
{{- end }}
{{- end }}

{{- define "keycloak.dbSecretName" -}}
{{- if eq .Values.database.mode "embedded" }}
{{- printf "%s-postgres" (include "keycloak.fullname" .) }}
{{- else }}
{{- .Values.database.external.existingSecret }}
{{- end }}
{{- end }}

{{- define "keycloak.dbPasswordKey" -}}
{{- if eq .Values.database.mode "embedded" }}
POSTGRES_PASSWORD
{{- else }}
{{- .Values.database.external.passwordKey }}
{{- end }}
{{- end }}
