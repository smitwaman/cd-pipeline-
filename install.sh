git clone https://github.com/anthonyvetter/argocd-getting-started.git && cd argocd-getting-started
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
watch kubectl get pods -n argocd
kubectl port-forward svc/argocd-server -n argocd 8080:443
kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2

 kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
