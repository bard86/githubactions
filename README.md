# githubactions

```console
kubectl create ns example-helm
./kubernetes/create_service_account_4k8s.sh deliverybot example-helm
kubectl apply -f ./kubernetes/permissions.yml 
```
