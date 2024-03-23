1. Установить утилиту mkcert:
- запустить powershell из под админа
- перейти в папку где будут храниться сертификаты
- выполнить : choco install mkcert
- создать корневой CA сертификат : mkcert -install
- создать сертификат для нужного хоста (или IP): mkcert -pkcs12 192.168.1.10
важно - создастся сертификат с паролем "changeit"
будет создан файл D:\Temp\192.168.1.10.p12

- для смены пароля на этом сертификате
Открыть FireFox - настройки - приватность и защита - внизу Сертификаты - просмотр сертификатов - 
закладка "ваши сертификаты" - импортировать - далее выбираем нужный - сохранить копию - задаем новый пароль


- создать файлы ключа и подписи: mkcert -key-file d:\temp\192_168_1_10.key -cert-file d:\temp\192_168_1_10.crt "192.168.1.10"
в папке D:\Temp будут сохданы 2 файла - 192_168_1_10.key и 192_168_1_10.crt

Для создания сертификата для нескольких dns-имен, выполняем - 
mkcert -key-file ~/Certificates/certificates.key -cert-file ~/Certificates/certificates.crt reactivities recipebook microservices graphql redmango auction auction-api
проверяем:
openssl x509 -noout -ext subjectAltName -in certificates.crt


- в файле .env.development создать записи конфигурации реакта:

	PORT=3000
	HOST=192.168.1.10
	HTTPS=true
	SSL_CRT_FILE=D:\Temp\192_168_1_10.crt
	SSL_KEY_FILE=D:\Temp\192_168_1_10.key

- в файлах appsettings.json создать запись конфигурации Kestrel для работы по https:

  "Kestrel": {
    "Certificates": {
      "Default": {
        "Path": "d:\\temp\\192.168.1.10.p12",
        "Password": "changeit"
      }
    }
  }
