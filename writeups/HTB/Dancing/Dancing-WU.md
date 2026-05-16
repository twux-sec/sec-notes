
#wip #done #htb #starting-point #smb #misconfiguration #anonymous-access`

Plateforme:  HTB
Difficulté: Easy
Date:  07/04/2026

---

## Énoncé

Dancing is a very easy Windows machine which introduces the Server Message Block (SMB) protocol, its enumeration and its exploitation when misconfigured to allow access without a password.
## Recon

Nmap again ! 

![[Pasted image 20260407101359.png]]
ok, smb open 

Now, listing 

![[Pasted image 20260407102200.png]]
## Tentatives

WorkShares, open without password.
Let's try

![[Pasted image 20260407102316.png]]

Search in folder and i find flag, again `get` and done ! 


## Flag

`[REDACTED]`

---

## Notes en vrac


## Questions / à creuser

-