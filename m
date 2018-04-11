Content-Type: multipart/mixed; boundary="===============2206509284907823501=="
MIME-Version: 1.0
From: Yasuhiro Hosoda <hosoda-yasuhiro at ntt-el.com>
Subject: Re: [tpm2] tpm2-tss question
Date: Wed, 11 Apr 2018 17:38:35 +0900
Message-ID: <5c54e6ce-28cf-88bd-0349-cc56832d8f97@ntt-el.com>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D010EB03568@exch2010c.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2206509284907823501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thank you very much for your answer.

I understand that the spec. is that the handles of policy session are
not virtualized

I check the source programs of the resource managers.
(TPM2,0-TSS-1.0 and tpm2-abrmd-1.2.0)
It seems that HMAC sessions and Policy sessions are handled
in the same way. Do you have any comment comment about
implementations?

> According to the spec, only key and sequence handles are virtualized.
>
> Thus for PolicySecret, the virtual and TPM handles for policySession  =

> shall be the same.
>
> For keys and sequences (such as authHandle in PolicySecret) the  =

> virtual and TPM handles differ.
> But instead of the handle the key's / sequence's public name is used  =

> within the hmac calculation.
>
> Hope this helps...
>
> ------------------------------------------------------------------------
> *From:* tpm2 [tpm2-bounces(a)lists.01.org] on behalf of Yasuhiro Hosoda  =

> [hosoda-yasuhiro(a)ntt-el.com]
> *Sent:* Wednesday, April 11, 2018 08:11
> *To:* william.c.roberts(a)intel.com; tpm2(a)lists.01.org
> *Subject:* Re: [tpm2] tpm2-tss question
>
> I have one finding about the RM and PolicySecret command,
>
> It says in page 10 of the following document
> "TCG TSS 2.0 TAB and Resource Manager specification"
> https://trustedcomputinggroup.org/wp-content/uploads/TSS-2.0-TAB-Resource=
-Manager-SpecVer1.0-Rev18_review_END030918.pdf
> that
> "
> The RM performs a mapping from the (unchanging) virtual handle to the  =

> (currently assigned) TPM
> handle. It replaces the virtual handle with the TPM handle in the TPM  =

> command packet.
>
> NOTE: The TPM 2.0 library specification excludes the handle from  =

> command stream HMAC calculations to enable this
> substitution."
> This means that if the virtual handle and the (currently assigned) TPM  =

> differs,
> the HMAC calculations for most of the commands go well.
>
> But, the PolicySecret command takes the policy handle to extend as a  =

> parameter for HMAC.
> If, the virtual handle and the (currently assigned) TPM differs, the  =

> HMAC calculations
> for this command doesn't go well and produces the error code 0x98e.
> Is my understanding right?
> If so, is there any workaround?
>
> Thank you in advance.


