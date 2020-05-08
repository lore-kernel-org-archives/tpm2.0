Content-Type: multipart/mixed; boundary="===============4097250467838123803=="
MIME-Version: 1.0
From: Muthukumar S <muthu.smk at gmail.com>
Subject: [tpm2] Re: How CreateCsr using openssl API flow works ,
 when is passes via tpm2-tss-engine
Date: Sat, 09 May 2020 00:48:20 +0530
Message-ID: <CANGCWd2g1aL2KD7YAcC6OyqoSQ=KtLFfT5P-NQqNsqx8F2_chw@mail.gmail.com>
In-Reply-To: CANGCWd1GwRyoo9nAuyd0TeDV4c_=ziLKrvg7L4wgqdmYMOkD6g@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4097250467838123803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Robets,

After applying the below patch its working fine
https://github.com/tpm2-software/tpm2-abrmd/commit/d3f699d828616280c1245ced=
1ab6a43baca6e63f


It was unfortunate that we are working in older version of tpm2-abrmd..
Hope the latest build will already have this fix. Once again thanks for
your support.

BR,
Muthukumar

On Fri, May 8, 2020 at 11:44 PM Muthukumar S <muthu.smk(a)gmail.com> wrote:

> Hi Roberts,
> Yes , I have loaded the engine.
>
> I have doubt that the issue might be due to abrmd resource management ? on
> reinitialize TCTI device (ref: shared below links)
> Scenario : I am doing two operation in single application
> tpm2tss-rsa-genkey   and then creatingCsr() . Here tpm2tss-rsa-genkey is
> working fine , then am covering the genkey to EVP_PKEY
> and giving it to createcsr. Even inside createcsr app getting crash  when
> the sign API is get called.
>
> *Look in to how to reinitialize TCTI device*
>
> https://github.com/tpm2-software/tpm2-tss/issues/1395
>
> https://github.com/tpm2-software/tpm2-tss/issues/1499
>
> "Device or resource busy" usually means that some other process has it
> open.
> try lsof | grep tpm to catch the sneaky program.
>
>
>
>
>
> On Fri, May 8, 2020, 9:45 PM Roberts, William C <
> william.c.roberts(a)intel.com wrote:
>
>>
>>
>> > -----Original Message-----
>> > From: muthu.smk(a)gmail.com [mailto:muthu.smk(a)gmail.com]
>> > Sent: Friday, May 8, 2020 3:01 AM
>> > To: tpm2(a)lists.01.org
>> > Subject: [tpm2] How CreateCsr using openssl API flow works , when is
>> passes via
>> > tpm2-tss-engine
>> >
>> > I have below openssl command with tpmengine which generate csr using t=
he
>> > private key generated using tpm2tss-genkey.
>> >
>> > /* Generating private using below tpm2tss-genkey API*/ tpm2tss-genkey
>> -a rsa -
>> > s 2048 tpm2tss_rsa_genkey_2048
>> > /* using below openssl API creating a csr with input key (private key
>> generated
>> > by tpm2tss)  , via engine tpm2tss */ openssl req -new -engine tpm2tss
>> -keyform
>> > engine -out openssl_created_mod_rsa_key.csr -key
>> tpm2tss_rsa_genkey_2048
>>
>> Did you load the engine so the API hits the tss engine versus normal
>> openssl?
>> IIRC the last time I saw your code snippets you never loaded the engine.
>> >
>> > While creating the similar application what the above tpm2-genkey
>> creation and
>> > openssl does using tpm2/tpm2-tss api , am getting my app crash in below
>> signing
>> > API . I tried checking the tpm2-tss-engine code which works for openssl
>> to
>> > perform tpm2 tss task . But i could not able to get any clue regarding
>> where this
>> > "sign" is happening .  Since this "sign" is part of csr generation , am
>> not sure how
>> > come the command line above openssl api works . Can any one give me so=
me
>> > inputs on this .
>> >
>> > X509_REQ_sign ()
>> >
>> > Thanks
>> > _______________________________________________
>> > tpm2 mailing list -- tpm2(a)lists.01.org
>> > To unsubscribe send an email to tpm2-leave(a)lists.01.org
>> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>>
>

