Content-Type: multipart/mixed; boundary="===============8710119355190994966=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Proper way to create a owner-write, any-read TPM2 nvindex?
Date: Wed, 09 Dec 2020 17:53:10 +0000
Message-ID: <SN6PR11MB3437940E8832A08A652D75DBB8CC0@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: CAHC9VhQhO+QX0BoVmEVprH7rnxpo5biUR26XCgeS0Bx+C9_Ruw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8710119355190994966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Paul Moore <paul(a)paul-moore.com>
> Sent: Tuesday, December 8, 2020 11:48 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Proper way to create a owner-write, any-read TPM2 nvindex?
> =

> Hello all,
> =

> I'm trying to define a TPM2 nvindex that is only writable when authentica=
ted with
> the owner password, but is readable by anyone, regardless of authenticati=
on.
> Through a combination of looking at the docs and some trial-and-error I've
> arrived at the following:
> =

> % tpm2_nvdefine -a "ownerwrite|ownerread|authread" -P $PASSWD $NVINDEX
> =

> ... which leaves me with two questions:
> =

> * Is this the recommended way to define an owner-write, any-read TPM2
> nvindex?

I don't know if it's the "recommended way", but it LGTM.

> =

> * Why do I need to specify "authread", and is this correct?  Quickly skim=
ming the
> TPM2 specs, I'm still a bit puzzled by the meaning of
> "authread"/TPMA_NV_AUTHREAD.
> =

> Any comments, advice, etc. would be appreciated - thanks!

So you can authenticate to a NV index in a multitude of ways:
1. hiearchy auth ie TPMA_NV_OWNER.* bits
2. Policy ie TPMA_NV_POLICY.* bits
3. AuthValue ie password in command header/HMAC session

> =

> --
> paul moore
> www.paul-moore.com
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============8710119355190994966==--

