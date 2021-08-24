Content-Type: multipart/mixed; boundary="===============3172450920677793502=="
MIME-Version: 1.0
From: Felix Rubio Dalmau <felix at kngnt.org>
Subject: [tpm2] Re: Example with multifactor authentication available?
Date: Tue, 24 Aug 2021 20:29:33 +0200
Message-ID: <1670959.retPWs6WYh@polaris>
In-Reply-To: SN6PR11MB3437A3106D2F05D303CDF829B8C49@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3172450920677793502==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi William,

first of all, thank you very much for your email! I have one question: so f=
ar, I am issuing all these commands after clearing the tpm and without taki=
ng ownership of it (so, I am not specifying any password at all). If doing =
so, and using the TPM owner password as the rescue password... do you think=
 that is a good idea? I am not challenging you, but I would like to get you=
r thoughts.

Thank you very much!

Felix

On Monday, 23 August 2021 22:48:38 CEST Roberts, William C wrote:
> I got a few things wrong in that response, my apologies and let me try an=
d clarify:
> =

> policypassword - allows you to specify a password to use an object when t=
he objects userauth attribute is 0. For objects that are only able to
> be authenticated to with policies.
> =

> policysecret - couple an objects auth value to something else, like the o=
wner hierarchy.
> =

> policyauthorize - couple an objects auth value to a signing authority.
> =

> We only care about the first two things here, policy password and policys=
ecret.
> =

> The keys here are understanding what you want based on the attributes of =
an object and how auth work in the TPM.
> Objects can either have userwithauth 1 or 0, if it's 0, then only policy =
based authorization will work. When you create the
> object, a policy hash is stored in the public portion and the password if=
 specified is stored in the private portion. When you want
> to use that object, the TPM will require policy-based authorizations, if =
you want the TPM to investigate the command  header for a password
> then you have to use the policypassword command so it knows. If you set a=
 password for an object with userwithauth 1 attribute, then you can authent=
icate to it with either the policy or the password, so we need to turn this=
 off to get it into the AND requirement you have.
> =

> The manpage for policyor actually gives  this exact scenario:
> https://github.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_policyor=
.1.md#examples
> =

> But in your initial email you talk about a policy where its policy(passwo=
rd1) or policy(password2, PCR), to get there you would need to use
> policysecret since you need an object to have multiple auth values, an ob=
ject can only have one, so policysecret would let you couple N
> secrets.
> =

> Here's a gist (https://gist.github.com/williamcroberts/7a3bba2f45bf28c5a1=
9c5e13e5c8da21)
> that seems to do what you want, I sourced it and did this on a SIMULATOR:
> =

> tpm2_changeauth -c o ownerpass
> tpm2_createprimary -c primary.ctx
> =

> do_policy_secret
> 0d84f55daf6e43ac97966e62c9bb989d3397777d25c5f749868055d65394f952
> =

> do_policy_pcr_and_pass
> 8fcd2169ab92694e0c633f1ab772842b8241bbc20288981fc7ac1eddc1fddb0e
> ea35b777fa3f5a5e702f0a42691e37cf3e76a7a8e2894bc7e61a2d0effbd0e74
> =

> do_policy_or
> 952a41a9678af53d04e6607a5ed51d522023e81a1fd68872e9dcc96fee2be3fb
> =

> do_create
> name-alg:
>   value: sha256
>   raw: 0xb
> attributes:
>   value: fixedtpm|fixedparent
>   raw: 0x12
> type:
>   value: keyedhash
>   raw: 0x8
> algorithm:
>   value: null
>   raw: 0x10
> keyedhash: ecddbf75431eeb635d118ef59dc9a100612bb595bf42164dc7af43efedeae3=
ab
> authorization policy: 952a41a9678af53d04e6607a5ed51d522023e81a1fd68872e9d=
cc96fee2be3fb
> =

> do_unseal_pcr
> 8fcd2169ab92694e0c633f1ab772842b8241bbc20288981fc7ac1eddc1fddb0e
> ea35b777fa3f5a5e702f0a42691e37cf3e76a7a8e2894bc7e61a2d0effbd0e74
> 952a41a9678af53d04e6607a5ed51d522023e81a1fd68872e9dcc96fee2be3fb
> mysecret
> =

