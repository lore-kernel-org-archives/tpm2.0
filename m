Content-Type: multipart/mixed; boundary="===============8659313816914088874=="
MIME-Version: 1.0
From: Paul Moore <paul at paul-moore.com>
Subject: [tpm2] Re: Proper way to create a owner-write, any-read TPM2 nvindex?
Date: Wed, 09 Dec 2020 14:56:55 -0500
Message-ID: <CAHC9VhT+K8_54j+CesemSg+fQq6dNVMnh2Y9UX43-OdkFJBVqQ@mail.gmail.com>
In-Reply-To: SN6PR11MB3437940E8832A08A652D75DBB8CC0@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8659313816914088874==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 9, 2020 at 12:53 PM Roberts, William C
<william.c.roberts(a)intel.com> wrote:
> > -----Original Message-----
> > From: Paul Moore <paul(a)paul-moore.com>
> > Sent: Tuesday, December 8, 2020 11:48 AM
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] Proper way to create a owner-write, any-read TPM2 nvind=
ex?
> >
> > Hello all,
> >
> > I'm trying to define a TPM2 nvindex that is only writable when authenti=
cated with
> > the owner password, but is readable by anyone, regardless of authentica=
tion.
> > Through a combination of looking at the docs and some trial-and-error I=
've
> > arrived at the following:
> >
> > % tpm2_nvdefine -a "ownerwrite|ownerread|authread" -P $PASSWD $NVINDEX
> >
> > ... which leaves me with two questions:
> >
> > * Is this the recommended way to define an owner-write, any-read TPM2
> > nvindex?
>
> I don't know if it's the "recommended way", but it LGTM.

 :)

Thanks.

> > * Why do I need to specify "authread", and is this correct?  Quickly sk=
imming the
> > TPM2 specs, I'm still a bit puzzled by the meaning of
> > "authread"/TPMA_NV_AUTHREAD.
> >
> > Any comments, advice, etc. would be appreciated - thanks!
>
> So you can authenticate to a NV index in a multitude of ways:
> 1. hiearchy auth ie TPMA_NV_OWNER.* bits
> 2. Policy ie TPMA_NV_POLICY.* bits
> 3. AuthValue ie password in command header/HMAC session

I guess my source of confusion is that with
"ownerwrite|ownerread|authread", why am I able to read it without any
credentials?  For example, using the nvindex definition above I can
read it without any creds using the command below:

% tpm2_nvread $NVINDEX

-- =

paul moore
www.paul-moore.com
--===============8659313816914088874==--

