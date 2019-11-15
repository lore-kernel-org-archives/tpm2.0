Content-Type: multipart/mixed; boundary="===============8309062818783451434=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] Re: Any suggestions on how to lock a TPM without passwords?
Date: Fri, 15 Nov 2019 09:04:11 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0163BDD45C@EXCH2010B.sit.fraunhofer.de>
In-Reply-To: CAOCvsSnCkn45EOTxzubDM3Q34NC2hPzzCsf17haBjVGvxn8hWg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8309062818783451434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I think you have gotten to the base:
No SH-password, no lockdown (of persistent keys and NV and such).

Some additions:
- You can call Esys_ClearControl to disallow a TPM Clear by the storage hie=
rarchy.
- For NV you can set a policy such that SH-auth cannot delete the index
- If SH-Auth is set; you can make a remote connection to the device and cal=
culate
the HMAC on a different machine (with keyboard or DB). You just need a netw=
orked
TCTI implementation.
- You can set a Policy for SH with PolicyAuthorize in it to auth certain co=
mmands

But I guess that's it...
Drop me a note if you want to come up and contribute any of this in code or=
 learn more.

Cheers,
Andreas
________________________________________
From: Steven Clark [davolfman(a)gmail.com]
Sent: Friday, November 15, 2019 00:58
To: tpm2(a)lists.01.org
Subject: [tpm2] Any suggestions on how to lock a TPM without passwords?

For now our security is simply based on tampering with the TPM
NV/persistents breaking policies instead of satisfying them.  It would
still be nice to actually prevent denial of service and maybe even
extend the breadth of features enabled by the TPM by limiting access
to writes and partial clears of the TPM.  I just don't yet have a good
plan on how to do it.

The usual assumption for control of the hierarchies in the TPM is they
have password authorizations set by the user.  Our system isn't even
going to have a keyboard by default and even then any password would
probably have to be installed fleetwide which is a big cybersecurity
KICK-ME sign.  So that's right out.

Google's approach in Chromium is apparently to set and forget a random
password auth and then set some auth policies.  As far as I can tell
Google can mostly get away with this thanks to customized firmware
which allows them to perform writes under Platform authorization.  We
aren't Google so our budget and influence is more limited than that.

Thanks to some trust in our initramfs we can probably perform some
operations and/or measure into some PCRs there.  We won't have
platform authorization but at least we could start writelocking things
(if we take/wait-for tools 4.1).  I just question if that's enough to
secure some NV areas.  Is there a way to wipe the handles individually
(or all of the NV) to write hostile or rolled-back values anyway?
I'll determine this experimentally when I get the time but it would be
nice if somebody knows.

Extended authorization policies could rescue some of this, but what
kind of policy would it take to enable administration/writing under a
set of conditions, but not have those conditions be normally satisfied
if you aren't depending on magic files or password strings?

Are there any interesting solutions out there I just haven't heard about?
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============8309062818783451434==--