> do_break_pcr
> sha1: f1d2d2f924e986ac86fdf7b36c94bcdf32beec15
> sha256: b5bb9d8014a0f9b1d61e21e796d78dccdf1352f23cd32812f4850b878ae4944c
> sha384: 8effdabfe14416214a250f935505250bd991f106065d899db6e19bdc8bf648f3a=
c0f1935c4f65fe8f798289b1a0d1e06
> sha512: 0cf9180a764aba863a67b6d72f0918bc131c6772642cb2dce5a34f0a702f9470d=
dc2bf125c12198b1995c233c34b4afd346c54a2334c350a948a51b6e8b4e6b6
> =

> do_unseal_pcr
> 8fcd2169ab92694e0c633f1ab772842b8241bbc20288981fc7ac1eddc1fddb0e
> 05f7f361e2dd7efde0aee1f0e2a36a49185b6c1fa479f46f09dad68b2af9df7b
> WARNING:esys:src/tss2-esys/api/Esys_PolicyOR.c:286:Esys_PolicyOR_Finish()=
 Received TPM Error
> ERROR:esys:src/tss2-esys/api/Esys_PolicyOR.c:100:Esys_PolicyOR() Esys Fin=
ish ErrorCode (0x000001c4)
> ERROR: Esys_PolicyAuthorize(0x1C4) - tpm:parameter(1):value is out of ran=
ge or is not correct for the context
> ERROR: Could not build policyor TPM
> ERROR: Unable to run tpm2_policyor
> WARNING:esys:src/tss2-esys/api/Esys_Unseal.c:295:Esys_Unseal_Finish() Rec=
eived TPM Error
> ERROR:esys:src/tss2-esys/api/Esys_Unseal.c:98:Esys_Unseal() Esys Finish E=
rrorCode (0x0000099d)
> ERROR: Esys_Unseal(0x99D) - tpm:session(1):a policy check failed
> ERROR: Unable to run tpm2_unseal
> =

> # recover with owner pass
> do_unseal_recovery
> 0d84f55daf6e43ac97966e62c9bb989d3397777d25c5f749868055d65394f952
> 952a41a9678af53d04e6607a5ed51d522023e81a1fd68872e9dcc96fee2be3fb
> mysecret
> =

> ________________________________
> From: Felix Rubio Dalmau <felix(a)kngnt.org>
> Sent: Sunday, August 22, 2021 2:57 AM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
> Subject: Re: [tpm2] Example with multifactor authentication available?
> =

> =

> Hi William,
> =

> =

>     Sorry for answering so late after your last email. I had to jump to a=
nother subject, then holidays... yeah, life I guess! I have started again l=
ooking at this matter, and... I do not understand the part of the rescue pa=
ssword and how to use it. I see that using policysecret is the way to go, b=
ecause it does not set any flag to require a password when the create is is=
sued, but I still do not see how to use it to input a password. In the help=
 of policysecret, it states:
> =

> =

>      "TPM2_PolicySecret command requires you to pass in the name of the o=
bject whose password is required to satisfy the policy"
> =

> =

> Does this mean that I should create an object, password-protected, just f=
or the sake of using it later with policysecret?? It sounds weird to me, bu=
t I am not skilled enough to properly assess it.
> =

> =

> Regards!
> =

> Felix
> =

> =

> On Monday, 14 June 2021 20:51:14 CEST Roberts, William C wrote:
> =

> > Two things, if you need different PCR values than what's on the system,=
 the TPM only cares about the hash of all the banks, so you can just specif=
y that expected hash of the PCR state as argument 3 to tpm2_policypcr as sh=
own in the man page (since 5.0). If on early versions, you can create a bin=
ary file, that's a list of binary hashes in order of the PCR selection. Ie =
if you did sha256:1,2,3, the file would be 3 * 32 bytes in size and contain=
 the hashes of PCR1, 2, 3 in that order. This is the binary format from tpm=
