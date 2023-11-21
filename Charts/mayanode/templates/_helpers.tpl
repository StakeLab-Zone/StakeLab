{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "mayanode.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "mayanode.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "mayanode.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "mayanode.labels" -}}
helm.sh/chart: {{ include "mayanode.chart" . }}
{{ include "mayanode.selectorLabels" . }}
app.kubernetes.io/version: {{ include "mayanode.tag" . | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/net: {{ include "mayanode.net" . }}
app.kubernetes.io/type: {{ .Values.type }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "mayanode.selectorLabels" -}}
app.kubernetes.io/name: {{ include "mayanode.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "mayanode.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "mayanode.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Net
*/}}
{{- define "mayanode.net" -}}
{{- default .Values.net .Values.global.net -}}
{{- end -}}

{{/*
Tag
*/}}
{{- define "mayanode.tag" -}}
{{- coalesce  .Values.global.tag .Values.image.tag .Chart.AppVersion -}}
{{- end -}}

{{/*
Image
*/}}
{{- define "mayanode.image" -}}
{{/* A hash is not needed for mocknet/testnet, or in the case that a node is not a validator w/ key material and autoupdate is enabled. */}}
{{- if or (eq (include "mayanode.net" .) "mocknet") (eq (include "mayanode.net" .) "testnet") (and .Values.autoupdate.enabled (eq .Values.type "fullnode")) -}}
{{- .Values.image.repository -}}:{{ include "mayanode.tag" . }}
{{- else -}}
{{- .Values.image.repository -}}:{{ include "mayanode.tag" . }}@sha256:{{ coalesce .Values.global.hash .Values.image.hash }}
{{- end -}}
{{- end -}}

{{/*
RPC Port
*/}}
{{- define "mayanode.rpc" -}}
{{- if eq (include "mayanode.net" .) "mainnet" -}}
    {{ .Values.service.port.mainnet.rpc}}
{{- else if eq (include "mayanode.net" .) "stagenet" -}}
    {{ .Values.service.port.stagenet.rpc}}
{{- else -}}
    {{ .Values.service.port.testnet.rpc }}
{{- end -}}
{{- end -}}

{{/*
P2P Port
*/}}
{{- define "mayanode.p2p" -}}
{{- if eq (include "mayanode.net" .) "mainnet" -}}
    {{ .Values.service.port.mainnet.p2p}}
{{- else if eq (include "mayanode.net" .) "stagenet" -}}
    {{ .Values.service.port.stagenet.p2p}}
{{- else -}}
    {{ .Values.service.port.testnet.p2p }}
{{- end -}}
{{- end -}}

{{/*
chain id
*/}}
{{- define "mayanode.chainID" -}}
{{- if eq (include "mayanode.net" .) "mainnet" -}}
    {{ .Values.chainID.mainnet}}
{{- else if eq (include "mayanode.net" .) "stagenet" -}}
    {{ .Values.chainID.stagenet}}
{{- else -}}
    {{ .Values.chainID.testnet }}
{{- end -}}
{{- end -}}
