---
layout: post
title: "Mount Yandex.Disk in Ubuntu or Other Linux"
date: 2012-04-24 06:03:50
comments: true
categories:
- soft
---

[Яндекс.Диск](https://disk.yandex.ru/invite/?hash=9GMQ37ZU "Яндекс.Диск") is free 10Gb [WebDav](http://help.yandex.ru/disk/webdav.xml "Доступ к Диску через WebDAV — Яндекс.Помощь. Диск") storage.

    sudo apt-get install davfs2
    mkdir ~/yandex

    cat "https://webdav.yandex.ru /home/user/yandex   davfs   user,rw,noauto   0   0" >> /etc/fstab

    cat "/home/user/yandex user@ya.ru "password"" >> ~/.davfs2/secrets
