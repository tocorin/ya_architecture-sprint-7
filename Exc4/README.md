### [На главную](../README.md) - [К предыдущему упражнению](../Exc3/README.md) - [К следующему упражнению](../Exc5/README.md)


# Упражнение 4

|Роль|Полномочия|Группы пользователей|
|:--------------------|:--------------------------|:------------------------|
| Viewer               | Просмотр всех ресурсов кластера (подов, сервисов, конфигураций и пр.), без доступа к секретам.              | Наблюдатели, аналитики.       |
| Cluster Configurator | Управление настройками кластера (например, установкой конфигураций, деплойментами), без доступа к секретам. | Администраторы DevOps.        |
| Privileged Admin     | Полный доступ к управлению кластером, включая просмотр и управление секретами.                              | Системные администраторы, ИБ. |



## Cоздание пользователей и ролей

```bash

kubectl config set-credentials user1 --client-certificate=/path/to/user1.crt --client-key=/path/to/user1.key

kubectl config set-credentials user2 --client-certificate=/path/to/user2.crt --client-key=/path/to/user2.key

kubectl config set-credentials admin-user --client-certificate=/path/to/admin-user.crt --client-key=/path/to/admin-user.key

```


```bash

kubectl apply -f viewer-role.yml

kubectl apply -f cluster-configurator-role.yml

kubectl apply -f privileged-admin-role.yml

```


[viewer-role.yml](./viewer-role.yml)

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: default
  name: viewer
rules:
  - apiGroups: [""]
    resources: ["pods", "services", "configmaps", "nodes"]
    verbs: ["get", "list", "watch"]

```

[cluster-configurator-role.yml](./cluster-configurator-role.yml)

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: default
  name: cluster-configurator
rules:
  - apiGroups: [""]
    resources: ["pods", "deployments", "services", "configmaps"]
    verbs: ["create", "delete", "get", "list", "update", "watch"]
```


[privileged-admin-role.yml](./privileged-admin-role.yml)

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: privileged-admin
rules:
  - apiGroups: ["", "apps", "extensions"]
    resources: ["*"]
    verbs: ["*"]

```

## Cвязывание ролей и пользователей

```bash
kubectl apply -f viewer-binding.yml

kubectl apply -f cluster-configurator-binding.yml

kubectl apply -f privileged-admin-binding.yml
```


[viewer-binding.yml](./viewer-binding.yml)
```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: viewer-binding
  namespace: default
subjects:
  - kind: User
    name: user1
    apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: viewer
  apiGroup: rbac.authorization.k8s.io
```

[cluster-configurator-binding.yml](./cluster-configurator-binding.yml)

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: cluster-configurator-binding
  namespace: default
subjects:
  - kind: User
    name: user2
    apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: cluster-configurator
  apiGroup: rbac.authorization.k8s.io
```

[privileged-admin-binding.yml](./privileged-admin-binding.yml)

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: privileged-admin-binding
subjects:
  - kind: User
    name: admin-user
    apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: privileged-admin
  apiGroup: rbac.authorization.k8s.io

```


### [На главную](../README.md) - [К предыдущему упражнению](../Exc3/README.md) - [К следующему упражнению](../Exc5/README.md)