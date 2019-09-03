# camp-dns
## build
独自のregistry用に secret 作ってください
```bash
kubectl create secret -n camp-dns \
        docker-registry camp-reg \
        --docker-server="REG-IP-ADDRESS:PORT" \
        --docker-username="USER-NAME" \
        --docker-password="PASSWORD" \
        -o yaml --dry-run | kubectl replace -n camp-dns --force -f -
```
secretのyamlは以下の形式
```yaml
apiVersion: v1
data:
  .dockerconfigjson: SECRET-SECRET-SECRET
kind: Secret
metadata:
  creationTimestamp: null
  name: camp-reg
  namespace: camp-dns
type: kubernetes.io/dockerconfigjson
```
その後、

```bash
docker login https://REG-IP-ADDRESS:PORT/v2/
cd docker
#(rsyslogのIPアドレスとかはこの前に変更)
make
docker tag wide-camp-1909/camp-dns:latest REG-IP-ADDRESS:PORT/wide-camp-1909/camp-dns:latest
docker push
```

## helm install
repo rootより
```bash
helm install camp-dns --namespace camp-dns --name camp-dns
```

## helm delete
```bash
helm delete --purge camp-dns
```


