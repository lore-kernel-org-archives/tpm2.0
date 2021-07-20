Content-Type: multipart/mixed; boundary="===============7677372847003490937=="
MIME-Version: 1.0
From: Andy Purcell <andy_purcell at keysight.com>
Subject: [tpm2] Want to use c++ to get TPM Serial Number - how do it? 
Date: Tue, 20 Jul 2021 17:18:43 +0000
Message-ID: <
 <SA1PR17MB5432DD01C2498B7B1F50486E9FE29@SA1PR17MB5432.namprd17.prod.outlook.com>>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7677372847003490937==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I have a need to use C++ to obtain the unique TPM information - like a Seri=
al Number.
My system is running Windows 10/64. This is on an HP Desktop PC with TPM 2.=
0 chip.

I can use PowerShell
Get-TpmEndorsementKeyInfo -hashalgorithm sha256

To get this output:
                ...
ManufacturerCertificates : {[Subject]
                             TPMVersion=3Did:073E, TPMModel=3DSLB 9670 TPM2=
.0, TPMManufacturer=3Did:49465800
                           [Issuer]
                             CN=3DInfineon OPTIGA(TM) RSA Manufacturing CA =
034, OU=3DOPTIGA(TM) TPM2.0, O=3DInfineon Technologies AG, C=3DDE
      ...
                           [Serial Number]
                             4880DE8E
                           [Thumbprint]
                             B8395DA6A1D661C8CCD35D47E3DA6E9532EFFEC4

But how can I get this same Serial Number information using C++?

ap


--===============7677372847003490937==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD11cy1hc2NpaSI+CjxtZXRhIG5hbWU9IkdlbmVyYXRvciIgY29udGVu
dD0iTWljcm9zb2Z0IEV4Y2hhbmdlIFNlcnZlciI+CjwhLS0gY29udmVydGVkIGZyb20gcnRmIC0t
Pgo8c3R5bGU+PCEtLSAuRW1haWxRdW90ZSB7IG1hcmdpbi1sZWZ0OiAxcHQ7IHBhZGRpbmctbGVm
dDogNHB0OyBib3JkZXItbGVmdDogIzgwMDAwMCAycHggc29saWQ7IH0gLS0+PC9zdHlsZT4KPC9o
ZWFkPgo8Ym9keT4KPGZvbnQgZmFjZT0iQ2FsaWJyaSIgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZv
bnQtc2l6ZToxMXB0OyI+CjxkaXY+SSBoYXZlIGEgbmVlZCB0byB1c2UgQysrIHRvIG9idGFpbiB0
aGUgdW5pcXVlIFRQTSBpbmZvcm1hdGlvbiAmIzgyMTE7IGxpa2UgYSBTZXJpYWwgTnVtYmVyLiA8
L2Rpdj4KPGRpdj5NeSBzeXN0ZW0gaXMgcnVubmluZyBXaW5kb3dzIDEwLzY0LiBUaGlzIGlzIG9u
IGFuIEhQIERlc2t0b3AgUEMgd2l0aCBUUE0gMi4wIGNoaXAuIDwvZGl2Pgo8ZGl2PiZuYnNwOzwv
ZGl2Pgo8ZGl2PkkgY2FuIHVzZSBQb3dlclNoZWxsIDwvZGl2Pgo8ZGl2IHN0eWxlPSJ0ZXh0LWlu
ZGVudDozNnB0OyI+R2V0LVRwbUVuZG9yc2VtZW50S2V5SW5mbyAtaGFzaGFsZ29yaXRobSBzaGEy
NTY8L2Rpdj4KPGRpdj4mbmJzcDs8L2Rpdj4KPGRpdj5UbyBnZXQgdGhpcyBvdXRwdXQ6IDwvZGl2
Pgo8ZGl2PiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAmIzgyMzA7IDwvZGl2Pgo8
ZGl2IHN0eWxlPSJ0ZXh0LWluZGVudDozNnB0OyI+TWFudWZhY3R1cmVyQ2VydGlmaWNhdGVzIDog
e1tTdWJqZWN0XTwvZGl2Pgo8ZGl2PiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyBUUE1WZXJzaW9uPWlkOjA3M0UsIFRQTU1vZGVsPVNMQiA5Njcw
IFRQTTIuMCwgVFBNTWFudWZhY3R1cmVyPWlkOjQ5NDY1ODAwPC9kaXY+CjxkaXY+Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IFtJc3N1ZXJdPC9kaXY+CjxkaXY+Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IENOPUlu
ZmluZW9uIE9QVElHQShUTSkgUlNBIE1hbnVmYWN0dXJpbmcgQ0EgMDM0LCBPVT1PUFRJR0EoVE0p
IFRQTTIuMCwgTz1JbmZpbmVvbiBUZWNobm9sb2dpZXMgQUcsIEM9REU8L2Rpdj4KPGRpdiBzdHls
ZT0idGV4dC1pbmRlbnQ6MzZwdDtwYWRkaW5nLWxlZnQ6MzZwdDsiPiYjODIzMDs8L2Rpdj4KPGRp
dj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgW1NlcmlhbCBOdW1i
ZXJdPC9kaXY+CjxkaXY+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7IDQ4ODBERThFPC9kaXY+CjxkaXY+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7IFtUaHVtYnByaW50XTwvZGl2Pgo8ZGl2PiZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBCODM5NURBNkExRDY2MUM4
Q0NEMzVENDdFM0RBNkU5NTMyRUZGRUM0PC9kaXY+CjxkaXY+Jm5ic3A7PC9kaXY+CjxkaXY+QnV0
IGhvdyBjYW4gSSBnZXQgdGhpcyBzYW1lIFNlcmlhbCBOdW1iZXIgaW5mb3JtYXRpb24gdXNpbmcg
QysrPzwvZGl2Pgo8ZGl2PiZuYnNwOzwvZGl2Pgo8ZGl2PmFwPC9kaXY+CjxkaXY+Jm5ic3A7PC9k
aXY+Cjwvc3Bhbj48L2ZvbnQ+CjwvYm9keT4KPC9odG1sPgo=

--===============7677372847003490937==--

