Устанавливаем ingress:

Сначала ставим основной сервис:

Либо напрямую из Интернета:
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.11.0/deploy/static/provider/cloud/deploy.yaml

Либо из готового yaml-файла:
/home/alex/Docs/Docker/Scripts/Network/ingress_deploy.yaml

kubectl get pods -n ingress-nginx
kubectl get services -n ingress-nginx
kubectl describe svc -n ingress-nginx ingress-nginx-controller


Делаем секрет в кубере для https:
cd /var/certificates
kubectl create secret tls my-cert --namespace=default --key=certificates.key --cert=certificates.crt -o yaml

Далее ставим уже свои настройки:
kubectl apply -f ingress-service.yaml
