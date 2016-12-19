---
layout: post
title:  "Transparent Port Forwarding"
date:   2016-09-05 14:00:00 +0200
categories: update
tags:
    - prototyping
    - notetoself
---

I just wanted to share how I solved a little problem:

I have one device that is connected to two networks: A and B. The A network is semi-public, and network B is completely private. I would like to connect from a device on network A, to a specific socket on a device on Network B.

To do this, I need to forward a public port from Network A on my middle device, to a private port and IP on Network B. Heres what I did:

```bash
socat TCP-LISTEN:4567, fork TCP:192.168.10.20:1234
```

## Ugly diagram:

```
|        Network A         |         Nework B          |
<public device> --- <bridge device> --- <private device>

connect port 4567 --------->
                           forward port 1234 ---------->
                           <-------------------- respond
<--------------------respond
```