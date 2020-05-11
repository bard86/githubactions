# githubactions

create service account:

```console
kubectl create ns example-helm
./kubernetes/create_service_account_4k8s.sh deliverybot example-helm
kubectl apply -f ./kubernetes/permissions.yml 
kubectl create secret docker-registry github-pkg --docker-server=docker.pkg.github.com --docker-username=bard86 --docker-password=<enter_password_here> --namespace example-helm
```

install:
```console
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client

curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
helm version
```

helm:

```console
helm -n example-helm install app ./piggymetrics/
helm -n example-helm upgrade app ./piggymetrics/
helm -n example-helm uninstall app 

helm -n example-helm list

helm create mychart
helm dep update ./piggymetrics/
```

k8s:
```console
kubectl -n example-helm get all
kubectl -n example-helm logs pod/...
kubectl -n example-helm describe pod <stage-app-gateway-svc-68649f659c-ckw2q>

kubectl -n example-helm scale deployment stage-app-gateway-svc --replicas=0 
kubectl -n example-helm scale deployment stage-app-gateway-svc --replicas=1

export POD_NAME=$(kubectl get pods --namespace example-helm -l "app.kubernetes.io/name=app,app.kubernetes.io/instance=app" -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward $POD_NAME 8080:80
```

