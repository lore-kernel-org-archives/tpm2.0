Content-Type: multipart/mixed; boundary="===============4077129174032786737=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Any suggestions on how to lock a TPM without passwords?
Date: Thu, 14 Nov 2019 15:58:16 -0800
Message-ID: <CAOCvsSnCkn45EOTxzubDM3Q34NC2hPzzCsf17haBjVGvxn8hWg@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4077129174032786737==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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
--===============4077129174032786737==--

