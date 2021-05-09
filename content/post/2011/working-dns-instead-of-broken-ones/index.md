---
tags:
- russian
- software
date: 2011-03-04T17:34:29Z
title: Работающие DNS на замену нерабочих
description: Как настроить DNS в случае проблем

---

Когда DNS сервер перестаёт работать — ваш компьютер не получает ответ на свой запрос адреса того или иного домена, и не может открывать сайты, так как не знает их IP-адреса. Скайп же продолжает работать, так как он не использует домены — он подключается к своему серверу по IP; открытые в браузере сайты продолжают работать, так как компьютер уже знает их IP, и знает, по какому адресу посылать запросы. Как сделать так, чтобы страницы нормально открывались, я напишу чуть ниже.

<!--more-->

Для начала расскажу, что такое DNS (Domain Name System), и зачем он нужен вам.

Вот пример выполнения команды ping, считающей время, за которое сетевой пакет дойдёт до сервера и вернётся к нашему компьютеру:

``` bash
paskal@paskal-eeepc ~ $ ping yandex.ru
PING yandex.ru (77.88.55.55) 56(84) bytes of data.
64 bytes from www.yandex.ru (77.88.55.55): icmp_seq=1 ttl=54 time=26.0 ms
--- ya.ru ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 26.081/26.081/26.081/0.000 ms
```

Мы узнали, что, когда я зайду на Яндекс со своего компьютера, я получаю страничку с их сервера, располагающегося по адресу [77.88.55.55](http://77.88.55.55/) — вы можете кликнуть, и у вас откроется главная страница Яндекса. Откуда ваш компьютер узнал, что yandex.ru на самом деле нужно искать по этому IP-адресу? От DNS-сервера, который как раз и отвечает за то, чтобы каждый обратившийся к нему получил в ответ нужный IP-адрес (вида 50.16.185.121) на запрос домена (вида [terrty.net](https://terrty.net/)). (Больше информации интересующиеся найдут на странице [Википедии о DNS](https://ru.wikipedia.org/wiki/DNS)).

Итак, у вас время от времени бывает, что новые страницы перестают открываться, в то время как старые продолжают работать — чтобы это починить, нам потребуется заменить DNS сервера провайдера на более надёжные.

Для изменения их на компьютере, если вы не знаете, как это сделать, я советую поискать слово «DNS» в поиске по «Помощи» вашей операционной системы — там точно есть эта информация. Если вы хотите попробовать разобраться методом тыка — ищите в свойствах сетевого подключения.

Для изменения их на роутере (предпочтительный вариант, мы починим проблему сразу на всех устройствах, подключенных к роутеру), поищите пункт типа «DNS server» в настройках Internet (или WAN).

Главная часть: **откуда взять рабочие DNS-сервера**? Моя рекомендация - у [Яндекса](https://dns.yandex.ru/ "Яндекс.DNS"):

**`77.88.8.88`**

**`77.88.8.2`**

Здесь приведены адреса **Безопасного режима** с защитой от мошенников и вирусов, дополнительная информация доступна [по ссылке](https://dns.yandex.ru/advanced/ "Технические подробности"). Помимо этого режима вас может заинтересовать **Семейный** - лёгкий способ оградить детей от значительного количества контента для взрослых.

IP серверов [Google](https://developers.google.com/speed/public-dns/docs/using?csw=1) — просто работают:

**`8.8.8.8`**

**`8.8.4.4`**