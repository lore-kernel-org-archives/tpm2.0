Content-Type: multipart/mixed; boundary="===============1140701472427544431=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: How we authorize the EK hierarchy to create AIK?
Date: Thu, 04 Jun 2020 15:03:08 +0000
Message-ID: <SN6PR11MB34372743D7FBA9DD542F6674B8890@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: 20200604131434.2851.68222@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1140701472427544431==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Since version 4.0 and up, via this commit:
https://github.com/tpm2-software/tpm2-tools/commit/56710b6e1c4d3e02ff77ad36=
7c216a59b51ca765

You can specify --tcti=3Dnone to tpm2_makecredential to not use the TPM.

Before that, In some circa 3.X tools you can use the -X option, but I don't=
 recommend using any toolset less
than version 4.0, it has too many issues before the 4.0 release. It's like =
Android, it didn't get good until
Ice Cream Sandwich and 3.0 was definitely my honeycomb disaster.

Bill

> -----Original Message-----
> From: Eduardo Falc=C3=A3o <eduardolfalcao(a)gmail.com>
> Sent: Thursday, June 4, 2020 8:15 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Re: How we authorize the EK hierarchy to create AIK?
> =

> Thank you, Roberts. Now it is completely clear the need of a session.
> =

> Regarding the server side, would it be possible to create a credential ov=
er the AK
> and nonce without TPM (tpm2_makecredential)?
> If so, could you point me some direction?
> =

> Best regards
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============1140701472427544431==--

