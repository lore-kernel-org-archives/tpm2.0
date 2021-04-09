Content-Type: multipart/mixed; boundary="===============2244642032308188655=="
MIME-Version: 1.0
From: =?utf-8?q?Jo=C3=A3o_Lima_=3Cjlima_at_cloudflare=2Ecom=3E?=
Subject: [tpm2] Programatically obtaining session handle -
 tpm2_session_get_handle()
Date: Fri, 09 Apr 2021 17:38:47 +0100
Message-ID: <CAMMN_YBtKOCZEb9R-HN1aMfXEeiiDOJv3zwP28Nf37_C7x5SKw@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2244642032308188655==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello folks!

I've been trying to cobble together an implementation for a ContextLoad and
ContextSave tpm2_tool, so that one can save a session context to the TPM
and get the session handle for it. The reasoning is to have a way to
manipulate policy validation using tpm2_tools, but then have the saved
session context be converted to the TPM handle, so that it can be passed to
the kernel keyring trusted keys subsystem.

It seems I have most of it working (was really a matter of just copying
what's done on other commands), except for the bit where I get the session
handle itself. I was expecting to get the session handle through the
tpm2_session_get_handle() command, but instead I'm getting a handle on the
permanent object handle space (MSO 0x40).

This is the verbose output I get for tpm2_startauthsession:

tpm2_startauthsession --policy-session -S session.dat -V
INFO on line: "403" in file: "lib/tpm2_session.c": Saved session:
ESYS_TR(0x40418477)
INFO on line: "246" in file: "lib/files.c": Save TPMS_CONTEXT->savedHandle:
0x3000000

This is the verbose output for the new command (tpm2_contextload):

tpm2_contextload -S session.dat -V
INFO on line: "418" in file: "lib/files.c": Assuming tpm context file
INFO on line: "349" in file: "lib/files.c": load:
TPMS_CONTEXT->savedHandle: 0x3000000
INFO on line: "306" in file: "lib/tpm2_session.c": Restored session:
ESYS_TR(0x40418477) attrs(0x1)
session handle: 0x40418477

I'm calling tpm2_get_session_handle() over the tpm2_session object,
expecting to get the 0x3000000 but am getting 0x40418477 instead. Here's
the commit for reference:
https://github.com/jopelima/tpm2-tools/commit/be3d011d86531f45cc820d244329c=
451e246034f

Can anyone help me get the right handle here?

Thanks in advance.

Kind regards,

*Jo=C3=A3o Lima*  |  Infrastructure Security Engineer
jlima(a)cloudflare.com
cell: (+351) 914 907 591 <(+351)+914+907+591>
<https://www.cloudflare.com/>

1 888 99 FLARE  |  www.cloudflare.com

--===============2244642032308188655==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+SGVsbG8gZm9sa3MhPGRpdj48YnI+PC9kaXY+PGRpdj5JJiMzOTt2ZSBi
ZWVuIHRyeWluZyB0byBjb2JibGUgdG9nZXRoZXIgYW4gaW1wbGVtZW50YXRpb24gZm9yIGEgQ29u
dGV4dExvYWQgYW5kIENvbnRleHRTYXZlIHRwbTJfdG9vbCwgc28gdGhhdCBvbmUgY2FuIHNhdmUg
YSBzZXNzaW9uIGNvbnRleHQgdG8gdGhlIFRQTSBhbmQgZ2V0IHRoZSBzZXNzaW9uIGhhbmRsZSBm
b3IgaXQuIFRoZSByZWFzb25pbmcgaXMgdG8gaGF2ZSBhIHdheSB0byBtYW5pcHVsYXRlIHBvbGlj
eSB2YWxpZGF0aW9uIHVzaW5nIHRwbTJfdG9vbHMsIGJ1dCB0aGVuIGhhdmUgdGhlIHNhdmVkIHNl
c3Npb24gY29udGV4dCBiZSBjb252ZXJ0ZWQgdG8gdGhlIFRQTSBoYW5kbGUsIHNvIHRoYXQgaXQg
Y2FuIGJlIHBhc3NlZCB0byB0aGUga2VybmVsIGtleXJpbmcgdHJ1c3RlZCBrZXlzIHN1YnN5c3Rl
bS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pkl0IHNlZW1zIEkgaGF2ZSBtb3N0IG9mIGl0IHdv
cmtpbmcgKHdhcyByZWFsbHkgYSBtYXR0ZXIgb2YganVzdCBjb3B5aW5nIHdoYXQmIzM5O3MgZG9u
ZSBvbiBvdGhlciBjb21tYW5kcyksIGV4Y2VwdCBmb3IgdGhlIGJpdCB3aGVyZSBJIGdldCB0aGUg
c2Vzc2lvbiBoYW5kbGUgaXRzZWxmLiBJIHdhcyBleHBlY3RpbmcgdG8gZ2V0IHRoZSBzZXNzaW9u
IGhhbmRsZSB0aHJvdWdoIHRoZSB0cG0yX3Nlc3Npb25fZ2V0X2hhbmRsZSgpIGNvbW1hbmQsIGJ1
dCBpbnN0ZWFkIEkmIzM5O20gZ2V0dGluZyBhIGhhbmRsZSBvbiB0aGUgcGVybWFuZW50IG9iamVj
dCBoYW5kbGUgc3BhY2UgKE1TTyAweDQwKS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlRoaXMg
aXMgdGhlIHZlcmJvc2Ugb3V0cHV0IEkgZ2V0IGZvciB0cG0yX3N0YXJ0YXV0aHNlc3Npb246PC9k
aXY+PGRpdj48YnI+PC9kaXY+PGRpdj50cG0yX3N0YXJ0YXV0aHNlc3Npb24gLS1wb2xpY3ktc2Vz
c2lvbiAtUyBzZXNzaW9uLmRhdCAtVjxicj5JTkZPIG9uIGxpbmU6ICZxdW90OzQwMyZxdW90OyBp
biBmaWxlOiAmcXVvdDtsaWIvdHBtMl9zZXNzaW9uLmMmcXVvdDs6IFNhdmVkIHNlc3Npb246IEVT
WVNfVFIoMHg0MDQxODQ3Nyk8YnI+SU5GTyBvbiBsaW5lOiAmcXVvdDsyNDYmcXVvdDsgaW4gZmls
ZTogJnF1b3Q7bGliL2ZpbGVzLmMmcXVvdDs6IFNhdmUgVFBNU19DT05URVhULSZndDtzYXZlZEhh
bmRsZTogMHgzMDAwMDAwPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGlzIGlzIHRoZSB2ZXJi
b3NlIG91dHB1dCBmb3IgdGhlIG5ldyBjb21tYW5kICh0cG0yX2NvbnRleHRsb2FkKTo8L2Rpdj48
ZGl2Pjxicj48L2Rpdj50cG0yX2NvbnRleHRsb2FkIC1TIHNlc3Npb24uZGF0IC1WPGJyPklORk8g
b24gbGluZTogJnF1b3Q7NDE4JnF1b3Q7IGluIGZpbGU6ICZxdW90O2xpYi9maWxlcy5jJnF1b3Q7
OiBBc3N1bWluZyB0cG0gY29udGV4dCBmaWxlPGJyPklORk8gb24gbGluZTogJnF1b3Q7MzQ5JnF1
b3Q7IGluIGZpbGU6ICZxdW90O2xpYi9maWxlcy5jJnF1b3Q7OiBsb2FkOiBUUE1TX0NPTlRFWFQt
Jmd0O3NhdmVkSGFuZGxlOiAweDMwMDAwMDA8YnI+SU5GTyBvbiBsaW5lOiAmcXVvdDszMDYmcXVv
dDsgaW4gZmlsZTogJnF1b3Q7bGliL3RwbTJfc2Vzc2lvbi5jJnF1b3Q7OiBSZXN0b3JlZCBzZXNz
aW9uOiBFU1lTX1RSKDB4NDA0MTg0NzcpIGF0dHJzKDB4MSk8YnI+PGRpdj5zZXNzaW9uIGhhbmRs
ZTogMHg0MDQxODQ3NzwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSYjMzk7bSBjYWxsaW5nIHRw
bTJfZ2V0X3Nlc3Npb25faGFuZGxlKCkgb3ZlciB0aGUgdHBtMl9zZXNzaW9uIG9iamVjdCwgZXhw
ZWN0aW5nIHRvIGdldCB0aGUgMHgzMDAwMDAwIGJ1dCBhbSBnZXR0aW5nwqAweDQwNDE4NDc3IGlu
c3RlYWQuIEhlcmUmIzM5O3MgdGhlIGNvbW1pdCBmb3IgcmVmZXJlbmNlOsKgPGEgaHJlZj0iaHR0
cHM6Ly9naXRodWIuY29tL2pvcGVsaW1hL3RwbTItdG9vbHMvY29tbWl0L2JlM2QwMTFkODY1MzFm
NDVjYzgyMGQyNDQzMjljNDUxZTI0NjAzNGYiPmh0dHBzOi8vZ2l0aHViLmNvbS9qb3BlbGltYS90
cG0yLXRvb2xzL2NvbW1pdC9iZTNkMDExZDg2NTMxZjQ1Y2M4MjBkMjQ0MzI5YzQ1MWUyNDYwMzRm
PC9hPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+Q2FuIGFueW9uZSBoZWxwIG1lIGdldCB0aGUg
cmlnaHQgaGFuZGxlIGhlcmU/PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3MgaW4gYWR2
YW5jZS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PktpbmQgcmVnYXJkcyw8L2Rpdj48ZGl2Pjxk
aXY+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX3NpZ25hdHVyZSIgZGF0YS1zbWFydG1haWw9
ImdtYWlsX3NpZ25hdHVyZSI+PGRpdiBkaXI9Imx0ciI+PHAgc3R5bGU9ImZvbnQtZmFtaWx5Okhl
bHZldGljYTtmb250LXNpemU6MTJweDtjb2xvcjpyZ2IoNjQsNjQsNjQpIj48Yj5Kb8OjbyBMaW1h
PC9iPsKgwqB8wqDCoEluZnJhc3RydWN0dXJlIFNlY3VyaXR5IEVuZ2luZWVyPGJyPjxhIGhyZWY9
Im1haWx0bzpqbGltYUBjbG91ZGZsYXJlLmNvbSIgc3R5bGU9ImNvbG9yOnJnYig0NywxMjMsMTkx
KSIgdGFyZ2V0PSJfYmxhbmsiPmpsaW1hQGNsb3VkZmxhcmUuY29tPC9hPjxicj5jZWxsOsKgPGEg
aHJlZj0idGVsOigrMzUxKSs5MTQrOTA3KzU5MSIgc3R5bGU9ImNvbG9yOnJnYig0NywxMjMsMTkx
KSIgdGFyZ2V0PSJfYmxhbmsiPigrMzUxKSA5MTQgOTA3IDU5MTwvYT48L3A+PGEgaHJlZj0iaHR0
cHM6Ly93d3cuY2xvdWRmbGFyZS5jb20vIiBzdHlsZT0iZm9udC1mYW1pbHk6VGltZXM7Zm9udC1z
aXplOm1lZGl1bSIgdGFyZ2V0PSJfYmxhbmsiPjxpbWcgc3JjPSJodHRwczovL3MzLmFtYXpvbmF3
cy5jb20vc3RhdHVzcGFnZS1wcm9kdWN0aW9uL3BhZ2VzLXRyYW5zYWN0aW9uYWxfbG9nb3MvcmV0
aW5hLzc4MDkvSkFWcWp6YzFRMzJZOXphanpwNEYiIHN0eWxlPSJoZWlnaHQ6MzBweDttYXJnaW4t
dG9wOjEwcHgiPjwvYT48cCBzdHlsZT0iZm9udC1mYW1pbHk6SGVsdmV0aWNhO2ZvbnQtc2l6ZTox
MnB4O2NvbG9yOnJnYig2NCw2NCw2NCkiPjEgODg4IDk5IEZMQVJFwqDCoHzCoMKgPGEgaHJlZj0i
aHR0cHM6Ly93d3cuY2xvdWRmbGFyZS5jb20vIiBzdHlsZT0iY29sb3I6cmdiKDQ3LDEyMywxOTEp
IiB0YXJnZXQ9Il9ibGFuayI+d3d3LmNsb3VkZmxhcmUuY29tPC9hPjwvcD48L2Rpdj48L2Rpdj48
L2Rpdj48L2Rpdj48L2Rpdj4K

--===============2244642032308188655==--

