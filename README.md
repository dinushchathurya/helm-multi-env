### Create Helm Chart

```
helm create tomcat-chart
```

### Verify the conversion of the chart

```
helm template tomcat-demo . -f /environments/dev/values.yaml
```

### Lint the chart

```
helm lint tomcat-chart
```

### Install the chart (locally)

```
helm install tomcat-chart tomcat-chart
```

### Helm package the chart

```
helm package --version <version> .
```

### Install the chart from GitHub pages

``` 
helm repo add tomcat-chart https://dinushchathurya.github.io/tomcat-helm-multi-env
```

### Update local Helm repos

```
helm repo update
```

### Install the chart from GitHub pages

```
helm install tomcat-chart tomcat-chart/tomcat-chart -f /environments/dev/values.yaml --namespace dev --version <required-version>

helm upgrade tomcat-chart tomcat-chart/tomcat-chart --install --version v0.6.8-115 --namespace dev

helm upgrade tomcat-chart tomcat-chart/tomcat-chart --install --version v0.3.9-117 --namespace prod -f ./tomcat-chart/environments/prod/values.yaml
```
