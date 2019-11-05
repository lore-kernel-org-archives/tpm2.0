Content-Type: multipart/mixed; boundary="===============1974719609170878578=="
MIME-Version: 1.0
From: Desai, Imran <imran.desai at intel.com>
Subject: [tpm2] Release notice: tpm2-tools 4.1-rc0 
Date: Tue, 05 Nov 2019 20:17:09 +0000
Message-ID: <688D07BB9E3A9E4A852BA1336D1910FF967EEAE9@fmsmsx104.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1974719609170878578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

tpm2-tools release candidate version 4.1-rc0 is published.
https://github.com/tpm2-software/tpm2-tools/releases/tag/4.1-rc0

Please provide your feedback for the release candidate.

Some highlights for the release:

* New tools added to support commands:
TPM2_CertifyCreation, TPM2_ChangeEPS, TPM2_ChangePPS, TPM2_ClockRateAdjust,
TPM2_GetTime, TPM2_NV_Certify, TPM2_NV_Extend, TPM2_NV_Setbits,
TPM2_NV_UndefineSpaceSpecial, TPM2_NV_Writelock, TPM2_PolicyAuthorizeNV,
TPM2_PolicyAuthValue, TPM2_PolicyCounterTimer, TPM2_PolicyNameHash,
TPM2_PolicyNV, TPM2_NV_Written, TPM2_PolicySigned, TPM2_PolicyTemplate,
TPM2_PolicyTicket, TPM2_ReadClock, TPM2_ClockSet, TPM2_SetPrimaryPolicy,
TPM2_Shutdown.

* Bug fixes and additional options to existing tools.
1. tpm2_checkquote: Fix YAML bug
2. tpm2_policysecret: Add options to specify expiration, ticket, timeout,
   qualification data.
3. tpm2_create/ tpm2_createprimary: Add options to specify creation-data,
   creation-ticket, creation-hash, outside-info, pcr-list

* Misc:
1. Skip/notify of action that man pages will not install if pandoc is missi=
ng.
2. Support "tpmt" as public key output format that saves the TPMT structure.
3. Add support for specifying NV index type when specifying NV attributes.
4. Fixed routine files_load_bytes_from_buffer_or_file_or_stdin where it can
   read one short of a UINT16 and overflow when buffer isn't a UINT16.

Thanks and Regards.

