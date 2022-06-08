Content-Type: multipart/mixed; boundary="===============2240072114937492083=="
MIME-Version: 1.0
From: Remi Tricot-Le Breton <rlebreton at haproxy.com>
Subject: [tpm2] TPM2 provider stuck during handshake
Date: Wed, 08 Jun 2022 16:16:22 +0200
Message-ID: <a2a22769-f6cb-7e5a-8db1-db1dd9f6e6e9@haproxy.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2240072114937492083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I've been trying to make the TPM2 provider work in my environment =

(Ubuntu 20.04) for quite some time and I did not succeed yet.

I tried using the commands suggested in docs/certificates.md to create a =

self signed certificate which I then used in an "openssl s_server" =

instance but when I try to connect to this SSL server, the handshake =

fails to complete.
The three commands I used are the following:
 =C2=A0=C2=A0=C2=A0 openssl req -provider tpm2 -x509 -subj "/C=3DGB/CN=3Dfo=
o" -keyout =

testkey.pem -out testcert.pem
 =C2=A0=C2=A0=C2=A0 openssl s_server -provider tpm2 -provider default -prop=
query =

?provider=3Dtpm2 -accept 4443 -www -key testkey.pem -cert testcert.pem
 =C2=A0=C2=A0=C2=A0 curl --cacert testcert.pem https://localhost:4443/

The curl command ends in a timeout and the server remains stuck (without =

raising errors).

I rebuilt the tpm2 provider with the enable-debug=3Dyes option added in =

order to understand what was happening and I noticed that the server was =

stuck when trying to duplicate a context ("DIGEST DUP" was dumped on the =

server's standard output), and more specifically in the =

Tss2_Sys_ExecuteFinish function which in turn calls tctildr_receive with =

a -1 timeout (out of which we apparently never get out).

Do any of you know if I missed something or if it is a bug ?
I could provide the full standard output log or a complete backtrace of =

the stuck server if needed but they might end up being unnecessary noise =

if the bug comes from my wrong use of the provider.

Thanks

R=C3=A9mi LB
--===============2240072114937492083==--