--===============4097250467838123803==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+SGkgUm9iZXRzLDxkaXY+PGJyPjwvZGl2PjxkaXY+QWZ0ZXIgYXBwbHlp
bmcgdGhlIGJlbG93IHBhdGNoIGl0cyB3b3JraW5nIGZpbmU8L2Rpdj48ZGl2PjxhIGhyZWY9Imh0
dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItYWJybWQvY29tbWl0L2QzZjY5OWQ4
Mjg2MTYyODBjMTI0NWNlZDFhYjZhNDNiYWNhNmU2M2YiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0y
LXNvZnR3YXJlL3RwbTItYWJybWQvY29tbWl0L2QzZjY5OWQ4Mjg2MTYyODBjMTI0NWNlZDFhYjZh
NDNiYWNhNmU2M2Y8L2E+wqA8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pkl0IHdhcyB1bmZvcnR1
bmF0ZSB0aGF0IHdlIGFyZSB3b3JraW5nIGluIG9sZGVyIHZlcnNpb24gb2YgdHBtMi1hYnJtZC4u
IEhvcGUgdGhlIGxhdGVzdCBidWlsZCB3aWxsIGFscmVhZHkgaGF2ZSB0aGlzIGZpeC4gT25jZSBh
Z2FpbiB0aGFua3MgZm9yIHlvdXIgc3VwcG9ydC48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkJS
LDwvZGl2PjxkaXY+TXV0aHVrdW1hcjwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9x
dW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIEZyaSwgTWF5IDgsIDIw
MjAgYXQgMTE6NDQgUE0gTXV0aHVrdW1hciBTICZsdDs8YSBocmVmPSJtYWlsdG86bXV0aHUuc21r
QGdtYWlsLmNvbSI+bXV0aHUuc21rQGdtYWlsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48
YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHgg
MC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0
OjFleCI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9ImF1dG8iPkhpIFJvYmVydHMsPGRpdiBkaXI9
ImF1dG8iPlllcyAsIEkgaGF2ZSBsb2FkZWQgdGhlIGVuZ2luZS48L2Rpdj48ZGl2IGRpcj0iYXV0
byI+PGJyPjwvZGl2PjxkaXYgZGlyPSJhdXRvIj5JIGhhdmUgZG91YnQgdGhhdCB0aGUgaXNzdWUg
bWlnaHQgYmUgZHVlIHRvIGFicm1kIHJlc291cmNlIG1hbmFnZW1lbnQgPyBvbiByZWluaXRpYWxp
emUgVENUSSBkZXZpY2UgKHJlZjogc2hhcmVkIGJlbG93IGxpbmtzKTwvZGl2PjxkaXY+U2NlbmFy
aW8gOiBJIGFtIGRvaW5nIHR3byBvcGVyYXRpb24gaW4gc2luZ2xlIGFwcGxpY2F0aW9uIHRwbTJ0
c3MtcnNhLWdlbmtlecKgIMKgYW5kIHRoZW4gY3JlYXRpbmdDc3IoKSAuIEhlcmUgdHBtMnRzcy1y
c2EtZ2Vua2V5IGlzIHdvcmtpbmcgZmluZSAsIHRoZW4gYW0gY292ZXJpbmcgdGhlIGdlbmtleSB0
byBFVlBfUEtFWTwvZGl2PjxkaXY+YW5kIGdpdmluZyBpdCB0byBjcmVhdGVjc3IuIEV2ZW4gaW5z
aWRlIGNyZWF0ZWNzciBhcHAgZ2V0dGluZyBjcmFzaMKgIHdoZW4gdGhlIHNpZ24gQVBJIGlzIGdl
dCBjYWxsZWQuwqDCoDwvZGl2PjxkaXYgZGlyPSJhdXRvIj48YnI+PC9kaXY+PGRpdiBkaXI9ImF1
dG8iPjxiIHN0eWxlPSJmb250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2VyaWY7Zm9udC1zaXplOjEx
cHQiPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+TG9vayBpbiB0byBob3cgdG8gcmVpbml0aWFs
aXplIFRDVEkgZGV2aWNlPC9zcGFuPjwvYj48YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPgoKPHAg
Y2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2xpbmUtaGVp
Z2h0Om5vcm1hbDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjpp
bml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7
YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDt2ZXJ0aWNh
bC1hbGlnbjpiYXNlbGluZTtmb250LXNpemU6MTFwdDtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMt
c2VyaWYiPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIu
Y29tL3RwbTItc29mdHdhcmUvdHBtMi10c3MvaXNzdWVzLzEzOTUiIHN0eWxlPSJjb2xvcjpibHVl
IiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10
c3MvaXNzdWVzLzEzOTU8L2E+PC9zcGFuPjwvcD4KCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxl
PSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDtsaW5lLWhlaWdodDpub3JtYWw7YmFja2dyb3VuZC1p
bWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNrZ3JvdW5kLXNpemU6
aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQtb3JpZ2luOmluaXRp
YWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7dmVydGljYWwtYWxpZ246YmFzZWxpbmU7Zm9udC1z
aXplOjExcHQ7Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48c3BhbiBzdHlsZT0iY29s
b3I6YmxhY2siPjxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTIt
dHNzL2lzc3Vlcy8xNDk5IiBzdHlsZT0iY29sb3I6Ymx1ZSIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBz
Oi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdHNzL2lzc3Vlcy8xNDk5PC9hPjwvc3Bh
bj48L3A+Cgo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAx
cHQgMzZwdDtsaW5lLWhlaWdodDpub3JtYWw7Zm9udC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6Q2Fs
aWJyaSxzYW5zLXNlcmlmIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEwLjVwdDtmb250LWZhbWls
eTomcXVvdDtTZWdvZSBVSSZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOnJlZCI+JnF1b3Q7RGV2aWNl
IG9yCnJlc291cmNlIGJ1c3kmcXVvdDsgdXN1YWxseSBtZWFucyB0aGF0IHNvbWUgb3RoZXIgcHJv
Y2VzcyBoYXMgaXQgb3Blbi48YnI+CnRyecKgPC9zcGFuPjxzcGFuIHN0eWxlPSJmb250LXNpemU6
OXB0O2ZvbnQtZmFtaWx5OkNvbnNvbGFzO2NvbG9yOnJlZCI+bHNvZiB8IGdyZXAgdHBtPC9zcGFu
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTAuNXB0O2ZvbnQtZmFtaWx5OiZxdW90O1NlZ29lIFVJ
JnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6cmVkIj7CoHRvCmNhdGNoIHRoZSBzbmVha3kgcHJvZ3Jh
bS48L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAw
LjAwMDFwdCAzNnB0O2xpbmUtaGVpZ2h0Om5vcm1hbDtmb250LXNpemU6MTFwdDtmb250LWZhbWls
eTpDYWxpYnJpLHNhbnMtc2VyaWYiPjxicj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9
Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0IDM2cHQ7bGluZS1oZWlnaHQ6bm9ybWFsO2ZvbnQtc2l6
ZToxMXB0O2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fucy1zZXJpZiI+PGJyPjwvcD48cCBjbGFzcz0i
TXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQgMzZwdDtsaW5lLWhlaWdo
dDpub3JtYWw7Zm9udC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48
YnI+PC9wPjwvZGl2PjwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRp
diBkaXI9Imx0ciI+T24gRnJpLCBNYXkgOCwgMjAyMCwgOTo0NSBQTSBSb2JlcnRzLCBXaWxsaWFt
IEMgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdl
dD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+IHdyb3RlOjxicj48L2Rp
dj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAw
cHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1s
ZWZ0OjFleCI+PGJyPgo8YnI+CiZndDsgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS08YnI+CiZn
dDsgRnJvbTogPGEgaHJlZj0ibWFpbHRvOm11dGh1LnNta0BnbWFpbC5jb20iIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPm11dGh1LnNta0BnbWFpbC5jb208L2E+IFttYWlsdG86PGEg
aHJlZj0ibWFpbHRvOm11dGh1LnNta0BnbWFpbC5jb20iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPm11dGh1LnNta0BnbWFpbC5jb208L2E+XTxicj4KJmd0OyBTZW50OiBGcmlkYXks
IE1heSA4LCAyMDIwIDM6MDEgQU08YnI+CiZndDsgVG86IDxhIGhyZWY9Im1haWx0bzp0cG0yQGxp
c3RzLjAxLm9yZyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4w
MS5vcmc8L2E+PGJyPgomZ3Q7IFN1YmplY3Q6IFt0cG0yXSBIb3cgQ3JlYXRlQ3NyIHVzaW5nIG9w
ZW5zc2wgQVBJIGZsb3cgd29ya3MgLCB3aGVuIGlzIHBhc3NlcyB2aWE8YnI+CiZndDsgdHBtMi10
c3MtZW5naW5lPGJyPgomZ3Q7IDxicj4KJmd0OyBJIGhhdmUgYmVsb3cgb3BlbnNzbCBjb21tYW5k
IHdpdGggdHBtZW5naW5lIHdoaWNoIGdlbmVyYXRlIGNzciB1c2luZyB0aGU8YnI+CiZndDsgcHJp
dmF0ZSBrZXkgZ2VuZXJhdGVkIHVzaW5nIHRwbTJ0c3MtZ2Vua2V5Ljxicj4KJmd0OyA8YnI+CiZn
dDsgLyogR2VuZXJhdGluZyBwcml2YXRlIHVzaW5nIGJlbG93IHRwbTJ0c3MtZ2Vua2V5IEFQSSov
IHRwbTJ0c3MtZ2Vua2V5IC1hIHJzYSAtPGJyPgomZ3Q7IHMgMjA0OCB0cG0ydHNzX3JzYV9nZW5r
ZXlfMjA0ODxicj4KJmd0OyAvKiB1c2luZyBiZWxvdyBvcGVuc3NsIEFQSSBjcmVhdGluZyBhIGNz
ciB3aXRoIGlucHV0IGtleSAocHJpdmF0ZSBrZXkgZ2VuZXJhdGVkPGJyPgomZ3Q7IGJ5IHRwbTJ0
c3MpwqAgLCB2aWEgZW5naW5lIHRwbTJ0c3MgKi8gb3BlbnNzbCByZXEgLW5ldyAtZW5naW5lIHRw
bTJ0c3MgLWtleWZvcm08YnI+CiZndDsgZW5naW5lIC1vdXQgb3BlbnNzbF9jcmVhdGVkX21vZF9y
c2Ffa2V5LmNzciAta2V5wqAgdHBtMnRzc19yc2FfZ2Vua2V5XzIwNDg8YnI+Cjxicj4KRGlkIHlv
dSBsb2FkIHRoZSBlbmdpbmUgc28gdGhlIEFQSSBoaXRzIHRoZSB0c3MgZW5naW5lIHZlcnN1cyBu
b3JtYWwgb3BlbnNzbD88YnI+CklJUkMgdGhlIGxhc3QgdGltZSBJIHNhdyB5b3VyIGNvZGUgc25p
cHBldHMgeW91IG5ldmVyIGxvYWRlZCB0aGUgZW5naW5lLjxicj4KJmd0OyA8YnI+CiZndDsgV2hp
bGUgY3JlYXRpbmcgdGhlIHNpbWlsYXIgYXBwbGljYXRpb24gd2hhdCB0aGUgYWJvdmUgdHBtMi1n
ZW5rZXkgY3JlYXRpb24gYW5kPGJyPgomZ3Q7IG9wZW5zc2wgZG9lcyB1c2luZyB0cG0yL3RwbTIt
dHNzIGFwaSAsIGFtIGdldHRpbmcgbXkgYXBwIGNyYXNoIGluIGJlbG93IHNpZ25pbmc8YnI+CiZn
dDsgQVBJIC4gSSB0cmllZCBjaGVja2luZyB0aGUgdHBtMi10c3MtZW5naW5lIGNvZGUgd2hpY2gg
d29ya3MgZm9yIG9wZW5zc2wgdG88YnI+CiZndDsgcGVyZm9ybSB0cG0yIHRzcyB0YXNrIC4gQnV0
IGkgY291bGQgbm90IGFibGUgdG8gZ2V0IGFueSBjbHVlIHJlZ2FyZGluZyB3aGVyZSB0aGlzPGJy
PgomZ3Q7ICZxdW90O3NpZ24mcXVvdDsgaXMgaGFwcGVuaW5nIC7CoCBTaW5jZSB0aGlzICZxdW90
O3NpZ24mcXVvdDsgaXMgcGFydCBvZiBjc3IgZ2VuZXJhdGlvbiAsIGFtIG5vdCBzdXJlIGhvdzxi
cj4KJmd0OyBjb21lIHRoZSBjb21tYW5kIGxpbmUgYWJvdmUgb3BlbnNzbCBhcGkgd29ya3MgLiBD
YW4gYW55IG9uZSBnaXZlIG1lIHNvbWU8YnI+CiZndDsgaW5wdXRzIG9uIHRoaXMgLjxicj4KJmd0
OyA8YnI+CiZndDsgWDUwOV9SRVFfc2lnbiAoKTxicj4KJmd0OyA8YnI+CiZndDsgVGhhbmtzPGJy
PgomZ3Q7IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fPGJy
PgomZ3Q7IHRwbTIgbWFpbGluZyBsaXN0IC0tIDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAx
Lm9yZyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8
L2E+PGJyPgomZ3Q7IFRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gPGEgaHJlZj0ibWFp
bHRvOnRwbTItbGVhdmVAbGlzdHMuMDEub3JnIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj50cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzwvYT48YnI+CiZndDsgJSh3ZWJfcGFnZV91cmwp
c2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM8YnI+CjwvYmxvY2txdW90ZT48
L2Rpdj4KPC9ibG9ja3F1b3RlPjwvZGl2Pgo=

--===============4097250467838123803==--

