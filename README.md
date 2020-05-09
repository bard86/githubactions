# githubactions

```console
kubectl create ns example-helm
./kubernetes/create_service_account_4k8s.sh deliverybot example-helm
kubectl apply -f ./kubernetes/permissions.yml 
kubectl create secret docker-registry github-pkg --docker-server=docker.pkg.github.com --docker-username=bard86 --docker-password=<enter_password_here> --namespace example-helm
```
