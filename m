Content-Type: multipart/mixed; boundary="===============5708372957311376973=="
MIME-Version: 1.0
From: Zhu, Bing <bing.zhu at intel.com>
Subject: [tpm2] Re: Any suggestions on how to lock a TPM without passwords?
Date: Mon, 18 Nov 2019 00:17:52 +0000
Message-ID: <A3DEEEBB19900C48B49572CB9C2891C987A19406@SHSMSX108.ccr.corp.intel.com>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D0163BDD45C@EXCH2010B.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5708372957311376973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>> - You can call Esys_ClearControl to disallow a TPM Clear by the storage =
hierarchy.
Probably you may need to have Platform authorization in order to do this, c=
orrect me if I'm wrong?


Let me try to understand the problems from Steven Clark, please correct me =
if I'm misunderstanding them:
1. you have a secret or asset stored in TPM NV (assume you're talking about=
 TPM2.0)
2. you want it to be persistent in TPM (no one is allowed to delete it and =
then recreate it with roll-backed value or whatever)
3. you want its value in NV to be locked at some point (then nobody is allo=
wed to write/modify its value. How about reading its value?)
4. and you don't want to use password to protect that.
5. but you don't have Platform Authorization, so you cannot do it like what=
 Google's Chromium does!

Now, are you able to take TPM owner hierarchy? If yes, you can just take it=
, use it to create a NV, then discard/forget its authvalue. =

In this new created NV, we can set PCR policy to access (read or write) tha=
t NV index when creating it with owner hierarchy initially .

we also set a zero/empty policy for deletion, so that it won't be able to b=
e deleted (because zero digest policy can never be satisfied). =


Since we discard the owner's authvalue, so nobody can use the owner hierarc=
hy to delete this NV and recreate it.

But now, the only one who can delete our NV index is someone who have Platf=
orm Authorization. Typically, this is the platform firmware you have to tru=
st. It can use TPM2_Clear() to clear our index (and also reset/clear the ow=
ner  hierarchy)

However, typically, firmware exposes an interface to allow anyone to reques=
t firmware to do TPM_Clear() with PHYSICAL PRESENSE (e.g. by pressing a spe=
cial key right after platform reboot). If you can make firmware change, you=
 can ask for disabling this interface. Alternatively, if you can also reque=
st firmware (again firmware has Platform Authorization) to use ClearControl=
 to disallow TPM_Clear to clear your owner hierarchy's assets.


Bing



> -----Original Message-----
> From: Fuchs, Andreas <andreas.fuchs(a)sit.fraunhofer.de>
> Sent: Friday, November 15, 2019 17:04 PM
> To: Steven Clark <davolfman(a)gmail.com>; tpm2(a)lists.01.org
> Subject: [tpm2] Re: Any suggestions on how to lock a TPM without password=
s?
> =

> I think you have gotten to the base:
> No SH-password, no lockdown (of persistent keys and NV and such).
> =

> Some additions:
> - You can call Esys_ClearControl to disallow a TPM Clear by the storage h=
ierarchy.
> - For NV you can set a policy such that SH-auth cannot delete the index
> - If SH-Auth is set; you can make a remote connection to the device and c=
alculate
> the HMAC on a different machine (with keyboard or DB). You just need a ne=
tworked
> TCTI implementation.
> - You can set a Policy for SH with PolicyAuthorize in it to auth certain =
commands
> =

> But I guess that's it...
> Drop me a note if you want to come up and contribute any of this in code =
or learn
> more.
> =

> Cheers,
> Andreas
> ________________________________________
> From: Steven Clark [davolfman(a)gmail.com]
> Sent: Friday, November 15, 2019 00:58
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Any suggestions on how to lock a TPM without passwords?
> =

> For now our security is simply based on tampering with the TPM NV/persist=
ents
> breaking policies instead of satisfying them.  It would still be nice to =
actually
> prevent denial of service and maybe even extend the breadth of features e=
nabled
> by the TPM by limiting access to writes and partial clears of the TPM.  I=
 just don't yet
> have a good plan on how to do it.
> =

> The usual assumption for control of the hierarchies in the TPM is they ha=
ve password
> authorizations set by the user.  Our system isn't even going to have a ke=
yboard by
> default and even then any password would probably have to be installed fl=
eetwide
> which is a big cybersecurity KICK-ME sign.  So that's right out.
> =

> Google's approach in Chromium is apparently to set and forget a random pa=
ssword
> auth and then set some auth policies.  As far as I can tell Google can mo=
stly get
> away with this thanks to customized firmware which allows them to perform=
 writes
> under Platform authorization.  We aren't Google so our budget and influen=
ce is
> more limited than that.
> =

> Thanks to some trust in our initramfs we can probably perform some operat=
ions
> and/or measure into some PCRs there.  We won't have platform authorizatio=
n but at
> least we could start writelocking things (if we take/wait-for tools 4.1).=
  I just
> question if that's enough to secure some NV areas.  Is there a way to wip=
e the
> handles individually (or all of the NV) to write hostile or rolled-back v=
alues anyway?
> I'll determine this experimentally when I get the time but it would be ni=
ce if
> somebody knows.
> =

> Extended authorization policies could rescue some of this, but what kind =
of policy
> would it take to enable administration/writing under a set of conditions,=
 but not
> have those conditions be normally satisfied if you aren't depending on ma=
gic files or
> password strings?
> =

> Are there any interesting solutions out there I just haven't heard about?
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-
> leave(a)lists.01.org %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-
> leave(a)lists.01.org %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============5708372957311376973==--

