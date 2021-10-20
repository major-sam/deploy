Инструкцию по обновлению:

С откатом  обновить Kernel, UNI, Legacy COM, Legacy RU. KRM Релиз 1.0.5039 в Octopus (release 08.10.2021) https://deploy-srv.gkbaltbet.local/app#/Spaces-1/projects/kerneluniweb-vm/deployments/releases/1.0.5039


Обновление базы BaltBetM, BaltBetMMirror, BaltBetWeb ( парсер в этот раз не нужен)
у себя в Powershell
Invoke-Command -FilePath '\\server\tcbuild$\Testers\_VM Update Instructions\08.10.2021 RELEASE\08.10.2021 RELEASE.ps1' -ComputerName <ИМЯ_ПК>

Пример:
Invoke-Command -FilePath '\\server\tcbuild$\Testers\_VM Update Instructions\08.10.2021 RELEASE\08.10.2021 RELEASE.ps1' -ComputerName  VM-HM1-WS6

Можно скопировать run.ps1 к себе и запустить .\run.ps1 -Machine VM16
1. Обновить Auth сервис из \\server\tcbuild$\Testers\_VM Update Instructions\08.10.2021 RELEASE\Auth\ (оставив старый web.config) 
2. WebTouch  \\server\tcbuild$\Testers\_VM Update Instructions\08.10.2021 RELEASE\WebTouchDev\2021-10-11.master.1034.65a0b7b8.zip в C:\inetpub\Mobile   
3. PDA \\server\tcbuild$\Testers\_VM Update Instructions\08.10.2021 RELEASE\WebPda\2021-10-11.master.1024.f463408c.zip  в C:\inetpub\baltplaymobile  

4. Обновление сервисов 

4.1 Сервис CupisIntegrationService
 - Копируем \\server\tcbuild$\Testers\_VM Update Instructions\01.10.2021 RELEASE\CupisIntegrationService\1.0.0.93\в C:\inetpub\CupisIntegrationService
- вызвать (доменное имя должно соответствовать ВМ) https://vm5-p3.bb-webapps.com:4453/management/requests из FireFox

4.2 Сервис Uni.PaymentsService Копировать от сюда \\server\tcbuild$\Testers\_VM Update Instructions\01.10.2021 RELEASE\Uni.PaymentsService\1.0.0.20 \ и вставить сюда C:\inetpub\Uni.PaymentsService
- В appsetting.json поменять домен vm5-p3 на актуальную ВМ.

5. В админке сайта UNI  "Настройки идентификации" - "Адрес Ецупис (Идентификация ЕСИА) добавить адрес Ецупис https://wallet.1cupis.ru/auth


                 
