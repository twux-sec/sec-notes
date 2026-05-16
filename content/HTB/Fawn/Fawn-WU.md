

Plateforme: HTB
Difficulté: Easy
Date: 07/04/2026

#htb #starting-point #ftp #misconfiguration #anonymous-access #done
---

## Énoncé

"Fawn is a very easy Linux machine which explores the File Transfer Protocol (FTP) and its exploitation when misconfigured to allow anonymous access."

## Recon

`nmp -sV Target`
vsftpd 3.0.3 running

## Tentatives

Connect with 'ftp anonymous@targetIP' 
![[Pasted image 20260407095419.png]]
## Trouvé

![[Pasted image 20260407095734.png]]

Then we use get for DL flag.txt and open with cat
## Flag


`[REDACTED]`

---

## Notes en vrac


## Questions / à creuser

-