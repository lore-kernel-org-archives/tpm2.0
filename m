Content-Type: multipart/mixed; boundary="===============6712757975346083976=="
MIME-Version: 1.0
From: =?utf-8?q?Jo=C3=A3o_Lima_=3Cjlima_at_cloudflare=2Ecom=3E?=
Subject: [tpm2] Re: Programatically obtaining session handle -
 tpm2_session_get_handle()
Date: Thu, 15 Apr 2021 16:37:23 +0100
Message-ID: <CAMMN_YC2SmS-krGzJF3ZNNFHXVdonWABV3BOf0VL3sM7025sOg@mail.gmail.com>
In-Reply-To: SN6PR11MB34373BB9E84835DEB0C684A7B84E9@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6712757975346083976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks William,

The Esys_TR_GetTpmHandle() tip works, I'll proceed with the discussion on
github regarding your enhancement to tpm2_sessionconfig.

Kind regards,

*Jo=C3=A3o Lima*  |  Infrastructure Security Engineer
jlima(a)cloudflare.com
cell: (+351) 914 907 591 <(+351)+914+907+591>
<https://www.cloudflare.com/>

1 888 99 FLARE  |  www.cloudflare.com


On Wed, Apr 14, 2021 at 10:58 PM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

> Also, if you can confirm it works as expected in a reply or on github,
> that would be helpful.
> ------------------------------
> *From:* Roberts, William C <william.c.roberts(a)intel.com>
> *Sent:* Wednesday, April 14, 2021 3:03 PM
> *To:* Jo=C3=A3o Lima <jlima(a)cloudflare.com>; tpm2(a)lists.01.org <
> tpm2(a)lists.01.org>
> *Subject:* [tpm2] Re: Programatically obtaining session handle -
> tpm2_session_get_handle()
>
> The function ESYS_TR tpm2_session_get_handle(tpm2_session *session),
> returns an ESYS_TR object. Which is an opaque handle, so you cant use the
> various masks to figure out what it is.
>
> However, you can pass that ESYS_TR to
>
> TSS2_RC Esys_TR_GetTpmHandle(ESYS_CONTEXT * esys_context, ESYS_TR
> esys_handle,
>                   TPM2_HANDLE * tpm_handle)
>
> Which will return the RAW tpm handle you could pass to the kernel keyring.
>
>
> There is a tool called tpm2_sessionconfig I added this feature there:
> https://github.com/tpm2-software/tpm2-tools/pull/2700
>
> I asked Imran to stage it for 5.1, lets see if that's possible.
>
> -------------------------
>
>
> From: Jo=C3=A3o Lima <jlima(a)cloudflare.com>
> Sent: Friday, April 9, 2021 11:38 AM
> To: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
> Subject: [tpm2] Programatically obtaining session handle -
> tpm2_session_get_handle()
>
> Hello folks!
>
> I've been trying to cobble together an implementation for a ContextLoad
> and ContextSave tpm2_tool, so that one can save a session context to the
> TPM and get the session handle for it. The reasoning is to have a way to
> manipulate policy validation using tpm2_tools, but then have the saved
> session context be converted to the TPM handle, so that it can be passed =
to
> the kernel keyring trusted keys subsystem.
>
> It seems I have most of it working (was really a matter of just copying
> what's done on other commands), except for the bit where I get the session
> handle itself. I was expecting to get the session handle through the
> tpm2_session_get_handle() command, but instead I'm getting a handle on the
> permanent object handle space (MSO 0x40).
>
> This is the verbose output I get for tpm2_startauthsession:
>
> tpm2_startauthsession --policy-session -S session.dat -V
> INFO on line: "403" in file: "lib/tpm2_session.c": Saved session:
> ESYS_TR(0x40418477)
> INFO on line: "246" in file: "lib/files.c": Save
> TPMS_CONTEXT->savedHandle: 0x3000000
>
> This is the verbose output for the new command (tpm2_contextload):
>
> tpm2_contextload -S session.dat -V
> INFO on line: "418" in file: "lib/files.c": Assuming tpm context file
> INFO on line: "349" in file: "lib/files.c": load:
> TPMS_CONTEXT->savedHandle: 0x3000000
> INFO on line: "306" in file: "lib/tpm2_session.c": Restored session:
> ESYS_TR(0x40418477) attrs(0x1)
> session handle: 0x40418477
>
> I'm calling tpm2_get_session_handle() over the tpm2_session object,
> expecting to get the 0x3000000 but am getting 0x40418477 instead. Here's
> the commit for reference:
> https://github.com/jopelima/tpm2-tools/commit/be3d011d86531f45cc820d24432=
9c451e246034f
>
> Can anyone help me get the right handle here?
>
> Thanks in advance.
>
> Kind regards,
> Jo=C3=A3o Lima  |  Infrastructure Security Engineer
> jlima(a)cloudflare.com
> cell: (+351) 914 907 591
>
> 1 888 99 FLARE  |  www.cloudflare.com
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>

--===============6712757975346083976==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+VGhhbmtzIFdpbGxpYW0sPGRpdj48YnI+PC9kaXY+PGRpdj5UaGUgRXN5
c19UUl9HZXRUcG1IYW5kbGUoKSB0aXAgd29ya3MsIEkmIzM5O2xsIHByb2NlZWQgd2l0aCB0aGUg
ZGlzY3Vzc2lvbiBvbiBnaXRodWIgcmVnYXJkaW5nIHlvdXIgZW5oYW5jZW1lbnQgdG8gdHBtMl9z
ZXNzaW9uY29uZmlnLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+S2luZCByZWdhcmRzLDxiciBj
bGVhcj0iYWxsIj48ZGl2PjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9zaWduYXR1cmUiIGRh
dGEtc21hcnRtYWlsPSJnbWFpbF9zaWduYXR1cmUiPjxkaXYgZGlyPSJsdHIiPjxwIHN0eWxlPSJm
b250LWZhbWlseTpIZWx2ZXRpY2E7Zm9udC1zaXplOjEycHg7Y29sb3I6cmdiKDY0LDY0LDY0KSI+
PGI+Sm/Do28gTGltYTwvYj7CoMKgfMKgwqBJbmZyYXN0cnVjdHVyZSBTZWN1cml0eSBFbmdpbmVl
cjxicj48YSBocmVmPSJtYWlsdG86amxpbWFAY2xvdWRmbGFyZS5jb20iIHN0eWxlPSJjb2xvcjpy
Z2IoNDcsMTIzLDE5MSkiIHRhcmdldD0iX2JsYW5rIj5qbGltYUBjbG91ZGZsYXJlLmNvbTwvYT48
YnI+Y2VsbDrCoDxhIGhyZWY9InRlbDooKzM1MSkrOTE0KzkwNys1OTEiIHN0eWxlPSJjb2xvcjpy
Z2IoNDcsMTIzLDE5MSkiIHRhcmdldD0iX2JsYW5rIj4oKzM1MSkgOTE0IDkwNyA1OTE8L2E+PC9w
PjxhIGhyZWY9Imh0dHBzOi8vd3d3LmNsb3VkZmxhcmUuY29tLyIgc3R5bGU9ImZvbnQtZmFtaWx5
OlRpbWVzO2ZvbnQtc2l6ZTptZWRpdW0iIHRhcmdldD0iX2JsYW5rIj48aW1nIHNyYz0iaHR0cHM6
Ly9zMy5hbWF6b25hd3MuY29tL3N0YXR1c3BhZ2UtcHJvZHVjdGlvbi9wYWdlcy10cmFuc2FjdGlv
bmFsX2xvZ29zL3JldGluYS83ODA5L0pBVnFqemMxUTMyWTl6YWp6cDRGIiBzdHlsZT0iaGVpZ2h0
OjMwcHg7bWFyZ2luLXRvcDoxMHB4Ij48L2E+PHAgc3R5bGU9ImZvbnQtZmFtaWx5OkhlbHZldGlj
YTtmb250LXNpemU6MTJweDtjb2xvcjpyZ2IoNjQsNjQsNjQpIj4xIDg4OCA5OSBGTEFSRcKgwqB8
wqDCoDxhIGhyZWY9Imh0dHBzOi8vd3d3LmNsb3VkZmxhcmUuY29tLyIgc3R5bGU9ImNvbG9yOnJn
Yig0NywxMjMsMTkxKSIgdGFyZ2V0PSJfYmxhbmsiPnd3dy5jbG91ZGZsYXJlLmNvbTwvYT48L3A+
PC9kaXY+PC9kaXY+PC9kaXY+PGJyPjwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9x
dW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFdlZCwgQXByIDE0LCAy
MDIxIGF0IDEwOjU4IFBNIFJvYmVydHMsIFdpbGxpYW0gQyAmbHQ7PGEgaHJlZj0ibWFpbHRvOndp
bGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9h
PiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5
bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIw
NCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4KCgoKCjxkaXYgZGlyPSJsdHIiPgo8ZGl2IHN0
eWxlPSJmb250LWZhbWlseTpDYWxpYnJpLEFyaWFsLEhlbHZldGljYSxzYW5zLXNlcmlmO2ZvbnQt
c2l6ZToxMnB0O2NvbG9yOnJnYigwLDAsMCkiPgpBbHNvLCBpZiB5b3UgY2FuIGNvbmZpcm0gaXQg
d29ya3MgYXMgZXhwZWN0ZWQgaW4gYSByZXBseSBvciBvbiBnaXRodWIsIHRoYXQgd291bGQgYmUg
aGVscGZ1bC48L2Rpdj4KPGRpdiBpZD0iZ21haWwtbV8tNzc3Mzk5MTQ1ODIwOTk1Mjc0NGFwcGVu
ZG9uc2VuZCI+PC9kaXY+CjxociBzdHlsZT0iZGlzcGxheTppbmxpbmUtYmxvY2s7d2lkdGg6OTgl
Ij4KPGRpdiBpZD0iZ21haWwtbV8tNzc3Mzk5MTQ1ODIwOTk1Mjc0NGRpdlJwbHlGd2RNc2ciIGRp
cj0ibHRyIj48Zm9udCBmYWNlPSJDYWxpYnJpLCBzYW5zLXNlcmlmIiBzdHlsZT0iZm9udC1zaXpl
OjExcHQiIGNvbG9yPSIjMDAwMDAwIj48Yj5Gcm9tOjwvYj4gUm9iZXJ0cywgV2lsbGlhbSBDICZs
dDs8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9i
bGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDs8YnI+CjxiPlNlbnQ6PC9i
PiBXZWRuZXNkYXksIEFwcmlsIDE0LCAyMDIxIDM6MDMgUE08YnI+CjxiPlRvOjwvYj4gSm/Do28g
TGltYSAmbHQ7PGEgaHJlZj0ibWFpbHRvOmpsaW1hQGNsb3VkZmxhcmUuY29tIiB0YXJnZXQ9Il9i
bGFuayI+amxpbWFAY2xvdWRmbGFyZS5jb208L2E+Jmd0OzsgPGEgaHJlZj0ibWFpbHRvOnRwbTJA
bGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+ICZsdDs8
YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxp
c3RzLjAxLm9yZzwvYT4mZ3Q7PGJyPgo8Yj5TdWJqZWN0OjwvYj4gW3RwbTJdIFJlOiBQcm9ncmFt
YXRpY2FsbHkgb2J0YWluaW5nIHNlc3Npb24gaGFuZGxlIC0gdHBtMl9zZXNzaW9uX2dldF9oYW5k
bGUoKTwvZm9udD4KPGRpdj7CoDwvZGl2Pgo8L2Rpdj4KPGRpdj48Zm9udCBzaXplPSIyIj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjExcHQiPgo8ZGl2PlRoZSBmdW5jdGlvbiBFU1lTX1RSIHRwbTJf
c2Vzc2lvbl9nZXRfaGFuZGxlKHRwbTJfc2Vzc2lvbiAqc2Vzc2lvbiksIHJldHVybnMgYW4gRVNZ
U19UUiBvYmplY3QuIFdoaWNoIGlzIGFuIG9wYXF1ZSBoYW5kbGUsIHNvIHlvdSBjYW50IHVzZSB0
aGUgdmFyaW91cyBtYXNrcyB0byBmaWd1cmUgb3V0IHdoYXQgaXQgaXMuPGJyPgo8YnI+Ckhvd2V2
ZXIsIHlvdSBjYW4gcGFzcyB0aGF0IEVTWVNfVFIgdG/CoDxicj4KPGJyPgpUU1MyX1JDIEVzeXNf
VFJfR2V0VHBtSGFuZGxlKEVTWVNfQ09OVEVYVCAqIGVzeXNfY29udGV4dCwgRVNZU19UUiBlc3lz
X2hhbmRsZSw8YnI+CsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFRQTTJfSEFORExFICogdHBt
X2hhbmRsZSk8YnI+Cjxicj4KV2hpY2ggd2lsbCByZXR1cm4gdGhlIFJBVyB0cG0gaGFuZGxlIHlv
dSBjb3VsZCBwYXNzIHRvIHRoZSBrZXJuZWwga2V5cmluZy48YnI+Cjxicj4KPGJyPgpUaGVyZSBp
cyBhIHRvb2wgY2FsbGVkIHRwbTJfc2Vzc2lvbmNvbmZpZyBJIGFkZGVkIHRoaXMgZmVhdHVyZSB0
aGVyZTo8YnI+CjxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTIt
dG9vbHMvcHVsbC8yNzAwIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL3RwbTIt
c29mdHdhcmUvdHBtMi10b29scy9wdWxsLzI3MDA8L2E+PGJyPgo8YnI+CkkgYXNrZWQgSW1yYW4g
dG8gc3RhZ2UgaXQgZm9yIDUuMSwgbGV0cyBzZWUgaWYgdGhhdCYjMzk7cyBwb3NzaWJsZS48YnI+
Cjxicj4KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLTxicj4KPGJyPgo8YnI+CkZyb206IEpvw6Nv
IExpbWEgJmx0OzxhIGhyZWY9Im1haWx0bzpqbGltYUBjbG91ZGZsYXJlLmNvbSIgdGFyZ2V0PSJf
YmxhbmsiPmpsaW1hQGNsb3VkZmxhcmUuY29tPC9hPiZndDs8YnI+ClNlbnQ6IEZyaWRheSwgQXBy
aWwgOSwgMjAyMSAxMTozOCBBTTxicj4KVG86IDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAx
Lm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiAmbHQ7PGEgaHJlZj0i
bWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5v
cmc8L2E+Jmd0Ozxicj4KU3ViamVjdDogW3RwbTJdIFByb2dyYW1hdGljYWxseSBvYnRhaW5pbmcg
c2Vzc2lvbiBoYW5kbGUgLSB0cG0yX3Nlc3Npb25fZ2V0X2hhbmRsZSgpCjxicj4KwqA8YnI+Ckhl
bGxvIGZvbGtzISA8YnI+Cjxicj4KSSYjMzk7dmUgYmVlbiB0cnlpbmcgdG8gY29iYmxlIHRvZ2V0
aGVyIGFuIGltcGxlbWVudGF0aW9uIGZvciBhIENvbnRleHRMb2FkIGFuZCBDb250ZXh0U2F2ZSB0
cG0yX3Rvb2wsIHNvIHRoYXQgb25lIGNhbiBzYXZlIGEgc2Vzc2lvbiBjb250ZXh0IHRvIHRoZSBU
UE0gYW5kIGdldCB0aGUgc2Vzc2lvbiBoYW5kbGUgZm9yIGl0LiBUaGUgcmVhc29uaW5nIGlzIHRv
IGhhdmUgYSB3YXkgdG8gbWFuaXB1bGF0ZSBwb2xpY3kgdmFsaWRhdGlvbiB1c2luZyB0cG0yX3Rv
b2xzLAogYnV0IHRoZW4gaGF2ZSB0aGUgc2F2ZWQgc2Vzc2lvbiBjb250ZXh0IGJlIGNvbnZlcnRl
ZCB0byB0aGUgVFBNIGhhbmRsZSwgc28gdGhhdCBpdCBjYW4gYmUgcGFzc2VkIHRvIHRoZSBrZXJu
ZWwga2V5cmluZyB0cnVzdGVkIGtleXMgc3Vic3lzdGVtLjxicj4KPGJyPgpJdCBzZWVtcyBJIGhh
dmUgbW9zdCBvZiBpdCB3b3JraW5nICh3YXMgcmVhbGx5IGEgbWF0dGVyIG9mIGp1c3QgY29weWlu
ZyB3aGF0JiMzOTtzIGRvbmUgb24gb3RoZXIgY29tbWFuZHMpLCBleGNlcHQgZm9yIHRoZSBiaXQg
d2hlcmUgSSBnZXQgdGhlIHNlc3Npb24gaGFuZGxlIGl0c2VsZi4gSSB3YXMgZXhwZWN0aW5nIHRv
IGdldCB0aGUgc2Vzc2lvbiBoYW5kbGUgdGhyb3VnaCB0aGUgdHBtMl9zZXNzaW9uX2dldF9oYW5k
bGUoKSBjb21tYW5kLCBidXQgaW5zdGVhZAogSSYjMzk7bSBnZXR0aW5nIGEgaGFuZGxlIG9uIHRo
ZSBwZXJtYW5lbnQgb2JqZWN0IGhhbmRsZSBzcGFjZSAoTVNPIDB4NDApLjxicj4KPGJyPgpUaGlz
IGlzIHRoZSB2ZXJib3NlIG91dHB1dCBJIGdldCBmb3IgdHBtMl9zdGFydGF1dGhzZXNzaW9uOjxi
cj4KPGJyPgp0cG0yX3N0YXJ0YXV0aHNlc3Npb24gLS1wb2xpY3ktc2Vzc2lvbiAtUyBzZXNzaW9u
LmRhdCAtVjxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDs0MDMmcXVvdDsgaW4gZmlsZTogJnF1b3Q7
bGliL3RwbTJfc2Vzc2lvbi5jJnF1b3Q7OiBTYXZlZCBzZXNzaW9uOiBFU1lTX1RSKDB4NDA0MTg0
NzcpPGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzI0NiZxdW90OyBpbiBmaWxlOiAmcXVvdDtsaWIv
ZmlsZXMuYyZxdW90OzogU2F2ZSBUUE1TX0NPTlRFWFQtJmd0O3NhdmVkSGFuZGxlOiAweDMwMDAw
MDA8YnI+Cjxicj4KVGhpcyBpcyB0aGUgdmVyYm9zZSBvdXRwdXQgZm9yIHRoZSBuZXcgY29tbWFu
ZCAodHBtMl9jb250ZXh0bG9hZCk6PGJyPgo8YnI+CnRwbTJfY29udGV4dGxvYWQgLVMgc2Vzc2lv
bi5kYXQgLVY8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDE4JnF1b3Q7IGluIGZpbGU6ICZxdW90
O2xpYi9maWxlcy5jJnF1b3Q7OiBBc3N1bWluZyB0cG0gY29udGV4dCBmaWxlPGJyPgpJTkZPIG9u
IGxpbmU6ICZxdW90OzM0OSZxdW90OyBpbiBmaWxlOiAmcXVvdDtsaWIvZmlsZXMuYyZxdW90Ozog
bG9hZDogVFBNU19DT05URVhULSZndDtzYXZlZEhhbmRsZTogMHgzMDAwMDAwPGJyPgpJTkZPIG9u
IGxpbmU6ICZxdW90OzMwNiZxdW90OyBpbiBmaWxlOiAmcXVvdDtsaWIvdHBtMl9zZXNzaW9uLmMm
cXVvdDs6IFJlc3RvcmVkIHNlc3Npb246IEVTWVNfVFIoMHg0MDQxODQ3NykgYXR0cnMoMHgxKTxi
cj4Kc2Vzc2lvbiBoYW5kbGU6IDB4NDA0MTg0Nzc8YnI+Cjxicj4KSSYjMzk7bSBjYWxsaW5nIHRw
bTJfZ2V0X3Nlc3Npb25faGFuZGxlKCkgb3ZlciB0aGUgdHBtMl9zZXNzaW9uIG9iamVjdCwgZXhw
ZWN0aW5nIHRvIGdldCB0aGUgMHgzMDAwMDAwIGJ1dCBhbSBnZXR0aW5nwqAweDQwNDE4NDc3IGlu
c3RlYWQuIEhlcmUmIzM5O3MgdGhlIGNvbW1pdCBmb3IgcmVmZXJlbmNlOsKgPGEgaHJlZj0iaHR0
cHM6Ly9naXRodWIuY29tL2pvcGVsaW1hL3RwbTItdG9vbHMvY29tbWl0L2JlM2QwMTFkODY1MzFm
NDVjYzgyMGQyNDQzMjljNDUxZTI0NjAzNGYiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1
Yi5jb20vam9wZWxpbWEvdHBtMi10b29scy9jb21taXQvYmUzZDAxMWQ4NjUzMWY0NWNjODIwZDI0
NDMyOWM0NTFlMjQ2MDM0ZjwvYT48YnI+Cjxicj4KQ2FuIGFueW9uZSBoZWxwIG1lIGdldCB0aGUg
cmlnaHQgaGFuZGxlIGhlcmU/PGJyPgo8YnI+ClRoYW5rcyBpbiBhZHZhbmNlLjxicj4KPGJyPgpL
aW5kIHJlZ2FyZHMsPGJyPgpKb8OjbyBMaW1hwqDCoHzCoMKgSW5mcmFzdHJ1Y3R1cmUgU2VjdXJp
dHkgRW5naW5lZXI8YnI+CjxhIGhyZWY9Im1haWx0bzpqbGltYUBjbG91ZGZsYXJlLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPmpsaW1hQGNsb3VkZmxhcmUuY29tPC9hPjxicj4KY2VsbDrCoCgrMzUxKSA5
MTQgOTA3IDU5MTxicj4KwqA8YnI+CjEgODg4IDk5IEZMQVJFwqDCoHzCoMKgPGEgaHJlZj0iaHR0
cDovL3d3dy5jbG91ZGZsYXJlLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnd3dy5jbG91ZGZsYXJlLmNv
bTwvYT48YnI+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
PGJyPgp0cG0yIG1haWxpbmcgbGlzdCAtLSA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5v
cmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT48YnI+ClRvIHVuc3Vic2Ny
aWJlIHNlbmQgYW4gZW1haWwgdG8gPGEgaHJlZj0ibWFpbHRvOnRwbTItbGVhdmVAbGlzdHMuMDEu
b3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+PGJyPgolKHdl
Yl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpczxicj4KPC9k
aXY+Cjwvc3Bhbj48L2ZvbnQ+PC9kaXY+CjwvZGl2PgoKPC9ibG9ja3F1b3RlPjwvZGl2Pgo=

--===============6712757975346083976==--

