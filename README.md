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
helm upgrade tomcat-chart tomcat-chart/tomcat-chart --install \
    --version $VERSION \
    --namespace $NAMESPACE \
    --create-namespace \
    --values $VALUES_FILE
```
