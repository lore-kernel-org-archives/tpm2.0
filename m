Content-Type: multipart/mixed; boundary="===============0213244192601544853=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] PCR Policy enforcement when using nvram
Date: Mon, 29 Jul 2019 14:42:09 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649DD3E14@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CA++-fmtsWkysO=BKPmB8kCUw7aAu8YXeyBpC4kZS_9pEzOYJbw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0213244192601544853==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Garrett Fiel=
ds
> Sent: Saturday, July 27, 2019 2:32 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] PCR Policy enforcement when using nvram
> =

> Hey all.  I'm new here.  I've been browsing several guides and the wikis =
to learn
> tpm2-tools and I have had some successes.
> =

> I work with the ZFS on Linux project, which has recently incorporated enc=
ryption.
> The system, so far, allows a single passphrase or keyfile, which can be p=
iped into
> the unlock command.  Manual passprhase entry during initramfs works, but I
> wanted to store that passphrase in the tpm and have the system autounlock=
 with
> successful pcr system checks.  I started with tpm 1.2 and now trying with=
 2.0.
> =

> What I implemented via 1.2:
> Create a nvram index that unlocks with after pcr values are verified and =
correct
> index passphrase (which is the GUID of the drive) is supplied.
> =

> Then I block later reads of that index until reboot by doing a 0-byte rea=
d of the
> index (just to block nosy individuals).

Can't you do tpm2_nvreadlock?

> =

> With the expanded TPM2.0 toolset, is nvram the preferred way to do this?
> Should I be using TPM objects instead?  Something else?

NVRAM is just NVRAM... its memory used to hole non-volatile things like
Persistent objects and NV space.

> =

> I am developing this using Ubuntu 18.04.2 LTS (tpm2-tools 2.1.0-1build1).=
  I've
> noticed that the options shift significantly with the version of tpm2-too=
ls.

Yep (soorry) the 4.0 release (current master) in August will be the last ti=
me this
happens in a non-backwards compatible way.

> =

> Here's what I have working so far (nvram index secured with password only=
 and
> lockable):
> ------
> export TPM2TOOLS_TCTI=3D"device:/dev/tpm0"
> tpm2_takeownership -o ownerpass -e endorsepass tpm2_nvdefine -x 0x1000000
> -a o -P ownerpass -p indexsecret -b "authread|authwrite|read_stclear" -s =
11
> echo "hdpassword" | tpm2_nvwrite  -x 0x1000000 -a 0x1000000 -P indexsecret
> tpm2_nvread -x 0x1000000 -a 0x1000000 -P indexsecret tpm2_nvreadlock  -x
> 0x1000000 -a 0x1000000 -P indexsecret # when needed:  tpm2_nvrelease -x
> 0x1000000 -a 0 -P ownerpass

Per section 37.2.5 of https://trustedcomputinggroup.org/wp-content/uploads/=
TPM-Rev-2.0-Part-1-Architecture-01.38.pdf
TPMA_NV_AUTHREAD allows the Index to be read using the authValue of the Ind=
ex; and
TPMA_NV_POLICYREAD allows the Index to be read if the authPolicy of the Ind=
ex is satisfied.
---

I think you're ending up in an OR situation, AUTH value OR policy. IIRC, Ja=
vier hit this issue too, I
added him to see if he can enlighten us.

FYI you should use tpm2_policyauthorize, locking to PCR values is brittle. =
If anything changes, you
can lock yourself out of the object. This way you lock it to a signed polic=
y and that policy can
change. Ie PCR values change on update.

> =

> ------
> =

> I would really like to incorporate the pcr system check also (kinda the w=
hole
> point).  I tried:
> -----------
> tpm2_listpcrs --tcti=3Ddevice    #To see current values
> tpm2_createpolicy -L sha1:0,1,2,3,4,5,6,7 -o ./0-7policy.pol --policy-pcr
> =

> tpm2_nvdefine -x 0x1000000 -a o -P ownerpass -p indexsecret -L ./0-7polic=
y.pol -
> b "authread|authwrite|read_stclear" -s 11
> =

> echo "hdpassword" | tpm2_nvwrite  -x 0x1000000 -a 0x1000000 -P indexsecret
> =

> tpm2_nvlist   # Verfiied that 0x1000000 has a "authorization policy"
> tpm2_nvread -x 0x1000000 -a 0x1000000 -P indexsecret   #Expected to work =
since
> PCRs are the same as policy creation
> tpm2_pcrextend 4:sha1=3Df1d2d2f924e986ac86fdf7b36c94bcdf32beec15
> =

> tpm2_listpcrs    #Verify pcr4 is different
> tpm2_nvread -x 0x1000000 -a 0x1000000 -P indexsecret   #Expected to fail
> -----------
> The last line I would expect to fail, because of the PCR4 change, but it =
still
> produces the password.  Am I missing something on the nvdefine to enable
> policy enforcement?

I think if you dropped that password it would fail on both commands. You ne=
ed
To ensure that TPMA_NV_POLICYREAD is in there. Looking at 3.X and master
branch, I don't see us checking if -L is specified and adding TPMA_NV_POLIC=
YREAD
so it's something you would have to do via attributes.

> =

> I'd be eager to receive comments on my entire usage.  I know there is a l=
ot of
> TPM2 that I haven't started wrapping my head around.  Suggestions or poin=
ters
> would be appreciated.


--===============0213244192601544853==--

