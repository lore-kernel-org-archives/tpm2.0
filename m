Content-Type: multipart/mixed; boundary="===============6202589433330074670=="
MIME-Version: 1.0
From: Ted Kim <ted.h.kim at oracle.com>
Subject: [tpm2] Re: [External] : Re: Error on service tpm2-abrmd start
Date: Wed, 24 Feb 2021 08:46:32 -0800
Message-ID: <12cd4499-d0c5-3497-67d7-29853b7b6c62@oracle.com>
In-Reply-To: SN6PR11MB3437854834FE46BC9F6FD8D9B89F9@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6202589433330074670==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Kenneth,

> If you want to run as root, you can pass --allow-root, but usually you =

> don't need root to run the daemon. /dev/tpm0 should be labelled as =

> user tss2 and /dev/tpmrm0 should be user and group tss2.

Not sure if this is your issue, but in some Linux environments, SELinux =

integration can be an issue on this point. Either there has to be a =

proper selinux package (e.g. tpm2-abrmd-selinux in Fedora) to use with =

abrmd which takes care of these type of issues or it has to be set to be =

permissive.

-ted

-- =

Ted H. Kim, PhD
ted.h.kim(a)oracle.com
+1 310-258-7515


--===============6202589433330074670==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGhlYWQ+CjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0idGV4
dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4KICA8L2hlYWQ+CiAgPGJvZHk+CiAgICA8cD5LZW5uZXRo
LDwvcD4KICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIGNpdGU9Im1pZDpTTjZQUjExTUIzNDM3
ODU0ODM0RkU0NkJDOUY2RkQ4RDlCODlGOUBTTjZQUjExTUIzNDM3Lm5hbXByZDExLnByb2Qub3V0
bG9vay5jb20iPgogICAgICA8ZGl2Pjxmb250IGZhY2U9IkNhbGlicmkiPgogICAgICAgICAgSWYg
eW91IHdhbnQgdG8gcnVuIGFzIHJvb3QsIHlvdSBjYW4gcGFzcyAtLWFsbG93LXJvb3QsIGJ1dAog
ICAgICAgICAgdXN1YWxseSB5b3UgZG9uJ3QgbmVlZCByb290IHRvIHJ1biB0aGUgZGFlbW9uLiAv
ZGV2L3RwbTAKICAgICAgICAgIHNob3VsZCBiZSBsYWJlbGxlZCBhcyB1c2VyIHRzczIgYW5kIC9k
ZXYvdHBtcm0wIHNob3VsZCBiZSB1c2VyCiAgICAgICAgICBhbmQgZ3JvdXAgdHNzMi48L2ZvbnQ+
PC9kaXY+CiAgICA8L2Jsb2NrcXVvdGU+CiAgICA8cD5Ob3Qgc3VyZSBpZiB0aGlzIGlzIHlvdXIg
aXNzdWUsIGJ1dCBpbiBzb21lIExpbnV4IGVudmlyb25tZW50cywKICAgICAgU0VMaW51eCBpbnRl
Z3JhdGlvbiBjYW4gYmUgYW4gaXNzdWUgb24gdGhpcyBwb2ludC4gRWl0aGVyIHRoZXJlCiAgICAg
IGhhcyB0byBiZSBhIHByb3BlciBzZWxpbnV4IHBhY2thZ2UgKGUuZy4gdHBtMi1hYnJtZC1zZWxp
bnV4IGluCiAgICAgIEZlZG9yYSkgdG8gdXNlIHdpdGggYWJybWQgd2hpY2ggdGFrZXMgY2FyZSBv
ZiB0aGVzZSB0eXBlIG9mIGlzc3VlcwogICAgICBvciBpdCBoYXMgdG8gYmUgc2V0IHRvIGJlIHBl
cm1pc3NpdmUuIDxicj4KICAgIDwvcD4KICAgIDxwPi10ZWQ8YnI+CiAgICA8L3A+CiAgICA8cHJl
IGNsYXNzPSJtb3otc2lnbmF0dXJlIiBjb2xzPSI3MiI+LS0gClRlZCBILiBLaW0sIFBoRAo8YSBj
bGFzcz0ibW96LXR4dC1saW5rLWFiYnJldmlhdGVkIiBocmVmPSJtYWlsdG86dGVkLmgua2ltQG9y
YWNsZS5jb20iPnRlZC5oLmtpbUBvcmFjbGUuY29tPC9hPgorMSAzMTAtMjU4LTc1MTU8L3ByZT4K
ICA8L2JvZHk+CjwvaHRtbD4K

--===============6202589433330074670==--