--===============2206509284907823501==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsKICAgICAgY2hhcnNldD1pc28tMjAyMi1qcCI+CiAgPC9oZWFkPgogIDxi
b2R5IHRleHQ9IiMwMDAwMDAiIGJnY29sb3I9IiNGRkZGRkYiPgogICAgPGRpdiBjbGFzcz0ibW96
LWNpdGUtcHJlZml4Ij5UaGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3VyIGFuc3dlci48YnI+CiAg
ICAgIDxicj4KICAgICAgSSB1bmRlcnN0YW5kIHRoYXQgdGhlIHNwZWMuIGlzIHRoYXQgdGhlIGhh
bmRsZXMgb2YgcG9saWN5IHNlc3Npb24KICAgICAgYXJlIDxicj4KICAgICAgbm90IHZpcnR1YWxp
emVkIDxicj4KICAgICAgPGJyPgogICAgICBJIGNoZWNrIHRoZSBzb3VyY2UgcHJvZ3JhbXMgb2Yg
dGhlIHJlc291cmNlIG1hbmFnZXJzLjxicj4KICAgICAgKFRQTTIsMC1UU1MtMS4wIGFuZCB0cG0y
LWFicm1kLTEuMi4wKTxicj4KICAgICAgSXQgc2VlbXMgdGhhdCBITUFDIHNlc3Npb25zIGFuZCBQ
b2xpY3kgc2Vzc2lvbnMgYXJlIGhhbmRsZWQ8YnI+CiAgICAgIGluIHRoZSBzYW1lIHdheS4gRG8g
eW91IGhhdmUgYW55IGNvbW1lbnQgY29tbWVudCBhYm91dDxicj4KICAgICAgaW1wbGVtZW50YXRp
b25zPzxicj4KICAgICAgPGJyPgogICAgPC9kaXY+CiAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRl
IgpjaXRlPSJtaWQ6OUY0OEUxQTgyM0IwM0I0NzkwQjdFNkU2OTQzMDcyNEQwMTBFQjAzNTY4QGV4
Y2gyMDEwYy5zaXQuZnJhdW5ob2Zlci5kZSI+CiAgICAgIDxtZXRhIGh0dHAtZXF1aXY9IkNvbnRl
bnQtVHlwZSIgY29udGVudD0idGV4dC9odG1sOwogICAgICAgIGNoYXJzZXQ9aXNvLTIwMjItanAi
PgogICAgICA8c3R5bGUgdHlwZT0idGV4dC9jc3MiIGlkPSJvd2FQYXJhU3R5bGUiPlAge21hcmdp
bi10b3A6MDttYXJnaW4tYm90dG9tOjA7fTwvc3R5bGU+CiAgICAgIDxkaXYgc3R5bGU9ImRpcmVj
dGlvbjogbHRyO2ZvbnQtZmFtaWx5OiBUYWhvbWE7Y29sb3I6CiAgICAgICAgIzAwMDAwMDtmb250
LXNpemU6IDEwcHQ7Ij5BY2NvcmRpbmcgdG8gdGhlIHNwZWMsIG9ubHkga2V5IGFuZAogICAgICAg
IHNlcXVlbmNlIGhhbmRsZXMgYXJlIHZpcnR1YWxpemVkLjxicj4KICAgICAgICA8YnI+CiAgICAg
ICAgVGh1cyBmb3IgUG9saWN5U2VjcmV0LCB0aGUgdmlydHVhbCBhbmQgVFBNIGhhbmRsZXMgZm9y
CiAgICAgICAgcG9saWN5U2Vzc2lvbiBzaGFsbCBiZSB0aGUgc2FtZS48YnI+CiAgICAgICAgPGJy
PgogICAgICAgIEZvciBrZXlzIGFuZCBzZXF1ZW5jZXMgKHN1Y2ggYXMgYXV0aEhhbmRsZSBpbiBQ
b2xpY3lTZWNyZXQpIHRoZQogICAgICAgIHZpcnR1YWwgYW5kIFRQTSBoYW5kbGVzIGRpZmZlci48
YnI+CiAgICAgICAgQnV0IGluc3RlYWQgb2YgdGhlIGhhbmRsZSB0aGUga2V5J3MgLyBzZXF1ZW5j
ZSdzIHB1YmxpYyBuYW1lIGlzCiAgICAgICAgdXNlZCB3aXRoaW4gdGhlIGhtYWMgY2FsY3VsYXRp
b24uPGJyPgogICAgICAgIDxicj4KICAgICAgICBIb3BlIHRoaXMgaGVscHMuLi48YnI+CiAgICAg
ICAgPGJyPgogICAgICAgIDxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBUaW1lcyBOZXcgUm9tYW47
IGNvbG9yOiAjMDAwMDAwOwogICAgICAgICAgZm9udC1zaXplOiAxNnB4Ij4KICAgICAgICAgIDxo
ciB0YWJpbmRleD0iLTEiPgogICAgICAgICAgPGRpdiBpZD0iZGl2UnBGODUxOTQ5IiBzdHlsZT0i
ZGlyZWN0aW9uOiBsdHI7Ij48Zm9udCBzaXplPSIyIgogICAgICAgICAgICAgIGZhY2U9IlRhaG9t
YSIgY29sb3I9IiMwMDAwMDAiPjxiPkZyb206PC9iPiB0cG0yIFs8YQogICAgICAgICAgICAgICAg
Y2xhc3M9Im1vei10eHQtbGluay1hYmJyZXZpYXRlZCIKICAgICAgICAgICAgICAgIGhyZWY9Im1h
aWx0bzp0cG0yLWJvdW5jZXNAbGlzdHMuMDEub3JnIj50cG0yLWJvdW5jZXNAbGlzdHMuMDEub3Jn
PC9hPl0KICAgICAgICAgICAgICBvbiBiZWhhbGYgb2YgWWFzdWhpcm8gSG9zb2RhIFs8YQogICAg
ICAgICAgICAgICAgY2xhc3M9Im1vei10eHQtbGluay1hYmJyZXZpYXRlZCIKICAgICAgICAgICAg
ICAgIGhyZWY9Im1haWx0bzpob3NvZGEteWFzdWhpcm9AbnR0LWVsLmNvbSI+aG9zb2RhLXlhc3Vo
aXJvQG50dC1lbC5jb208L2E+XTxicj4KICAgICAgICAgICAgICA8Yj5TZW50OjwvYj4gV2VkbmVz
ZGF5LCBBcHJpbCAxMSwgMjAxOCAwODoxMTxicj4KICAgICAgICAgICAgICA8Yj5Ubzo8L2I+IDxh
IGNsYXNzPSJtb3otdHh0LWxpbmstYWJicmV2aWF0ZWQiCiAgICAgICAgICAgICAgICBocmVmPSJt
YWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRl
bC5jb208L2E+OwogICAgICAgICAgICAgIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstYWJicmV2aWF0
ZWQiCiAgICAgICAgICAgICAgICBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciPnRwbTJA
bGlzdHMuMDEub3JnPC9hPjxicj4KICAgICAgICAgICAgICA8Yj5TdWJqZWN0OjwvYj4gUmU6IFt0
cG0yXSB0cG0yLXRzcyBxdWVzdGlvbjxicj4KICAgICAgICAgICAgPC9mb250Pjxicj4KICAgICAg
ICAgIDwvZGl2PgogICAgICAgICAgPGRpdj4KICAgICAgICAgICAgPGRpdiBjbGFzcz0ibW96LWNp
dGUtcHJlZml4Ij5JIGhhdmUgb25lIGZpbmRpbmcgYWJvdXQgdGhlIFJNCiAgICAgICAgICAgICAg
YW5kIFBvbGljeVNlY3JldCBjb21tYW5kLDxicj4KICAgICAgICAgICAgICA8YnI+CiAgICAgICAg
ICAgICAgSXQgc2F5cyBpbiBwYWdlIDEwIG9mIHRoZSBmb2xsb3dpbmcgZG9jdW1lbnQ8YnI+CiAg
ICAgICAgICAgICAgIlRDRyBUU1MgMi4wIFRBQiBhbmQgUmVzb3VyY2UgTWFuYWdlciBzcGVjaWZp
Y2F0aW9uIjxicj4KICAgICAgICAgICAgICA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0
IgpocmVmPSJodHRwczovL3RydXN0ZWRjb21wdXRpbmdncm91cC5vcmcvd3AtY29udGVudC91cGxv
YWRzL1RTUy0yLjAtVEFCLVJlc291cmNlLU1hbmFnZXItU3BlY1ZlcjEuMC1SZXYxOF9yZXZpZXdf
RU5EMDMwOTE4LnBkZiIKICAgICAgICAgICAgICAgIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vb3Bl
bmVyIG5vcmVmZXJyZXIiCiAgICAgICAgICAgICAgICBtb3otZG8tbm90LXNlbmQ9InRydWUiPmh0
dHBzOi8vdHJ1c3RlZGNvbXB1dGluZ2dyb3VwLm9yZy93cC1jb250ZW50L3VwbG9hZHMvVFNTLTIu
MC1UQUItUmVzb3VyY2UtTWFuYWdlci1TcGVjVmVyMS4wLVJldjE4X3Jldmlld19FTkQwMzA5MTgu
cGRmPC9hPjxicj4KICAgICAgICAgICAgICB0aGF0IDxicj4KICAgICAgICAgICAgICAiPGJyPgog
ICAgICAgICAgICAgIFRoZSBSTSBwZXJmb3JtcyBhIG1hcHBpbmcgZnJvbSB0aGUgKHVuY2hhbmdp
bmcpIHZpcnR1YWwKICAgICAgICAgICAgICBoYW5kbGUgdG8gdGhlIChjdXJyZW50bHkgYXNzaWdu
ZWQpIFRQTTxicj4KICAgICAgICAgICAgICBoYW5kbGUuIEl0IHJlcGxhY2VzIHRoZSB2aXJ0dWFs
IGhhbmRsZSB3aXRoIHRoZSBUUE0gaGFuZGxlCiAgICAgICAgICAgICAgaW4gdGhlIFRQTSBjb21t
YW5kIHBhY2tldC48YnI+CiAgICAgICAgICAgICAgPGJyPgogICAgICAgICAgICAgIE5PVEU6IFRo
ZSBUUE0gMi4wIGxpYnJhcnkgc3BlY2lmaWNhdGlvbiBleGNsdWRlcyB0aGUKICAgICAgICAgICAg
ICBoYW5kbGUgZnJvbSBjb21tYW5kIHN0cmVhbSBITUFDIGNhbGN1bGF0aW9ucyB0byBlbmFibGUK
ICAgICAgICAgICAgICB0aGlzPGJyPgogICAgICAgICAgICAgIHN1YnN0aXR1dGlvbi4iPGJyPgog
ICAgICAgICAgICAgIFRoaXMgbWVhbnMgdGhhdCBpZiB0aGUgdmlydHVhbCBoYW5kbGUgYW5kIHRo
ZSAoY3VycmVudGx5CiAgICAgICAgICAgICAgYXNzaWduZWQpIFRQTSBkaWZmZXJzLDxicj4KICAg
ICAgICAgICAgICB0aGUgSE1BQyBjYWxjdWxhdGlvbnMgZm9yIG1vc3Qgb2YgdGhlIGNvbW1hbmRz
IGdvIHdlbGwuPGJyPgogICAgICAgICAgICAgIDxicj4KICAgICAgICAgICAgICBCdXQsIHRoZSBQ
b2xpY3lTZWNyZXQgY29tbWFuZCB0YWtlcyB0aGUgcG9saWN5IGhhbmRsZSB0bwogICAgICAgICAg
ICAgIGV4dGVuZCBhcyBhIHBhcmFtZXRlciBmb3IgSE1BQy48YnI+CiAgICAgICAgICAgICAgSWYs
IHRoZSB2aXJ0dWFsIGhhbmRsZSBhbmQgdGhlIChjdXJyZW50bHkgYXNzaWduZWQpIFRQTQogICAg
ICAgICAgICAgIGRpZmZlcnMsIHRoZSBITUFDIGNhbGN1bGF0aW9uczxicj4KICAgICAgICAgICAg
ICBmb3IgdGhpcyBjb21tYW5kIGRvZXNuJ3QgZ28gd2VsbCBhbmQgcHJvZHVjZXMgdGhlIGVycm9y
CiAgICAgICAgICAgICAgY29kZSAweDk4ZS48YnI+CiAgICAgICAgICAgICAgSXMgbXkgdW5kZXJz
dGFuZGluZyByaWdodD88YnI+CiAgICAgICAgICAgICAgSWYgc28sIGlzIHRoZXJlIGFueSB3b3Jr
YXJvdW5kPzxicj4KICAgICAgICAgICAgICA8YnI+CiAgICAgICAgICAgICAgVGhhbmsgeW91IGlu
IGFkdmFuY2UuPGJyPgogICAgICAgICAgICA8L2Rpdj4KICAgICAgICAgIDwvZGl2PgogICAgICAg
IDwvZGl2PgogICAgICA8L2Rpdj4KICAgIDwvYmxvY2txdW90ZT4KICAgIDxicj4KICA8L2JvZHk+
CjwvaHRtbD4K

--===============2206509284907823501==--

