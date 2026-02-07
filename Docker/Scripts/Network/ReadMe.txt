Устанавливаем ingress:

Сначала ставим основной сервис:

Либо напрямую из Интернета (обновляются):
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.14.3/deploy/static/provider/cloud/deploy.yaml

Либо из готового yaml-файла:
/home/alex/Docs/Docker/Scripts/Network/ingress_deploy.yaml

kubectl get pods -n ingress-nginx
kubectl get services -n ingress-nginx
kubectl describe svc -n ingress-nginx ingress-nginx-controller


Делаем секрет в кубере для https:
cd /files/Certificates
kubectl create secret tls my-cert --namespace=default --key=certificates.key --cert=certificates.crt -o yaml

Далее ставим уже свои настройки:
kubectl apply -f ingress-service.yaml

Важно - через настройки ингресса появляется возможность обращаться к развернутым ЛОКАЛЬНО сайтам по сертификатам используя HTTPS, например - автоматически перенаправляется запрос с https://elk на http://localhost:5601 по защищенному соединению (исполльзуя сертификат, размещенный в кубере)
