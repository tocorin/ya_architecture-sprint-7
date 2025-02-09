### [На главную](../README.md) - [К предыдущему упражнению](../Exc4/README.md)

# Упражнение 5

[admin-api-allow](./admin-api-allow.yml)

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-admin-front-back
  namespace: default
spec:
  podSelector:
    matchLabels:
      role: admin-back-end-api
  ingress:
    - from:
        - podSelector:
            matchLabels:
              role: admin-front-end
      ports:
        - protocol: TCP
          port: 80
  egress:
    - to:
        - podSelector:
            matchLabels:
              role: admin-front-end
      ports:
        - protocol: TCP
          port: 80

```


[non-admin-api-allow](./non-admin-api-allow.yml)

```yaml

apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-front-back
  namespace: default
spec:
  podSelector:
    matchLabels:
      role: back-end-api
  ingress:
    - from:
        - podSelector:
            matchLabels:
              role: front-end
      ports:
        - protocol: TCP
          port: 80
  egress:
    - to:
        - podSelector:
            matchLabels:
              role: front-end
      ports:
        - protocol: TCP
          port: 80

```

### [На главную](../README.md) - [К предыдущему упражнению](../Exc4/README.md)