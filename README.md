### Create Helm Chart

```
helm create tomcat-chart
```

### Verify the conversion of the chart

```
helm template tomcat-chart -f ./tomcat-chart/environments/dev/values.yaml
```

### Lint the chart

```
helm lint tomcat-chart
```

### Install the chart

```
helm install tomcat-chart tomcat-chart
```