--===============1974719609170878578==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWwgZGlyPSJsdHIiIGNsYXNzPSJncl9fb3V0bG9va19pbnRlbF9jb20iPgo8aGVhZD4KPG1l
dGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9
aXNvLTg4NTktMSI+CjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgaWQ9Im93YVBhcmFTdHlsZSI+PC9z
dHlsZT4KPC9oZWFkPgo8Ym9keSBkYXRhLWdyLWMtcy1sb2FkZWQ9InRydWUiIGZwc3R5bGU9IjEi
IG9jc2k9IjAiPgo8ZGl2IHN0eWxlPSJkaXJlY3Rpb246IGx0cjtmb250LWZhbWlseTogVGFob21h
O2NvbG9yOiAjMDAwMDAwO2ZvbnQtc2l6ZTogMTBwdDsiPgo8ZGl2PkhlbGxvLDwvZGl2Pgo8ZGl2
Pjxicj4KPC9kaXY+CjxkaXY+dHBtMi10b29scyByZWxlYXNlIGNhbmRpZGF0ZSB2ZXJzaW9uIDQu
MS1yYzAgaXMgcHVibGlzaGVkLjwvZGl2Pgo8ZGl2PjxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNv
bS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMvcmVsZWFzZXMvdGFnLzQuMS1yYzAiIHRhcmdldD0i
X2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRvb2xzL3JlbGVh
c2VzL3RhZy80LjEtcmMwPC9hPjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+UGxlYXNlIHBy
b3ZpZGUgeW91ciBmZWVkYmFjayBmb3IgdGhlIHJlbGVhc2UgY2FuZGlkYXRlLjwvZGl2Pgo8ZGl2
Pjxicj4KPC9kaXY+CjxkaXY+U29tZSBoaWdobGlnaHRzIGZvciB0aGUgcmVsZWFzZTo8L2Rpdj4K
PGRpdj48YnI+CjwvZGl2Pgo8ZGl2PiogTmV3IHRvb2xzIGFkZGVkIHRvIHN1cHBvcnQgY29tbWFu
ZHM6PC9kaXY+CjxkaXY+VFBNMl9DZXJ0aWZ5Q3JlYXRpb24sIFRQTTJfQ2hhbmdlRVBTLCBUUE0y
X0NoYW5nZVBQUywgVFBNMl9DbG9ja1JhdGVBZGp1c3QsPC9kaXY+CjxkaXY+VFBNMl9HZXRUaW1l
LCBUUE0yX05WX0NlcnRpZnksIFRQTTJfTlZfRXh0ZW5kLCBUUE0yX05WX1NldGJpdHMsPC9kaXY+
CjxkaXY+VFBNMl9OVl9VbmRlZmluZVNwYWNlU3BlY2lhbCwgVFBNMl9OVl9Xcml0ZWxvY2ssIFRQ
TTJfUG9saWN5QXV0aG9yaXplTlYsPC9kaXY+CjxkaXY+VFBNMl9Qb2xpY3lBdXRoVmFsdWUsIFRQ
TTJfUG9saWN5Q291bnRlclRpbWVyLCBUUE0yX1BvbGljeU5hbWVIYXNoLDwvZGl2Pgo8ZGl2PlRQ
TTJfUG9saWN5TlYsIFRQTTJfTlZfV3JpdHRlbiwgVFBNMl9Qb2xpY3lTaWduZWQsIFRQTTJfUG9s
aWN5VGVtcGxhdGUsPC9kaXY+CjxkaXY+VFBNMl9Qb2xpY3lUaWNrZXQsIFRQTTJfUmVhZENsb2Nr
LCBUUE0yX0Nsb2NrU2V0LCBUUE0yX1NldFByaW1hcnlQb2xpY3ksPC9kaXY+CjxkaXY+VFBNMl9T
aHV0ZG93bi48L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2PiogQnVnIGZpeGVzIGFuZCBhZGRp
dGlvbmFsIG9wdGlvbnMgdG8gZXhpc3RpbmcgdG9vbHMuPC9kaXY+CjxkaXY+MS4gdHBtMl9jaGVj
a3F1b3RlOiBGaXggWUFNTCBidWc8L2Rpdj4KPGRpdj4yLiB0cG0yX3BvbGljeXNlY3JldDogQWRk
IG9wdGlvbnMgdG8gc3BlY2lmeSBleHBpcmF0aW9uLCB0aWNrZXQsIHRpbWVvdXQsPC9kaXY+Cjxk
aXY+Jm5ic3A7ICZuYnNwO3F1YWxpZmljYXRpb24gZGF0YS48L2Rpdj4KPGRpdj4zLiB0cG0yX2Ny
ZWF0ZS8gdHBtMl9jcmVhdGVwcmltYXJ5OiBBZGQgb3B0aW9ucyB0byBzcGVjaWZ5IGNyZWF0aW9u
LWRhdGEsPC9kaXY+CjxkaXY+Jm5ic3A7ICZuYnNwO2NyZWF0aW9uLXRpY2tldCwgY3JlYXRpb24t
aGFzaCwgb3V0c2lkZS1pbmZvLCBwY3ItbGlzdDwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+
KiBNaXNjOjwvZGl2Pgo8ZGl2PjEuIFNraXAvbm90aWZ5IG9mIGFjdGlvbiB0aGF0IG1hbiBwYWdl
cyB3aWxsIG5vdCBpbnN0YWxsIGlmIHBhbmRvYyBpcyBtaXNzaW5nLjwvZGl2Pgo8ZGl2PjIuIFN1
cHBvcnQgJnF1b3Q7dHBtdCZxdW90OyBhcyBwdWJsaWMga2V5IG91dHB1dCBmb3JtYXQgdGhhdCBz
YXZlcyB0aGUgVFBNVCBzdHJ1Y3R1cmUuPC9kaXY+CjxkaXY+My4gQWRkIHN1cHBvcnQgZm9yIHNw
ZWNpZnlpbmcgTlYgaW5kZXggdHlwZSB3aGVuIHNwZWNpZnlpbmcgTlYgYXR0cmlidXRlcy48L2Rp
dj4KPGRpdj40LiBGaXhlZCByb3V0aW5lIGZpbGVzX2xvYWRfYnl0ZXNfZnJvbV9idWZmZXJfb3Jf
ZmlsZV9vcl9zdGRpbiB3aGVyZSBpdCBjYW48L2Rpdj4KPGRpdj4mbmJzcDsgJm5ic3A7cmVhZCBv
bmUgc2hvcnQgb2YgYSBVSU5UMTYgYW5kIG92ZXJmbG93IHdoZW4gYnVmZmVyIGlzbid0IGEgVUlO
VDE2LjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+VGhhbmtzIGFuZCBSZWdhcmRzLjwvZGl2
Pgo8L2Rpdj4KPC9ib2R5Pgo8L2h0bWw+Cg==

--===============1974719609170878578==--

