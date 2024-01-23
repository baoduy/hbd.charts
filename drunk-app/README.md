# The Helm template
The help template had been simplified to deploy an application to Kubernetes cluster.

Here is the sample of the `value.yaml` file

```yaml
# Default values for app.
# fullnameOverride: "" # DONOT use this update in the chard name instead
nameOverride: "your-app-name"

global:
  image: "your-image-repository"
  #imagePullSecrets: []
  port: 80
  replicaCount: 1
  #liveness: "/healthz"
  #readiness: "/healthz/ready"

#Environments variables through configMap and secrets

configMap:
  hello: "1"

secrets:
  #connectionString: "ABC"

serviceAccount:
  create: true
  annotations: {}

podAnnotations: {}
podSecurityContext:
  fsGroup: 2000
securityContext:
  capabilities:
    drop:
    - ALL
  readOnlyRootFilesystem: true
  runAsNonRoot: true
  runAsUser: 1000

service:
  type: ClusterIP
  #port: 80

ingress:
  enabled: false
  annotations:
    kubernetes.io/ingress.class: nginx
  hosts:
    - host: hello.drunkcoding.net
  tls: chart-example-tls

resources:
  limits:
    cpu: 100m
    memory: 128Mi
  requests:
    cpu: 100m
    memory: 128Mi

autoscaling:
  enabled: false
  minReplicas: 1
  maxReplicas: 100
  targetCPUUtilizationPercentage: 80
  # targetMemoryUtilizationPercentage: 80

nodeSelector: {}
tolerations: []
affinity: {}
```