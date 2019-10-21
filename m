Content-Type: multipart/mixed; boundary="===============5436641277852434220=="
MIME-Version: 1.0
From: Zhu, Bing <bing.zhu at intel.com>
Subject: [tpm2] Re: Protecting TPM objects
Date: Mon, 21 Oct 2019 02:43:15 +0000
Message-ID: <A3DEEEBB19900C48B49572CB9C2891C9879C9928@SHSMSX108.ccr.corp.intel.com>
In-Reply-To: 4b287a95-ace4-836c-4d51-42510e8e4980@wisi.se
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5436641277852434220==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Each authorization Hierarchy has its own authvalue, by default, the authval=
ue is empty. But you can change this authvalue to a high entropy secret.

For platform authorization, its authvalue will be reset to empty after each=
 power cycle. typically BIOS/FW should change it to a high entropy secret a=
fter using at boot time, then discard this secret or disable platform autho=
rization before handoff to bootloader/OS. So that nobody else in OS can use=
 platform authorization.

Take TPM NV storage as example, you can configure different policy to gate =
access control to the secret stored in NV storage. e.g. you can configure a=
 password-only access so that even if you have owner hierarchy authvalue, y=
ou cannot even access it. (but you can delete it and re-create it with your=
 owner hierarchy authvalue).

Bing =


> -----Original Message-----
> From: Max Halld=C3=A9n <max.hallden(a)wisi.se>
> Sent: Friday, October 18, 2019 18:28 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Protecting TPM objects
> =

> Hi all,
> =

> I'm a bit confused about the different authorizations and if anyone could=
 help me
> clear some things up that would be a great help.
> =

> The platform authorization seems to be reset on each reboot which makes s=
ense
> in a way that it is up for grabs by whatever boots first.
> =

> But if I create an object under the owner or endorsement hierarchies, doe=
s this
> mean it can never be accessed without the password for those hierarchies?=
 Even
> by someone with platform authorization?
> =

> If I also create it with a password or any other kind of authorization, c=
an it also
> not be accessed by someone with authorization for that hierarchy? For exa=
mple,
> is a primary key created with password protection unique to that password=
 or
> can it be recreated by someone with access to that hierarchy?
> =

> To be a bit more specific, I'm trying to figure out in what cases a passw=
ord
> protected decryption key can't be accessed by anyone without access to the
> password (but could otherwise have full access to the TPM hardware).
> =

> Regards,
> Max
> =

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-
> leave(a)lists.01.org %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============5436641277852434220==--

