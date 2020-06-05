Content-Type: multipart/mixed; boundary="===============3237390229992374287=="
MIME-Version: 1.0
From: Florian.Schreiner at infineon.com
Subject: [tpm2] Re: tpm2_takeownership equivalent command in tpm2-tools v4.1
Date: Fri, 05 Jun 2020 09:13:55 +0000
Message-ID: <939b763fbd094311b266c412deba3f2b@infineon.com>
In-Reply-To: 20200605082049.2851.31127@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3237390229992374287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

The TakeOwnership is a functionality defined in the TPM 1.2 specification. =
This doesn't exist anymore in the TPM 2.0 library specification.
Maybe the TPM-tool for FAP "tss2_provision.c" provides what you are looking=
 for. =


Best,
Florian

-----Original Message-----
From: Chenxi Z <cxzhang1981(a)hotmail.com> =

Sent: Freitag, 5. Juni 2020 10:21
To: tpm2(a)lists.01.org
Subject: [tpm2] tpm2_takeownership equivalent command in tpm2-tools v4.1

Caution: This e-mail originated outside Infineon Technologies. Do not click=
 on links or open attachments unless you validate it is safe <http://iweb.i=
nfineon.com/en-US/Support/security/CDC/pse/Pages/pce.aspx>.


Hi,

I've been using the cmd "tpm2_takeownership" in tpm2-tools v1.1 for years. =
I am now upgrading tpm2-tools to the upstream version, whereas "tpm2_takeow=
nership" is not supported any more.
Can I know what the equivalent api is used in the upstream version?


Thank you in advance.
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org %(web_page_url)sl=
istinfo%(cgiext)s/%(_internal_name)s

--===============3237390229992374287==--

