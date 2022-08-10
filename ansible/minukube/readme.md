https://github.com/ansible/awx-operator


choco install kubernetes-cli
choco install kustomize
curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash

minikube image pull quay.io/ansible/awx-ee:latest
minikube image ls


minikube start --cpus=4 --memory=6g --addons=ingress
minikube status
minikube dashboard
minikube kubectl -- get nodes
minikube kubectl -- get pods -A

kustomize build . | minikube kubectl -- apply -f -

minikube kubectl -- get pods -n awx
minikube kubectl -- config set-context --current --namespace=awx

minikube kubectl -- logs -f deployments/awx-operator-controller-manager -c awx-manager

minikube kubectl -- get pods -l "app.kubernetes.io/managed-by=awx-operator"
minikube kubectl -- describe pod -l "app.kubernetes.io/managed-by=awx-operator"
minikube kubectl -- get svc -l "app.kubernetes.io/managed-by=awx-operator"


Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
. .\base64.ps1
Set-ExecutionPolicy Restricted -Scope CurrentUser

minikube kubectl -- get secret awx-demo-admin-password -o jsonpath="{.data.password}" | base64 --decode

minikube service awx-demo-service --url -n awx