2_pcrread -o, so if you have a system in the expected state, you can use th=
at to output it, or hand jam it.
> =

> >
> =

> > policy password just says, hey require a password for this object, and =
it will be found in the TPM header in the command.
> =

> >
> =

> > So, the better way would be to look at policysecret, which effectively =
does the same thing, but puts it in the session
> =

> > over the command header. Thus, you can have multiple secrets for an obj=
ect.
> =

> >
> =

> > Typically, for a recovery password, folks couple it to the hierarchy th=
e object belongs in via policyauthorize.
> =

> >
> =

> > ________________________________
> =

> > From: Felix Rubio Dalmau <felix(a)kngnt.org>
> =

> > Sent: Saturday, June 12, 2021 12:58 AM
> =

> > To: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
> =

> > Subject: [tpm2] Example with multifactor authentication available?
> =

> >
> =

> >
> =

> > Hi everybody!
> =

> >
> =

> >
> =

> > I am still learning about tpm and tpm2-tools. Following the advice from=
 William Roberts, I set the authentication policy up as AND(pcr, password) =
by doing the following:
> =

> >
> =

> >
> =

> >     # create a policy that requires the pcr and the password
> =

> >
> =

> >     tpm2_startauthsession -S session.dat
> =

> >
> =

> >     tpm2_policypcr -S session.dat -l "sha1:0,1,2,3" -L policy.dat
> =

> >
> =

> >     tpm2_policypassword -S session.dat -L policy.dat
> =

> >
> =

> >     tpm2_flushcontext session.dat
> =

> >
> =

> >
> =

> >     # and the sealing goes with
> =

> >
> =

> >     echo mysecret | tpm2_create -C primary.ctx -u key.pub -r key.priv -=
i- -p password -L policy.dat
> =

> >
> =

> >
> =

> > William suggested I should set up a signed policy so that when UEFI get=
s updated I can regenerate the policy and not find myself lock out off the =
system, which I understand, but the problem is: to prevent from further unl=
ock attemps, after unsealing the secret protected by that policy, I will ex=
tend one of the pcr registers... so, if I generate the pcr policy with the =
live system, I will be using pcr values that have been altered.
> =

> >
> =

> >
> =

> > Now, I have thought in either forcing the EFI updates to happen during =
the system boot (I download the update, recreate a initramfs including it, =
and during the following boot, in the unlocking script, the UEFI gets updat=
ed and the policy gets created before unlocking), or in having a multi fact=
or authentication that allows me to get in with either the previous policy =
or with another policy composed by the previous password and a rescue passw=
ord. In this case, AND(password1, OR(password2, pcr)), I have written the f=
ollowing statements:
> =

> >
> =

> >
> =

> >     # session for auth based on pcr
> =

> >     tpm2_startauthsession -S session.dat
> =

> >     tpm2_policypcr -S session.dat -l "sha256:0,1" -L policy.pcr
> =

> >     tpm2_flushcontext session.dat
> =

> >     rm session.dat
> =

> >
> =

> >     # session for auth based on rescue password
> =

> >     tpm2_startauthsession -S session.dat
> =

> >     tpm2_policypassword -S session.dat -L policy.rescue
> =

> >     tpm2_flushcontext session.dat
> =

> >
> =

> >     rm session.dat
> =

> >
> =

> >     # compound both policies using OR and require always the password
> =

> >     tpm2_startauthsession -S session.dat
> =

> >     tpm2_policyor -S session.dat -L policy.dat sha256:policy.pcr,policy=
.rescue
> =

> >     tpm2_policypassword -S session.dat -L policy.dat
> =

> >     tpm2_flushcontext session.dat
> =

> >
> =

> >     rm session.dat
> =

> >
> =

> >
> =

> >
> =

> > I think this is ok, but then.. I do not see how to initialize the passw=
ord policies. Is there any example similar to what I want to achieve?
> =

> >
> =

> >
> =

> > Thank you!
> =

> >
> =

> > Felix
> =

> >
> =

> =

> =





--===============3172450920677793502==--

