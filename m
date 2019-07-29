Content-Type: multipart/mixed; boundary="===============3324989057045237080=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] PCR Policy enforcement when using nvram
Date: Mon, 29 Jul 2019 23:55:58 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649DD3FC2@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649DD3F13@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3324989057045237080==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<snip>
> > >
> > > I believe your right.  If I used policyRead only and gave up on
> > > policyAuth (and the -P switch), it would have succeeded and failed
> > > as expected.  I'm just hoping I can get it to get both working simult=
aneously.
> > >
> > > I really appreciate your response.  I'll play around with object
> > > workflow.  If anyone has tips on making authValue AND authPolicy
> > > apply to nvram or have a comparable method with objects, I'd love to =
hear
> them.
> =

> =

> I misunderstood...you want BOTH.. then you need to create a policy to do =
what
> you desire and only enable policy authorization. Which means you would ne=
ed
> policyand, which we don't have on master yet, just policyor.

Geez, I had a moment. The policyand is just running policy events. If and i=
s what you wanted this
does it (requires tpm2-abrmd or direct device access, no in kernel rm /dev/=
tpmrm0):

tpm2_startauthsession -S s.dat
tpm2_policypassword -S s.dat
tpm2_policypcr -S s.dat -l sha256:0,1,2,3 -L policy.dat
tpm2_nvdefine -C o -p foobar -x 0x1500016 -s 32 -L policy.dat -a "policyrea=
d|policywrite"
tpm2_flushcontext s.dat
rm s.dat

# repeats steps with real policy session
tpm2_startauthsession --policy -S s.dat

# works
tpm2_policypassword -S s.dat
tpm2_policypcr -S s.dat -l sha256:0,1,2,3 -L policy.dat
echo 'secret' | tpm2_nvwrite -P session:s.dat+foobar -x 0x1500016

# update PCRs
tpm2_pcrevent 0 <<< 'djshfsjdhsdjhdfs'

# fails
echo 'secret' | tpm2_nvwrite -P session:s.dat+foobar -x 0x1500016
WARNING:esys:src/tss2-esys/api/Esys_NV_Write.c:306:Esys_NV_Write_Finish() R=
eceived TPM Error =

ERROR:esys:src/tss2-esys/api/Esys_NV_Write.c:110:Esys_NV_Write() Esys Finis=
h ErrorCode (0x0000099d) =

ERROR: Failed to write NV area at index 0x1500016
ERROR: Tss2_Sys_NV_Write(0x99D) - tpm:session(1):a policy check failed
ERROR: Unable to run tpm2_nvwrite

-- end of script

I didn't get policyor working, I could get it to auth for the password side=
, but not the pcr part
Of the or branch, likely something I am not getting. So if you want OR, I d=
on't have the answer
at the moment.

> =

> It's be a mix of tpm2_startauthsession, tpm2_policypassword/tpm2_policyse=
cret
> tpm2_policypcr and tpm2_policyand, which will give you some policy digest=
. Then
> create an nvspace with that policy digest and only policycread|policywrit=
e.
> =

> Imran can probably give you a full example with policyor, then when we ha=
ve
> policyand, you can just swap it out or you could write policyand and upst=
ream it
> to us.

--===============3324989057045237080==--

