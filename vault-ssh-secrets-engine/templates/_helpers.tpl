{{/*
SPDX-FileCopyrightText: (C) 2025 Intel Corporation
SPDX-License-Identifier: Apache-2.0
*/}}

{{- define "vault-ssh-secrets-engine.name" -}}
vault-ssh-bootstrap
{{- end }}

{{- define "vault-ssh-secrets-engine.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "vault-ssh-secrets-engine.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "vault-ssh-secrets-engine.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "vault-ssh-secrets-engine.labels" -}}
helm.sh/chart: {{ include "vault-ssh-secrets-engine.chart" . }}
{{ include "vault-ssh-secrets-engine.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "vault-ssh-secrets-engine.selectorLabels" -}}
app.kubernetes.io/name: {{ include "vault-ssh-secrets-engine.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "vault-ssh-secrets-engine.saNamespace" -}}
{{- .Values.rapKubernetesAuth.serviceAccountNamespace | default .Release.Namespace }}
{{- end }}

{{- define "vault-ssh-secrets-engine.omSaNamespace" -}}
{{- .Values.onboardingManagerKubernetesAuth.serviceAccountNamespace | default .Release.Namespace }}
{{- end }}
