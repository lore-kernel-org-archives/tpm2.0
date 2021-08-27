Content-Type: multipart/mixed; boundary="===============0817640978731421558=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Example with multifactor authentication available?
Date: Fri, 27 Aug 2021 18:05:38 +0000
Message-ID: <SN6PR11MB3437F39553322C28C77D04C6B8C89@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: 2478063.NUsNmmWhUj@polaris
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0817640978731421558==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

TL;DR don't invoke the policysecret command, just use what the fixed hash o=
utput is in policyor command. Set an owner password on rea deployments.

Remember that policies are just hashes. When you create a policy and assign=
 it to an object during creation, you don't even need to invoke any
of the commands. You only need to actual invoke the commands when you want =
to use a policy to authorize, because the TPM needs to change
its state and that state is tethered to the session context. Since it's a p=
olicy OR, only one of the branches needs to evaluate to true.
So in the non-recovery case, when you call policyor, you can give it just t=
he policy hash from the PCR policy and invoking the command and
I think you just need the fixed hash from what the policysecret would provi=
de, you don't need to invoke the command as the first policy in the list
will evaluate to true.

The spec says:
PolicySession?policyDigest is compared against the list of provided values.=
 If the current policySession?policyDigest does not match any value in the =
list, the TPM shall return TPM_RC_VALUE. Otherwise, the TPM will reset poli=
cySession?policyDigest to a Zero Digest. Then policySession?policyDigest is=
 extended by the concatenation of TPM_CC_PolicyOR and the concatenation of =
all of the digests.

Which is kind of terse, but if you provide a list of policies on a given se=
ssion, just one of the policies needs to be true, so for each digest it loo=
ks for state in the
session context that satisifies it, resets the session policy to 0, then ex=
tends the other hashes so when you use the object the policyDigest in the s=
ession state
and the hash in the public object match.

Additionally, never deploy without an owner password. As anything, even a s=
imple mistake could DoS all your owner objects (NV Index, keys, etc). You h=
ave reset
capabilities in your bios or for an embedded systems usually a set of jumpe=
rs.



________________________________
From: Felix Rubio Dalmau <felix(a)kngnt.org>
Sent: Wednesday, August 25, 2021 1:39 AM
To: Roberts, William C <william.c.roberts(a)intel.com>
Cc: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
Subject: Re: [tpm2] Re: Example with multifactor authentication available?

Hi William,

        Going through your example, I am facing more trouble. Let me explai=
n: the sealing of the data happens as expected (there is my concern about u=
sing the owner password to do it, but I can live with that), but when it ne=
eds to be unsealed (here I paste the code for the regular unseal, but happe=
ns with both), from an clean initramfs run, I would have to do the followin=
g:

    tpm2_startauthsession -S session.dat
    tpm2_policysecret -S session.dat -L rescue.policy -c o rescuepass
    tpm2_flushcontext session.dat

    tpm2_startauthsession -S session.dat --policy-session
    tpm2_policypassword -S session.dat
    tpm2_policypcr -S session.dat -l sha256:0,1,7 -L pcr.policy
    tpm2_policyor -S session.dat sha256:rescue.policy,pcr.policy
    tpm2_unseal -p 'session:session.dat+regularpass' -c 0x81010001
    tpm2_flushcontext session.dat

For what I understand, to unseal I need to declare the policyor object, and=
 for the policyor object to be created I need to create the rescue.policy a=
nd the pcr.policy on the spot. The pcr.policy is easy to get, because it wi=
ll always produce an object regardless of the contents of the PCR registers=
, but for the rescue.policy things get more tricky because as it is tied to=
 the owner hierarchy I can only get it created if the password is correct (=
thus forcing me to supply the rescue password every time, thus defeating th=
e purpose of this activity).

I am afraid I am doing something very wrong, because the solutions I found =
(both in the mailing list, or in gitter) seem to be quite complex for a pro=
blem that seems simple... right? I have thought in using nvdefine / nvwrite=
 / ... to compare the hashes of the passwords by hand, but I stopped that a=
pproach because it felt like I was obtaining a complex solution for a simpl=
e problem as well.

Sorry to bother you and the members of the list... but I am pretty lost, st=
ill :-/

Thank you!
Felix


On Tuesday, 24 August 2021 20:29:33 CEST Felix Rubio Dalmau wrote:
> Hi William,
>
> first of all, thank you very much for your email! I have one question: so=
 far, I am issuing all these commands after clearing the tpm and without ta=
king ownership of it (so, I am not specifying any password at all). If doin=
g so, and using the TPM owner password as the rescue password... do you thi=
nk that is a good idea? I am not challenging you, but I would like to get y=
our thoughts.
>
> Thank you very much!
>
> Felix
>
> On Monday, 23 August 2021 22:48:38 CEST Roberts, William C wrote:
> > I got a few things wrong in that response, my apologies and let me try =
and clarify:
> >
> > policypassword - allows you to specify a password to use an object when=
 the objects userauth attribute is 0. For objects that are only able to
> > be authenticated to with policies.
> >
> > policysecret - couple an objects auth value to something else, like the=
 owner hierarchy.
> >
> > policyauthorize - couple an objects auth value to a signing authority.
> >
> > We only care about the first two things here, policy password and polic=
ysecret.
> >
> > The keys here are understanding what you want based on the attributes o=
f an object and how auth work in the TPM.
> > Objects can either have userwithauth 1 or 0, if it's 0, then only polic=
y based authorization will work. When you create the
> > object, a policy hash is stored in the public portion and the password =
if specified is stored in the private portion. When you want
> > to use that object, the TPM will require policy-based authorizations, i=
f you want the TPM to investigate the command  header for a password
> > then you have to use the policypassword command so it knows. If you set=
 a password for an object with userwithauth 1 attribute, then you can authe=
nticate to it with either the policy or the password, so we need to turn th=
is off to get it into the AND requirement you have.
> >
> > The manpage for policyor actually gives  this exact scenario:
> > https://github.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_policy=
or.1.md#examples
> >
> > But in your initial email you talk about a policy where its policy(pass=
word1) or policy(password2, PCR), to get there you would need to use
> > policysecret since you need an object to have multiple auth values, an =
object can only have one, so policysecret would let you couple N
> > secrets.
> >
> > Here's a gist (https://gist.github.com/williamcroberts/7a3bba2f45bf28c5=
a19c5e13e5c8da21)
> > that seems to do what you want, I sourced it and did this on a SIMULATO=
R:
> >
> > tpm2_changeauth -c o ownerpass
> > tpm2_createprimary -c primary.ctx
> >
> > do_policy_secret
> > 0d84f55daf6e43ac97966e62c9bb989d3397777d25c5f749868055d65394f952
> >
> > do_policy_pcr_and_pass
> > 8fcd2169ab92694e0c633f1ab772842b8241bbc20288981fc7ac1eddc1fddb0e
> > ea35b777fa3f5a5e702f0a42691e37cf3e76a7a8e2894bc7e61a2d0effbd0e74
> >
> > do_policy_or
> > 952a41a9678af53d04e6607a5ed51d522023e81a1fd68872e9dcc96fee2be3fb
> >
> > do_create
> > name-alg:
> >   value: sha256
> >   raw: 0xb
> > attributes:
> >   value: fixedtpm|fixedparent
> >   raw: 0x12
> > type:
> >   value: keyedhash
> >   raw: 0x8
> > algorithm:
> >   value: null
> >   raw: 0x10
> > keyedhash: ecddbf75431eeb635d118ef59dc9a100612bb595bf42164dc7af43efedea=
e3ab
> > authorization policy: 952a41a9678af53d04e6607a5ed51d522023e81a1fd68872e=
9dcc96fee2be3fb
> >
> > do_unseal_pcr
> > 8fcd2169ab92694e0c633f1ab772842b8241bbc20288981fc7ac1eddc1fddb0e
> > ea35b777fa3f5a5e702f0a42691e37cf3e76a7a8e2894bc7e61a2d0effbd0e74
> > 952a41a9678af53d04e6607a5ed51d522023e81a1fd68872e9dcc96fee2be3fb
> > mysecret
> >
> > do_break_pcr
> > sha1: f1d2d2f924e986ac86fdf7b36c94bcdf32beec15
> > sha256: b5bb9d8014a0f9b1d61e21e796d78dccdf1352f23cd32812f4850b878ae4944c
> > sha384: 8effdabfe14416214a250f935505250bd991f106065d899db6e19bdc8bf648f=
3ac0f1935c4f65fe8f798289b1a0d1e06
> > sha512: 0cf9180a764aba863a67b6d72f0918bc131c6772642cb2dce5a34f0a702f947=
0ddc2bf125c12198b1995c233c34b4afd346c54a2334c350a948a51b6e8b4e6b6
> >
> > do_unseal_pcr
> > 8fcd2169ab92694e0c633f1ab772842b8241bbc20288981fc7ac1eddc1fddb0e
> > 05f7f361e2dd7efde0aee1f0e2a36a49185b6c1fa479f46f09dad68b2af9df7b
> > WARNING:esys:src/tss2-esys/api/Esys_PolicyOR.c:286:Esys_PolicyOR_Finish=
() Received TPM Error
> > ERROR:esys:src/tss2-esys/api/Esys_PolicyOR.c:100:Esys_PolicyOR() Esys F=
inish ErrorCode (0x000001c4)
> > ERROR: Esys_PolicyAuthorize(0x1C4) - tpm:parameter(1):value is out of r=
ange or is not correct for the context
> > ERROR: Could not build policyor TPM
> > ERROR: Unable to run tpm2_policyor
> > WARNING:esys:src/tss2-esys/api/Esys_Unseal.c:295:Esys_Unseal_Finish() R=
eceived TPM Error
> > ERROR:esys:src/tss2-esys/api/Esys_Unseal.c:98:Esys_Unseal() Esys Finish=
 ErrorCode (0x0000099d)
> > ERROR: Esys_Unseal(0x99D) - tpm:session(1):a policy check failed
> > ERROR: Unable to run tpm2_unseal
> >
> > # recover with owner pass
> > do_unseal_recovery
> > 0d84f55daf6e43ac97966e62c9bb989d3397777d25c5f749868055d65394f952
> > 952a41a9678af53d04e6607a5ed51d522023e81a1fd68872e9dcc96fee2be3fb
> > mysecret
> >
> > ________________________________
> > From: Felix Rubio Dalmau <felix(a)kngnt.org>
> > Sent: Sunday, August 22, 2021 2:57 AM
> > To: Roberts, William C <william.c.roberts(a)intel.com>
> > Cc: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
> > Subject: Re: [tpm2] Example with multifactor authentication available?
> >
> >
> > Hi William,
> >
> >
> >     Sorry for answering so late after your last email. I had to jump to=
 another subject, then holidays... yeah, life I guess! I have started again=
 looking at this matter, and... I do not understand the part of the rescue =
password and how to use it. I see that using policysecret is the way to go,=
 because it does not set any flag to require a password when the create is =
issued, but I still do not see how to use it to input a password. In the he=
lp of policysecret, it states:
> >
> >
> >      "TPM2_PolicySecret command requires you to pass in the name of the=
 object whose password is required to satisfy the policy"
> >
> >
> > Does this mean that I should create an object, password-protected, just=
 for the sake of using it later with policysecret?? It sounds weird to me, =
but I am not skilled enough to properly assess it.
> >
> >
> > Regards!
> >
> > Felix
> >
> >
> > On Monday, 14 June 2021 20:51:14 CEST Roberts, William C wrote:
> >
> > > Two things, if you need different PCR values than what's on the syste=
m, the TPM only cares about the hash of all the banks, so you can just spec=
ify that expected hash of the PCR state as argument 3 to tpm2_policypcr as =
shown in the man page (since 5.0). If on early versions, you can create a b=
inary file, that's a list of binary hashes in order of the PCR selection. I=
e if you did sha256:1,2,3, the file would be 3 * 32 bytes in size and conta=
in the hashes of PCR1, 2, 3 in that order. This is the binary format from t=
pm2_pcrread -o, so if you have a system in the expected state, you can use =
that to output it, or hand jam it.
> >
> > >
> >
> > > policy password just says, hey require a password for this object, an=
d it will be found in the TPM header in the command.
> >
> > >
> >
> > > So, the better way would be to look at policysecret, which effectivel=
y does the same thing, but puts it in the session
> >
> > > over the command header. Thus, you can have multiple secrets for an o=
bject.
> >
> > >
> >
> > > Typically, for a recovery password, folks couple it to the hierarchy =
the object belongs in via policyauthorize.
> >
> > >
> >
> > > ________________________________
> >
> > > From: Felix Rubio Dalmau <felix(a)kngnt.org>
> >
> > > Sent: Saturday, June 12, 2021 12:58 AM
> >
> > > To: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
> >
> > > Subject: [tpm2] Example with multifactor authentication available?
> >
> > >
> >
> > >
> >
> > > Hi everybody!
> >
> > >
> >
> > >
> >
> > > I am still learning about tpm and tpm2-tools. Following the advice fr=
om William Roberts, I set the authentication policy up as AND(pcr, password=
) by doing the following:
> >
> > >
> >
> > >
> >
> > >     # create a policy that requires the pcr and the password
> >
> > >
> >
> > >     tpm2_startauthsession -S session.dat
> >
> > >
> >
> > >     tpm2_policypcr -S session.dat -l "sha1:0,1,2,3" -L policy.dat
> >
> > >
> >
> > >     tpm2_policypassword -S session.dat -L policy.dat
> >
> > >
> >
> > >     tpm2_flushcontext session.dat
> >
> > >
> >
> > >
> >
> > >     # and the sealing goes with
> >
> > >
> >
> > >     echo mysecret | tpm2_create -C primary.ctx -u key.pub -r key.priv=
 -i- -p password -L policy.dat
> >
> > >
> >
> > >
> >
> > > William suggested I should set up a signed policy so that when UEFI g=
ets updated I can regenerate the policy and not find myself lock out off th=
e system, which I understand, but the problem is: to prevent from further u=
nlock attemps, after unsealing the secret protected by that policy, I will =
extend one of the pcr registers... so, if I generate the pcr policy with th=
e live system, I will be using pcr values that have been altered.
> >
> > >
> >
> > >
> >
> > > Now, I have thought in either forcing the EFI updates to happen durin=
g the system boot (I download the update, recreate a initramfs including it=
, and during the following boot, in the unlocking script, the UEFI gets upd=
ated and the policy gets created before unlocking), or in having a multi fa=
ctor authentication that allows me to get in with either the previous polic=
y or with another policy composed by the previous password and a rescue pas=
sword. In this case, AND(password1, OR(password2, pcr)), I have written the=
 following statements:
> >
> > >
> >
> > >
> >
> > >     # session for auth based on pcr
> >
> > >     tpm2_startauthsession -S session.dat
> >
> > >     tpm2_policypcr -S session.dat -l "sha256:0,1" -L policy.pcr
> >
> > >     tpm2_flushcontext session.dat
> >
> > >     rm session.dat
> >
> > >
> >
> > >     # session for auth based on rescue password
> >
> > >     tpm2_startauthsession -S session.dat
> >
> > >     tpm2_policypassword -S session.dat -L policy.rescue
> >
> > >     tpm2_flushcontext session.dat
> >
> > >
> >
> > >     rm session.dat
> >
> > >
> >
> > >     # compound both policies using OR and require always the password
> >
> > >     tpm2_startauthsession -S session.dat
> >
> > >     tpm2_policyor -S session.dat -L policy.dat sha256:policy.pcr,poli=
cy.rescue
> >
> > >     tpm2_policypassword -S session.dat -L policy.dat
> >
> > >     tpm2_flushcontext session.dat
> >
> > >
> >
> > >     rm session.dat
> >
> > >
> >
> > >
> >
> > >
> >
> > > I think this is ok, but then.. I do not see how to initialize the pas=
sword policies. Is there any example similar to what I want to achieve?
> >
> > >
> >
> > >
> >
> > > Thank you!
> >
> > >
> >
> > > Felix
> >
> > >
> >
> >
> >
>
>
>
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>





--===============0817640978731421558==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD11cy1hc2NpaSI+CjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4KPC9oZWFkPgo8Ym9keSBkaXI9Imx0ciI+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxp
YnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9y
OiByZ2IoMCwgMCwgMCk7Ij4KVEw7RFIgZG9uJ3QgaW52b2tlIHRoZSBwb2xpY3lzZWNyZXQgY29t
bWFuZCwganVzdCB1c2Ugd2hhdCB0aGUgZml4ZWQgaGFzaCBvdXRwdXQgaXMgaW4gcG9saWN5b3Ig
Y29tbWFuZC4gU2V0IGFuIG93bmVyIHBhc3N3b3JkIG9uIHJlYSBkZXBsb3ltZW50cy48L2Rpdj4K
PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMt
c2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPgo8YnI+CjwvZGl2
Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fu
cy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+ClJlbWVtYmVy
IHRoYXQgcG9saWNpZXMgYXJlIGp1c3QgaGFzaGVzLiBXaGVuIHlvdSBjcmVhdGUgYSBwb2xpY3kg
YW5kIGFzc2lnbiBpdCB0byBhbiBvYmplY3QgZHVyaW5nIGNyZWF0aW9uLCB5b3UgZG9uJ3QgZXZl
biBuZWVkIHRvIGludm9rZSBhbnk8L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGli
cmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6
IHJnYigwLCAwLCAwKTsiPgpvZiB0aGUgY29tbWFuZHMuIFlvdSBvbmx5IG5lZWQgdG8gYWN0dWFs
IGludm9rZSB0aGUgY29tbWFuZHMgd2hlbiB5b3Ugd2FudCB0byB1c2UgYSBwb2xpY3kgdG8gYXV0
aG9yaXplLCBiZWNhdXNlIHRoZSBUUE0gbmVlZHMgdG8gY2hhbmdlPC9kaXY+CjxkaXYgc3R5bGU9
ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250
LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4KaXRzIHN0YXRlIGFuZCB0aGF0IHN0
YXRlIGlzIHRldGhlcmVkIHRvIHRoZSBzZXNzaW9uIGNvbnRleHQuIFNpbmNlIGl0J3MgYSBwb2xp
Y3kgT1IsIG9ubHkgb25lIG9mIHRoZSBicmFuY2hlcyBuZWVkcyB0byBldmFsdWF0ZSB0byB0cnVl
LjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGlj
YSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+ClNv
IGluIHRoZSBub24tcmVjb3ZlcnkgY2FzZSwgd2hlbiB5b3UgY2FsbCBwb2xpY3lvciwgeW91IGNh
biBnaXZlIGl0IGp1c3QgdGhlIHBvbGljeSBoYXNoIGZyb20gdGhlIFBDUiBwb2xpY3kgYW5kIGlu
dm9raW5nIHRoZSBjb21tYW5kIGFuZDwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2Fs
aWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xv
cjogcmdiKDAsIDAsIDApOyI+CkkgdGhpbmsgeW91IGp1c3QgbmVlZCB0aGUgZml4ZWQgaGFzaCBm
cm9tIHdoYXQgdGhlIHBvbGljeXNlY3JldCB3b3VsZCBwcm92aWRlLCB5b3UgZG9uJ3QgbmVlZCB0
byBpbnZva2UgdGhlIGNvbW1hbmQgYXMgdGhlIGZpcnN0IHBvbGljeSBpbiB0aGUgbGlzdDwvZGl2
Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fu
cy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+CndpbGwgZXZh
bHVhdGUgdG8gdHJ1ZS48L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFy
aWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigw
LCAwLCAwKTsiPgo8YnI+CjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwg
QXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdi
KDAsIDAsIDApOyI+ClRoZSBzcGVjIHNheXM6PC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5
OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7
IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4KPHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMCwgMCwgMCk7
IGZvbnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250
LXNpemU6IDEycHQ7Ij5Qb2xpY3lTZXNzaW9uJiM4NTk0O3BvbGljeURpZ2VzdCBpcyBjb21wYXJl
ZCBhZ2FpbnN0IHRoZSBsaXN0IG9mIHByb3ZpZGVkIHZhbHVlcy4gSWYgdGhlIGN1cnJlbnQgcG9s
aWN5U2Vzc2lvbiYjODU5NDtwb2xpY3lEaWdlc3QgZG9lcyBub3QgbWF0Y2ggYW55IHZhbHVlIGlu
IHRoZSBsaXN0LAogdGhlIFRQTSBzaGFsbCByZXR1cm4gVFBNX1JDX1ZBTFVFLiBPdGhlcndpc2Us
IHRoZSBUUE0gd2lsbCByZXNldCBwb2xpY3lTZXNzaW9uJiM4NTk0O3BvbGljeURpZ2VzdCB0byBh
IFplcm8gRGlnZXN0LiBUaGVuIHBvbGljeVNlc3Npb24mIzg1OTQ7cG9saWN5RGlnZXN0IGlzIGV4
dGVuZGVkIGJ5IHRoZSBjb25jYXRlbmF0aW9uIG9mIFRQTV9DQ19Qb2xpY3lPUiBhbmQgdGhlIGNv
bmNhdGVuYXRpb24gb2YgYWxsIG9mIHRoZSBkaWdlc3RzLjwvc3Bhbj48YnI+CjwvZGl2Pgo8ZGl2
IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJp
ZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+Cjxicj4KPC9kaXY+Cjxk
aXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNl
cmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4KV2hpY2ggaXMga2lu
ZCBvZiB0ZXJzZSwgYnV0IGlmIHlvdSBwcm92aWRlIGEgbGlzdCBvZiBwb2xpY2llcyBvbiBhIGdp
dmVuIHNlc3Npb24sIGp1c3Qgb25lIG9mIHRoZSBwb2xpY2llcyBuZWVkcyB0byBiZSB0cnVlLCBz
byBmb3IgZWFjaCBkaWdlc3QgaXQgbG9va3MgZm9yIHN0YXRlIGluIHRoZTxicj4Kc2Vzc2lvbiBj
b250ZXh0IHRoYXQgc2F0aXNpZmllcyBpdCwgcmVzZXRzIHRoZSBzZXNzaW9uIHBvbGljeSB0byAw
LCB0aGVuIGV4dGVuZHMgdGhlIG90aGVyIGhhc2hlcyBzbyB3aGVuIHlvdSB1c2UgdGhlIG9iamVj
dCB0aGUgcG9saWN5RGlnZXN0IGluIHRoZSBzZXNzaW9uIHN0YXRlPC9kaXY+CjxkaXYgc3R5bGU9
ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250
LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4KYW5kIHRoZSBoYXNoIGluIHRoZSBw
dWJsaWMgb2JqZWN0IG1hdGNoLjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJy
aSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjog
cmdiKDAsIDAsIDApOyI+Cjxicj4KPC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxp
YnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9y
OiByZ2IoMCwgMCwgMCk7Ij4KQWRkaXRpb25hbGx5LCBuZXZlciBkZXBsb3kgd2l0aG91dCBhbiBv
d25lciBwYXNzd29yZC4gQXMgYW55dGhpbmcsIGV2ZW4gYSBzaW1wbGUgbWlzdGFrZSBjb3VsZCBE
b1MgYWxsIHlvdXIgb3duZXIgb2JqZWN0cyAoTlYgSW5kZXgsIGtleXMsIGV0YykuIFlvdSBoYXZl
IHJlc2V0PC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVs
dmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7
Ij4KY2FwYWJpbGl0aWVzIGluIHlvdXIgYmlvcyBvciBmb3IgYW4gZW1iZWRkZWQgc3lzdGVtcyB1
c3VhbGx5IGEgc2V0IG9mIGp1bXBlcnMuPC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBD
YWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNv
bG9yOiByZ2IoMCwgMCwgMCk7Ij4KPGJyPgo8L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6
IENhbGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsg
Y29sb3I6IHJnYigwLCAwLCAwKTsiPgo8YnI+CjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWls
eTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0
OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+Cjxicj4KPC9kaXY+CjxkaXYgaWQ9ImFwcGVuZG9uc2Vu
ZCI+PC9kaXY+CjxociBzdHlsZT0iZGlzcGxheTppbmxpbmUtYmxvY2s7d2lkdGg6OTglIiB0YWJp
bmRleD0iLTEiPgo8ZGl2IGlkPSJkaXZScGx5RndkTXNnIiBkaXI9Imx0ciI+PGZvbnQgZmFjZT0i
Q2FsaWJyaSwgc2Fucy1zZXJpZiIgc3R5bGU9ImZvbnQtc2l6ZToxMXB0IiBjb2xvcj0iIzAwMDAw
MCI+PGI+RnJvbTo8L2I+IEZlbGl4IFJ1YmlvIERhbG1hdSAmbHQ7ZmVsaXhAa25nbnQub3JnJmd0
Ozxicj4KPGI+U2VudDo8L2I+IFdlZG5lc2RheSwgQXVndXN0IDI1LCAyMDIxIDE6MzkgQU08YnI+
CjxiPlRvOjwvYj4gUm9iZXJ0cywgV2lsbGlhbSBDICZsdDt3aWxsaWFtLmMucm9iZXJ0c0BpbnRl
bC5jb20mZ3Q7PGJyPgo8Yj5DYzo8L2I+IHRwbTJAbGlzdHMuMDEub3JnICZsdDt0cG0yQGxpc3Rz
LjAxLm9yZyZndDs8YnI+CjxiPlN1YmplY3Q6PC9iPiBSZTogW3RwbTJdIFJlOiBFeGFtcGxlIHdp
dGggbXVsdGlmYWN0b3IgYXV0aGVudGljYXRpb24gYXZhaWxhYmxlPzwvZm9udD4KPGRpdj4mbmJz
cDs8L2Rpdj4KPC9kaXY+CjxkaXYgY2xhc3M9IkJvZHlGcmFnbWVudCI+PGZvbnQgc2l6ZT0iMiI+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0OyI+CjxkaXYgY2xhc3M9IlBsYWluVGV4dCI+SGkg
V2lsbGlhbSw8YnI+Cjxicj4KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7IEdvaW5nIHRocm91Z2ggeW91ciBleGFtcGxlLCBJIGFtIGZhY2luZyBtb3JlIHRyb3VibGUu
IExldCBtZSBleHBsYWluOiB0aGUgc2VhbGluZyBvZiB0aGUgZGF0YSBoYXBwZW5zIGFzIGV4cGVj
dGVkICh0aGVyZSBpcyBteSBjb25jZXJuIGFib3V0IHVzaW5nIHRoZSBvd25lciBwYXNzd29yZCB0
byBkbyBpdCwgYnV0IEkgY2FuIGxpdmUgd2l0aCB0aGF0KSwgYnV0IHdoZW4gaXQgbmVlZHMgdG8g
YmUgdW5zZWFsZWQgKGhlcmUgSSBwYXN0ZQogdGhlIGNvZGUgZm9yIHRoZSByZWd1bGFyIHVuc2Vh
bCwgYnV0IGhhcHBlbnMgd2l0aCBib3RoKSwgZnJvbSBhbiBjbGVhbiBpbml0cmFtZnMgcnVuLCBJ
IHdvdWxkIGhhdmUgdG8gZG8gdGhlIGZvbGxvd2luZzo8YnI+Cjxicj4KJm5ic3A7Jm5ic3A7Jm5i
c3A7IHRwbTJfc3RhcnRhdXRoc2Vzc2lvbiAtUyBzZXNzaW9uLmRhdDxicj4KJm5ic3A7Jm5ic3A7
Jm5ic3A7IHRwbTJfcG9saWN5c2VjcmV0IC1TIHNlc3Npb24uZGF0IC1MIHJlc2N1ZS5wb2xpY3kg
LWMgbyByZXNjdWVwYXNzPGJyPgombmJzcDsmbmJzcDsmbmJzcDsgdHBtMl9mbHVzaGNvbnRleHQg
c2Vzc2lvbi5kYXQ8YnI+Cjxicj4KJm5ic3A7Jm5ic3A7Jm5ic3A7IHRwbTJfc3RhcnRhdXRoc2Vz
c2lvbiAtUyBzZXNzaW9uLmRhdCAtLXBvbGljeS1zZXNzaW9uPGJyPgombmJzcDsmbmJzcDsmbmJz
cDsgdHBtMl9wb2xpY3lwYXNzd29yZCAtUyBzZXNzaW9uLmRhdDxicj4KJm5ic3A7Jm5ic3A7Jm5i
c3A7IHRwbTJfcG9saWN5cGNyIC1TIHNlc3Npb24uZGF0IC1sIHNoYTI1NjowLDEsNyAtTCBwY3Iu
cG9saWN5PGJyPgombmJzcDsmbmJzcDsmbmJzcDsgdHBtMl9wb2xpY3lvciAtUyBzZXNzaW9uLmRh
dCBzaGEyNTY6cmVzY3VlLnBvbGljeSxwY3IucG9saWN5PGJyPgombmJzcDsmbmJzcDsmbmJzcDsg
dHBtMl91bnNlYWwgLXAgJ3Nlc3Npb246c2Vzc2lvbi5kYXQrcmVndWxhcnBhc3MnIC1jIDB4ODEw
MTAwMDE8YnI+CiZuYnNwOyZuYnNwOyZuYnNwOyB0cG0yX2ZsdXNoY29udGV4dCBzZXNzaW9uLmRh
dDxicj4KPGJyPgpGb3Igd2hhdCBJIHVuZGVyc3RhbmQsIHRvIHVuc2VhbCBJIG5lZWQgdG8gZGVj
bGFyZSB0aGUgcG9saWN5b3Igb2JqZWN0LCBhbmQgZm9yIHRoZSBwb2xpY3lvciBvYmplY3QgdG8g
YmUgY3JlYXRlZCBJIG5lZWQgdG8gY3JlYXRlIHRoZSByZXNjdWUucG9saWN5IGFuZCB0aGUgcGNy
LnBvbGljeSBvbiB0aGUgc3BvdC4gVGhlIHBjci5wb2xpY3kgaXMgZWFzeSB0byBnZXQsIGJlY2F1
c2UgaXQgd2lsbCBhbHdheXMgcHJvZHVjZSBhbiBvYmplY3QgcmVnYXJkbGVzcwogb2YgdGhlIGNv
bnRlbnRzIG9mIHRoZSBQQ1IgcmVnaXN0ZXJzLCBidXQgZm9yIHRoZSByZXNjdWUucG9saWN5IHRo
aW5ncyBnZXQgbW9yZSB0cmlja3kgYmVjYXVzZSBhcyBpdCBpcyB0aWVkIHRvIHRoZSBvd25lciBo
aWVyYXJjaHkgSSBjYW4gb25seSBnZXQgaXQgY3JlYXRlZCBpZiB0aGUgcGFzc3dvcmQgaXMgY29y
cmVjdCAodGh1cyBmb3JjaW5nIG1lIHRvIHN1cHBseSB0aGUgcmVzY3VlIHBhc3N3b3JkIGV2ZXJ5
IHRpbWUsIHRodXMgZGVmZWF0aW5nCiB0aGUgcHVycG9zZSBvZiB0aGlzIGFjdGl2aXR5KS48YnI+
Cjxicj4KSSBhbSBhZnJhaWQgSSBhbSBkb2luZyBzb21ldGhpbmcgdmVyeSB3cm9uZywgYmVjYXVz
ZSB0aGUgc29sdXRpb25zIEkgZm91bmQgKGJvdGggaW4gdGhlIG1haWxpbmcgbGlzdCwgb3IgaW4g
Z2l0dGVyKSBzZWVtIHRvIGJlIHF1aXRlIGNvbXBsZXggZm9yIGEgcHJvYmxlbSB0aGF0IHNlZW1z
IHNpbXBsZS4uLiByaWdodD8gSSBoYXZlIHRob3VnaHQgaW4gdXNpbmcgbnZkZWZpbmUgLyBudndy
aXRlIC8gLi4uIHRvIGNvbXBhcmUgdGhlIGhhc2hlcyBvZgogdGhlIHBhc3N3b3JkcyBieSBoYW5k
LCBidXQgSSBzdG9wcGVkIHRoYXQgYXBwcm9hY2ggYmVjYXVzZSBpdCBmZWx0IGxpa2UgSSB3YXMg
b2J0YWluaW5nIGEgY29tcGxleCBzb2x1dGlvbiBmb3IgYSBzaW1wbGUgcHJvYmxlbSBhcyB3ZWxs
Ljxicj4KPGJyPgpTb3JyeSB0byBib3RoZXIgeW91IGFuZCB0aGUgbWVtYmVycyBvZiB0aGUgbGlz
dC4uLiBidXQgSSBhbSBwcmV0dHkgbG9zdCwgc3RpbGwgOi0vPGJyPgo8YnI+ClRoYW5rIHlvdSE8
YnI+CkZlbGl4PGJyPgo8YnI+Cjxicj4KT24gVHVlc2RheSwgMjQgQXVndXN0IDIwMjEgMjA6Mjk6
MzMgQ0VTVCBGZWxpeCBSdWJpbyBEYWxtYXUgd3JvdGU6PGJyPgomZ3Q7IEhpIFdpbGxpYW0sPGJy
PgomZ3Q7IDxicj4KJmd0OyBmaXJzdCBvZiBhbGwsIHRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlv
dXIgZW1haWwhIEkgaGF2ZSBvbmUgcXVlc3Rpb246IHNvIGZhciwgSSBhbSBpc3N1aW5nIGFsbCB0
aGVzZSBjb21tYW5kcyBhZnRlciBjbGVhcmluZyB0aGUgdHBtIGFuZCB3aXRob3V0IHRha2luZyBv
d25lcnNoaXAgb2YgaXQgKHNvLCBJIGFtIG5vdCBzcGVjaWZ5aW5nIGFueSBwYXNzd29yZCBhdCBh
bGwpLiBJZiBkb2luZyBzbywgYW5kIHVzaW5nIHRoZSBUUE0gb3duZXIgcGFzc3dvcmQKIGFzIHRo
ZSByZXNjdWUgcGFzc3dvcmQuLi4gZG8geW91IHRoaW5rIHRoYXQgaXMgYSBnb29kIGlkZWE/IEkg
YW0gbm90IGNoYWxsZW5naW5nIHlvdSwgYnV0IEkgd291bGQgbGlrZSB0byBnZXQgeW91ciB0aG91
Z2h0cy48YnI+CiZndDsgPGJyPgomZ3Q7IFRoYW5rIHlvdSB2ZXJ5IG11Y2ghPGJyPgomZ3Q7IDxi
cj4KJmd0OyBGZWxpeDxicj4KJmd0OyA8YnI+CiZndDsgT24gTW9uZGF5LCAyMyBBdWd1c3QgMjAy
MSAyMjo0ODozOCBDRVNUIFJvYmVydHMsIFdpbGxpYW0gQyB3cm90ZTo8YnI+CiZndDsgJmd0OyBJ
IGdvdCBhIGZldyB0aGluZ3Mgd3JvbmcgaW4gdGhhdCByZXNwb25zZSwgbXkgYXBvbG9naWVzIGFu
ZCBsZXQgbWUgdHJ5IGFuZCBjbGFyaWZ5Ojxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7IHBv
bGljeXBhc3N3b3JkIC0gYWxsb3dzIHlvdSB0byBzcGVjaWZ5IGEgcGFzc3dvcmQgdG8gdXNlIGFu
IG9iamVjdCB3aGVuIHRoZSBvYmplY3RzIHVzZXJhdXRoIGF0dHJpYnV0ZSBpcyAwLiBGb3Igb2Jq
ZWN0cyB0aGF0IGFyZSBvbmx5IGFibGUgdG88YnI+CiZndDsgJmd0OyBiZSBhdXRoZW50aWNhdGVk
IHRvIHdpdGggcG9saWNpZXMuPGJyPgomZ3Q7ICZndDsgPGJyPgomZ3Q7ICZndDsgcG9saWN5c2Vj
cmV0IC0gY291cGxlIGFuIG9iamVjdHMgYXV0aCB2YWx1ZSB0byBzb21ldGhpbmcgZWxzZSwgbGlr
ZSB0aGUgb3duZXIgaGllcmFyY2h5Ljxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7IHBvbGlj
eWF1dGhvcml6ZSAtIGNvdXBsZSBhbiBvYmplY3RzIGF1dGggdmFsdWUgdG8gYSBzaWduaW5nIGF1
dGhvcml0eS48YnI+CiZndDsgJmd0OyA8YnI+CiZndDsgJmd0OyBXZSBvbmx5IGNhcmUgYWJvdXQg
dGhlIGZpcnN0IHR3byB0aGluZ3MgaGVyZSwgcG9saWN5IHBhc3N3b3JkIGFuZCBwb2xpY3lzZWNy
ZXQuPGJyPgomZ3Q7ICZndDsgPGJyPgomZ3Q7ICZndDsgVGhlIGtleXMgaGVyZSBhcmUgdW5kZXJz
dGFuZGluZyB3aGF0IHlvdSB3YW50IGJhc2VkIG9uIHRoZSBhdHRyaWJ1dGVzIG9mIGFuIG9iamVj
dCBhbmQgaG93IGF1dGggd29yayBpbiB0aGUgVFBNLjxicj4KJmd0OyAmZ3Q7IE9iamVjdHMgY2Fu
IGVpdGhlciBoYXZlIHVzZXJ3aXRoYXV0aCAxIG9yIDAsIGlmIGl0J3MgMCwgdGhlbiBvbmx5IHBv
bGljeSBiYXNlZCBhdXRob3JpemF0aW9uIHdpbGwgd29yay4gV2hlbiB5b3UgY3JlYXRlIHRoZTxi
cj4KJmd0OyAmZ3Q7IG9iamVjdCwgYSBwb2xpY3kgaGFzaCBpcyBzdG9yZWQgaW4gdGhlIHB1Ymxp
YyBwb3J0aW9uIGFuZCB0aGUgcGFzc3dvcmQgaWYgc3BlY2lmaWVkIGlzIHN0b3JlZCBpbiB0aGUg
cHJpdmF0ZSBwb3J0aW9uLiBXaGVuIHlvdSB3YW50PGJyPgomZ3Q7ICZndDsgdG8gdXNlIHRoYXQg
b2JqZWN0LCB0aGUgVFBNIHdpbGwgcmVxdWlyZSBwb2xpY3ktYmFzZWQgYXV0aG9yaXphdGlvbnMs
IGlmIHlvdSB3YW50IHRoZSBUUE0gdG8gaW52ZXN0aWdhdGUgdGhlIGNvbW1hbmQmbmJzcDsgaGVh
ZGVyIGZvciBhIHBhc3N3b3JkPGJyPgomZ3Q7ICZndDsgdGhlbiB5b3UgaGF2ZSB0byB1c2UgdGhl
IHBvbGljeXBhc3N3b3JkIGNvbW1hbmQgc28gaXQga25vd3MuIElmIHlvdSBzZXQgYSBwYXNzd29y
ZCBmb3IgYW4gb2JqZWN0IHdpdGggdXNlcndpdGhhdXRoIDEgYXR0cmlidXRlLCB0aGVuIHlvdSBj
YW4gYXV0aGVudGljYXRlIHRvIGl0IHdpdGggZWl0aGVyIHRoZSBwb2xpY3kgb3IgdGhlIHBhc3N3
b3JkLCBzbyB3ZSBuZWVkIHRvIHR1cm4gdGhpcyBvZmYgdG8gZ2V0IGl0IGludG8gdGhlIEFORCBy
ZXF1aXJlbWVudAogeW91IGhhdmUuPGJyPgomZ3Q7ICZndDsgPGJyPgomZ3Q7ICZndDsgVGhlIG1h
bnBhZ2UgZm9yIHBvbGljeW9yIGFjdHVhbGx5IGdpdmVzJm5ic3A7IHRoaXMgZXhhY3Qgc2NlbmFy
aW86PGJyPgomZ3Q7ICZndDsgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdh
cmUvdHBtMi10b29scy9ibG9iL21hc3Rlci9tYW4vdHBtMl9wb2xpY3lvci4xLm1kI2V4YW1wbGVz
Ij4KaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10b29scy9ibG9iL21hc3Rl
ci9tYW4vdHBtMl9wb2xpY3lvci4xLm1kI2V4YW1wbGVzPC9hPjxicj4KJmd0OyAmZ3Q7IDxicj4K
Jmd0OyAmZ3Q7IEJ1dCBpbiB5b3VyIGluaXRpYWwgZW1haWwgeW91IHRhbGsgYWJvdXQgYSBwb2xp
Y3kgd2hlcmUgaXRzIHBvbGljeShwYXNzd29yZDEpIG9yIHBvbGljeShwYXNzd29yZDIsIFBDUiks
IHRvIGdldCB0aGVyZSB5b3Ugd291bGQgbmVlZCB0byB1c2U8YnI+CiZndDsgJmd0OyBwb2xpY3lz
ZWNyZXQgc2luY2UgeW91IG5lZWQgYW4gb2JqZWN0IHRvIGhhdmUgbXVsdGlwbGUgYXV0aCB2YWx1
ZXMsIGFuIG9iamVjdCBjYW4gb25seSBoYXZlIG9uZSwgc28gcG9saWN5c2VjcmV0IHdvdWxkIGxl
dCB5b3UgY291cGxlIE48YnI+CiZndDsgJmd0OyBzZWNyZXRzLjxicj4KJmd0OyAmZ3Q7IDxicj4K
Jmd0OyAmZ3Q7IEhlcmUncyBhIGdpc3QgKDxhIGhyZWY9Imh0dHBzOi8vZ2lzdC5naXRodWIuY29t
L3dpbGxpYW1jcm9iZXJ0cy83YTNiYmEyZjQ1YmYyOGM1YTE5YzVlMTNlNWM4ZGEyMSI+aHR0cHM6
Ly9naXN0LmdpdGh1Yi5jb20vd2lsbGlhbWNyb2JlcnRzLzdhM2JiYTJmNDViZjI4YzVhMTljNWUx
M2U1YzhkYTIxPC9hPik8YnI+CiZndDsgJmd0OyB0aGF0IHNlZW1zIHRvIGRvIHdoYXQgeW91IHdh
bnQsIEkgc291cmNlZCBpdCBhbmQgZGlkIHRoaXMgb24gYSBTSU1VTEFUT1I6PGJyPgomZ3Q7ICZn
dDsgPGJyPgomZ3Q7ICZndDsgdHBtMl9jaGFuZ2VhdXRoIC1jIG8gb3duZXJwYXNzPGJyPgomZ3Q7
ICZndDsgdHBtMl9jcmVhdGVwcmltYXJ5IC1jIHByaW1hcnkuY3R4PGJyPgomZ3Q7ICZndDsgPGJy
PgomZ3Q7ICZndDsgZG9fcG9saWN5X3NlY3JldDxicj4KJmd0OyAmZ3Q7IDBkODRmNTVkYWY2ZTQz
YWM5Nzk2NmU2MmM5YmI5ODlkMzM5Nzc3N2QyNWM1Zjc0OTg2ODA1NWQ2NTM5NGY5NTI8YnI+CiZn
dDsgJmd0OyA8YnI+CiZndDsgJmd0OyBkb19wb2xpY3lfcGNyX2FuZF9wYXNzPGJyPgomZ3Q7ICZn
dDsgOGZjZDIxNjlhYjkyNjk0ZTBjNjMzZjFhYjc3Mjg0MmI4MjQxYmJjMjAyODg5ODFmYzdhYzFl
ZGRjMWZkZGIwZTxicj4KJmd0OyAmZ3Q7IGVhMzViNzc3ZmEzZjVhNWU3MDJmMGE0MjY5MWUzN2Nm
M2U3NmE3YThlMjg5NGJjN2U2MWEyZDBlZmZiZDBlNzQ8YnI+CiZndDsgJmd0OyA8YnI+CiZndDsg
Jmd0OyBkb19wb2xpY3lfb3I8YnI+CiZndDsgJmd0OyA5NTJhNDFhOTY3OGFmNTNkMDRlNjYwN2E1
ZWQ1MWQ1MjIwMjNlODFhMWZkNjg4NzJlOWRjYzk2ZmVlMmJlM2ZiPGJyPgomZ3Q7ICZndDsgPGJy
PgomZ3Q7ICZndDsgZG9fY3JlYXRlPGJyPgomZ3Q7ICZndDsgbmFtZS1hbGc6PGJyPgomZ3Q7ICZn
dDsmbmJzcDsmbmJzcDsgdmFsdWU6IHNoYTI1Njxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7IHJh
dzogMHhiPGJyPgomZ3Q7ICZndDsgYXR0cmlidXRlczo8YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNw
OyB2YWx1ZTogZml4ZWR0cG18Zml4ZWRwYXJlbnQ8YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNwOyBy
YXc6IDB4MTI8YnI+CiZndDsgJmd0OyB0eXBlOjxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7IHZh
bHVlOiBrZXllZGhhc2g8YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNwOyByYXc6IDB4ODxicj4KJmd0
OyAmZ3Q7IGFsZ29yaXRobTo8YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNwOyB2YWx1ZTogbnVsbDxi
cj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7IHJhdzogMHgxMDxicj4KJmd0OyAmZ3Q7IGtleWVkaGFz
aDogZWNkZGJmNzU0MzFlZWI2MzVkMTE4ZWY1OWRjOWExMDA2MTJiYjU5NWJmNDIxNjRkYzdhZjQz
ZWZlZGVhZTNhYjxicj4KJmd0OyAmZ3Q7IGF1dGhvcml6YXRpb24gcG9saWN5OiA5NTJhNDFhOTY3
OGFmNTNkMDRlNjYwN2E1ZWQ1MWQ1MjIwMjNlODFhMWZkNjg4NzJlOWRjYzk2ZmVlMmJlM2ZiPGJy
PgomZ3Q7ICZndDsgPGJyPgomZ3Q7ICZndDsgZG9fdW5zZWFsX3Bjcjxicj4KJmd0OyAmZ3Q7IDhm
Y2QyMTY5YWI5MjY5NGUwYzYzM2YxYWI3NzI4NDJiODI0MWJiYzIwMjg4OTgxZmM3YWMxZWRkYzFm
ZGRiMGU8YnI+CiZndDsgJmd0OyBlYTM1Yjc3N2ZhM2Y1YTVlNzAyZjBhNDI2OTFlMzdjZjNlNzZh
N2E4ZTI4OTRiYzdlNjFhMmQwZWZmYmQwZTc0PGJyPgomZ3Q7ICZndDsgOTUyYTQxYTk2NzhhZjUz
ZDA0ZTY2MDdhNWVkNTFkNTIyMDIzZTgxYTFmZDY4ODcyZTlkY2M5NmZlZTJiZTNmYjxicj4KJmd0
OyAmZ3Q7IG15c2VjcmV0PGJyPgomZ3Q7ICZndDsgPGJyPgomZ3Q7ICZndDsgZG9fYnJlYWtfcGNy
PGJyPgomZ3Q7ICZndDsgc2hhMTogZjFkMmQyZjkyNGU5ODZhYzg2ZmRmN2IzNmM5NGJjZGYzMmJl
ZWMxNTxicj4KJmd0OyAmZ3Q7IHNoYTI1NjogYjViYjlkODAxNGEwZjliMWQ2MWUyMWU3OTZkNzhk
Y2NkZjEzNTJmMjNjZDMyODEyZjQ4NTBiODc4YWU0OTQ0Yzxicj4KJmd0OyAmZ3Q7IHNoYTM4NDog
OGVmZmRhYmZlMTQ0MTYyMTRhMjUwZjkzNTUwNTI1MGJkOTkxZjEwNjA2NWQ4OTlkYjZlMTliZGM4
YmY2NDhmM2FjMGYxOTM1YzRmNjVmZThmNzk4Mjg5YjFhMGQxZTA2PGJyPgomZ3Q7ICZndDsgc2hh
NTEyOiAwY2Y5MTgwYTc2NGFiYTg2M2E2N2I2ZDcyZjA5MThiYzEzMWM2NzcyNjQyY2IyZGNlNWEz
NGYwYTcwMmY5NDcwZGRjMmJmMTI1YzEyMTk4YjE5OTVjMjMzYzM0YjRhZmQzNDZjNTRhMjMzNGMz
NTBhOTQ4YTUxYjZlOGI0ZTZiNjxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7IGRvX3Vuc2Vh
bF9wY3I8YnI+CiZndDsgJmd0OyA4ZmNkMjE2OWFiOTI2OTRlMGM2MzNmMWFiNzcyODQyYjgyNDFi
YmMyMDI4ODk4MWZjN2FjMWVkZGMxZmRkYjBlPGJyPgomZ3Q7ICZndDsgMDVmN2YzNjFlMmRkN2Vm
ZGUwYWVlMWYwZTJhMzZhNDkxODViNmMxZmE0NzlmNDZmMDlkYWQ2OGIyYWY5ZGY3Yjxicj4KJmd0
OyAmZ3Q7IFdBUk5JTkc6ZXN5czpzcmMvdHNzMi1lc3lzL2FwaS9Fc3lzX1BvbGljeU9SLmM6Mjg2
OkVzeXNfUG9saWN5T1JfRmluaXNoKCkgUmVjZWl2ZWQgVFBNIEVycm9yPGJyPgomZ3Q7ICZndDsg
RVJST1I6ZXN5czpzcmMvdHNzMi1lc3lzL2FwaS9Fc3lzX1BvbGljeU9SLmM6MTAwOkVzeXNfUG9s
aWN5T1IoKSBFc3lzIEZpbmlzaCBFcnJvckNvZGUgKDB4MDAwMDAxYzQpPGJyPgomZ3Q7ICZndDsg
RVJST1I6IEVzeXNfUG9saWN5QXV0aG9yaXplKDB4MUM0KSAtIHRwbTpwYXJhbWV0ZXIoMSk6dmFs
dWUgaXMgb3V0IG9mIHJhbmdlIG9yIGlzIG5vdCBjb3JyZWN0IGZvciB0aGUgY29udGV4dDxicj4K
Jmd0OyAmZ3Q7IEVSUk9SOiBDb3VsZCBub3QgYnVpbGQgcG9saWN5b3IgVFBNPGJyPgomZ3Q7ICZn
dDsgRVJST1I6IFVuYWJsZSB0byBydW4gdHBtMl9wb2xpY3lvcjxicj4KJmd0OyAmZ3Q7IFdBUk5J
Tkc6ZXN5czpzcmMvdHNzMi1lc3lzL2FwaS9Fc3lzX1Vuc2VhbC5jOjI5NTpFc3lzX1Vuc2VhbF9G
aW5pc2goKSBSZWNlaXZlZCBUUE0gRXJyb3I8YnI+CiZndDsgJmd0OyBFUlJPUjplc3lzOnNyYy90
c3MyLWVzeXMvYXBpL0VzeXNfVW5zZWFsLmM6OTg6RXN5c19VbnNlYWwoKSBFc3lzIEZpbmlzaCBF
cnJvckNvZGUgKDB4MDAwMDA5OWQpPGJyPgomZ3Q7ICZndDsgRVJST1I6IEVzeXNfVW5zZWFsKDB4
OTlEKSAtIHRwbTpzZXNzaW9uKDEpOmEgcG9saWN5IGNoZWNrIGZhaWxlZDxicj4KJmd0OyAmZ3Q7
IEVSUk9SOiBVbmFibGUgdG8gcnVuIHRwbTJfdW5zZWFsPGJyPgomZ3Q7ICZndDsgPGJyPgomZ3Q7
ICZndDsgIyByZWNvdmVyIHdpdGggb3duZXIgcGFzczxicj4KJmd0OyAmZ3Q7IGRvX3Vuc2VhbF9y
ZWNvdmVyeTxicj4KJmd0OyAmZ3Q7IDBkODRmNTVkYWY2ZTQzYWM5Nzk2NmU2MmM5YmI5ODlkMzM5
Nzc3N2QyNWM1Zjc0OTg2ODA1NWQ2NTM5NGY5NTI8YnI+CiZndDsgJmd0OyA5NTJhNDFhOTY3OGFm
NTNkMDRlNjYwN2E1ZWQ1MWQ1MjIwMjNlODFhMWZkNjg4NzJlOWRjYzk2ZmVlMmJlM2ZiPGJyPgom
Z3Q7ICZndDsgbXlzZWNyZXQ8YnI+CiZndDsgJmd0OyA8YnI+CiZndDsgJmd0OyBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXzxicj4KJmd0OyAmZ3Q7IEZyb206IEZlbGl4IFJ1YmlvIERh
bG1hdSAmbHQ7ZmVsaXhAa25nbnQub3JnJmd0Ozxicj4KJmd0OyAmZ3Q7IFNlbnQ6IFN1bmRheSwg
QXVndXN0IDIyLCAyMDIxIDI6NTcgQU08YnI+CiZndDsgJmd0OyBUbzogUm9iZXJ0cywgV2lsbGlh
bSBDICZsdDt3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20mZ3Q7PGJyPgomZ3Q7ICZndDsgQ2M6
IHRwbTJAbGlzdHMuMDEub3JnICZsdDt0cG0yQGxpc3RzLjAxLm9yZyZndDs8YnI+CiZndDsgJmd0
OyBTdWJqZWN0OiBSZTogW3RwbTJdIEV4YW1wbGUgd2l0aCBtdWx0aWZhY3RvciBhdXRoZW50aWNh
dGlvbiBhdmFpbGFibGU/PGJyPgomZ3Q7ICZndDsgPGJyPgomZ3Q7ICZndDsgPGJyPgomZ3Q7ICZn
dDsgSGkgV2lsbGlhbSw8YnI+CiZndDsgJmd0OyA8YnI+CiZndDsgJmd0OyA8YnI+CiZndDsgJmd0
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBTb3JyeSBmb3IgYW5zd2VyaW5nIHNvIGxhdGUgYWZ0
ZXIgeW91ciBsYXN0IGVtYWlsLiBJIGhhZCB0byBqdW1wIHRvIGFub3RoZXIgc3ViamVjdCwgdGhl
biBob2xpZGF5cy4uLiB5ZWFoLCBsaWZlIEkgZ3Vlc3MhIEkgaGF2ZSBzdGFydGVkIGFnYWluIGxv
b2tpbmcgYXQgdGhpcyBtYXR0ZXIsIGFuZC4uLiBJIGRvIG5vdCB1bmRlcnN0YW5kIHRoZSBwYXJ0
IG9mIHRoZSByZXNjdWUgcGFzc3dvcmQgYW5kIGhvdyB0byB1c2UgaXQuIEkgc2VlCiB0aGF0IHVz
aW5nIHBvbGljeXNlY3JldCBpcyB0aGUgd2F5IHRvIGdvLCBiZWNhdXNlIGl0IGRvZXMgbm90IHNl
dCBhbnkgZmxhZyB0byByZXF1aXJlIGEgcGFzc3dvcmQgd2hlbiB0aGUgY3JlYXRlIGlzIGlzc3Vl
ZCwgYnV0IEkgc3RpbGwgZG8gbm90IHNlZSBob3cgdG8gdXNlIGl0IHRvIGlucHV0IGEgcGFzc3dv
cmQuIEluIHRoZSBoZWxwIG9mIHBvbGljeXNlY3JldCwgaXQgc3RhdGVzOjxicj4KJmd0OyAmZ3Q7
IDxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7ICZxdW90O1RQTTJfUG9saWN5U2VjcmV0IGNvbW1hbmQgcmVxdWlyZXMgeW91IHRvIHBhc3Mg
aW4gdGhlIG5hbWUgb2YgdGhlIG9iamVjdCB3aG9zZSBwYXNzd29yZCBpcyByZXF1aXJlZCB0byBz
YXRpc2Z5IHRoZSBwb2xpY3kmcXVvdDs8YnI+CiZndDsgJmd0OyA8YnI+CiZndDsgJmd0OyA8YnI+
CiZndDsgJmd0OyBEb2VzIHRoaXMgbWVhbiB0aGF0IEkgc2hvdWxkIGNyZWF0ZSBhbiBvYmplY3Qs
IHBhc3N3b3JkLXByb3RlY3RlZCwganVzdCBmb3IgdGhlIHNha2Ugb2YgdXNpbmcgaXQgbGF0ZXIg
d2l0aCBwb2xpY3lzZWNyZXQ/PyBJdCBzb3VuZHMgd2VpcmQgdG8gbWUsIGJ1dCBJIGFtIG5vdCBz
a2lsbGVkIGVub3VnaCB0byBwcm9wZXJseSBhc3Nlc3MgaXQuPGJyPgomZ3Q7ICZndDsgPGJyPgom
Z3Q7ICZndDsgPGJyPgomZ3Q7ICZndDsgUmVnYXJkcyE8YnI+CiZndDsgJmd0OyA8YnI+CiZndDsg
Jmd0OyBGZWxpeDxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7IE9u
IE1vbmRheSwgMTQgSnVuZSAyMDIxIDIwOjUxOjE0IENFU1QgUm9iZXJ0cywgV2lsbGlhbSBDIHdy
b3RlOjxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDsgVHdvIHRoaW5ncywgaWYgeW91
IG5lZWQgZGlmZmVyZW50IFBDUiB2YWx1ZXMgdGhhbiB3aGF0J3Mgb24gdGhlIHN5c3RlbSwgdGhl
IFRQTSBvbmx5IGNhcmVzIGFib3V0IHRoZSBoYXNoIG9mIGFsbCB0aGUgYmFua3MsIHNvIHlvdSBj
YW4ganVzdCBzcGVjaWZ5IHRoYXQgZXhwZWN0ZWQgaGFzaCBvZiB0aGUgUENSIHN0YXRlIGFzIGFy
Z3VtZW50IDMgdG8gdHBtMl9wb2xpY3lwY3IgYXMgc2hvd24gaW4gdGhlIG1hbiBwYWdlIChzaW5j
ZSA1LjApLgogSWYgb24gZWFybHkgdmVyc2lvbnMsIHlvdSBjYW4gY3JlYXRlIGEgYmluYXJ5IGZp
bGUsIHRoYXQncyBhIGxpc3Qgb2YgYmluYXJ5IGhhc2hlcyBpbiBvcmRlciBvZiB0aGUgUENSIHNl
bGVjdGlvbi4gSWUgaWYgeW91IGRpZCBzaGEyNTY6MSwyLDMsIHRoZSBmaWxlIHdvdWxkIGJlIDMg
KiAzMiBieXRlcyBpbiBzaXplIGFuZCBjb250YWluIHRoZSBoYXNoZXMgb2YgUENSMSwgMiwgMyBp
biB0aGF0IG9yZGVyLiBUaGlzIGlzIHRoZSBiaW5hcnkgZm9ybWF0CiBmcm9tIHRwbTJfcGNycmVh
ZCAtbywgc28gaWYgeW91IGhhdmUgYSBzeXN0ZW0gaW4gdGhlIGV4cGVjdGVkIHN0YXRlLCB5b3Ug
Y2FuIHVzZSB0aGF0IHRvIG91dHB1dCBpdCwgb3IgaGFuZCBqYW0gaXQuPGJyPgomZ3Q7ICZndDsg
PGJyPgomZ3Q7ICZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDsgcG9s
aWN5IHBhc3N3b3JkIGp1c3Qgc2F5cywgaGV5IHJlcXVpcmUgYSBwYXNzd29yZCBmb3IgdGhpcyBv
YmplY3QsIGFuZCBpdCB3aWxsIGJlIGZvdW5kIGluIHRoZSBUUE0gaGVhZGVyIGluIHRoZSBjb21t
YW5kLjxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDs8YnI+CiZndDsgJmd0OyA8YnI+
CiZndDsgJmd0OyAmZ3Q7IFNvLCB0aGUgYmV0dGVyIHdheSB3b3VsZCBiZSB0byBsb29rIGF0IHBv
bGljeXNlY3JldCwgd2hpY2ggZWZmZWN0aXZlbHkgZG9lcyB0aGUgc2FtZSB0aGluZywgYnV0IHB1
dHMgaXQgaW4gdGhlIHNlc3Npb248YnI+CiZndDsgJmd0OyA8YnI+CiZndDsgJmd0OyAmZ3Q7IG92
ZXIgdGhlIGNvbW1hbmQgaGVhZGVyLiBUaHVzLCB5b3UgY2FuIGhhdmUgbXVsdGlwbGUgc2VjcmV0
cyBmb3IgYW4gb2JqZWN0Ljxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDs8YnI+CiZn
dDsgJmd0OyA8YnI+CiZndDsgJmd0OyAmZ3Q7IFR5cGljYWxseSwgZm9yIGEgcmVjb3ZlcnkgcGFz
c3dvcmQsIGZvbGtzIGNvdXBsZSBpdCB0byB0aGUgaGllcmFyY2h5IHRoZSBvYmplY3QgYmVsb25n
cyBpbiB2aWEgcG9saWN5YXV0aG9yaXplLjxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZn
dDs8YnI+CiZndDsgJmd0OyA8YnI+CiZndDsgJmd0OyAmZ3Q7IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fPGJyPgomZ3Q7ICZndDsgPGJyPgomZ3Q7ICZndDsgJmd0OyBGcm9tOiBGZWxp
eCBSdWJpbyBEYWxtYXUgJmx0O2ZlbGl4QGtuZ250Lm9yZyZndDs8YnI+CiZndDsgJmd0OyA8YnI+
CiZndDsgJmd0OyAmZ3Q7IFNlbnQ6IFNhdHVyZGF5LCBKdW5lIDEyLCAyMDIxIDEyOjU4IEFNPGJy
PgomZ3Q7ICZndDsgPGJyPgomZ3Q7ICZndDsgJmd0OyBUbzogdHBtMkBsaXN0cy4wMS5vcmcgJmx0
O3RwbTJAbGlzdHMuMDEub3JnJmd0Ozxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDsg
U3ViamVjdDogW3RwbTJdIEV4YW1wbGUgd2l0aCBtdWx0aWZhY3RvciBhdXRoZW50aWNhdGlvbiBh
dmFpbGFibGU/PGJyPgomZ3Q7ICZndDsgPGJyPgomZ3Q7ICZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7
IDxicj4KJmd0OyAmZ3Q7ICZndDs8YnI+CiZndDsgJmd0OyA8YnI+CiZndDsgJmd0OyAmZ3Q7IEhp
IGV2ZXJ5Ym9keSE8YnI+CiZndDsgJmd0OyA8YnI+CiZndDsgJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZn
dDsgPGJyPgomZ3Q7ICZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDsg
SSBhbSBzdGlsbCBsZWFybmluZyBhYm91dCB0cG0gYW5kIHRwbTItdG9vbHMuIEZvbGxvd2luZyB0
aGUgYWR2aWNlIGZyb20gV2lsbGlhbSBSb2JlcnRzLCBJIHNldCB0aGUgYXV0aGVudGljYXRpb24g
cG9saWN5IHVwIGFzIEFORChwY3IsIHBhc3N3b3JkKSBieSBkb2luZyB0aGUgZm9sbG93aW5nOjxi
cj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDs8YnI+CiZndDsgJmd0OyA8YnI+CiZndDsg
Jmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgPGJyPgomZ3Q7ICZndDsgJmd0OyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyAjIGNyZWF0ZSBhIHBvbGljeSB0aGF0IHJlcXVpcmVzIHRoZSBwY3IgYW5kIHRo
ZSBwYXNzd29yZDxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDs8YnI+CiZndDsgJmd0
OyA8YnI+CiZndDsgJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHRwbTJfc3RhcnRh
dXRoc2Vzc2lvbiAtUyBzZXNzaW9uLmRhdDxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZn
dDs8YnI+CiZndDsgJmd0OyA8YnI+CiZndDsgJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7IHRwbTJfcG9saWN5cGNyIC1TIHNlc3Npb24uZGF0IC1sICZxdW90O3NoYTE6MCwxLDIsMyZx
dW90OyAtTCBwb2xpY3kuZGF0PGJyPgomZ3Q7ICZndDsgPGJyPgomZ3Q7ICZndDsgJmd0Ozxicj4K
Jmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgdHBt
Ml9wb2xpY3lwYXNzd29yZCAtUyBzZXNzaW9uLmRhdCAtTCBwb2xpY3kuZGF0PGJyPgomZ3Q7ICZn
dDsgPGJyPgomZ3Q7ICZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgdHBtMl9mbHVzaGNvbnRleHQgc2Vzc2lvbi5kYXQ8YnI+
CiZndDsgJmd0OyA8YnI+CiZndDsgJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgPGJyPgomZ3Q7ICZn
dDsgJmd0Ozxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsgIyBhbmQgdGhlIHNlYWxpbmcgZ29lcyB3aXRoPGJyPgomZ3Q7ICZndDsgPGJyPgom
Z3Q7ICZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsgZWNobyBteXNlY3JldCB8IHRwbTJfY3JlYXRlIC1DIHByaW1hcnkuY3R4
IC11IGtleS5wdWIgLXIga2V5LnByaXYgLWktIC1wIHBhc3N3b3JkIC1MIHBvbGljeS5kYXQ8YnI+
CiZndDsgJmd0OyA8YnI+CiZndDsgJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgPGJyPgomZ3Q7ICZn
dDsgJmd0Ozxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDsgV2lsbGlhbSBzdWdnZXN0
ZWQgSSBzaG91bGQgc2V0IHVwIGEgc2lnbmVkIHBvbGljeSBzbyB0aGF0IHdoZW4gVUVGSSBnZXRz
IHVwZGF0ZWQgSSBjYW4gcmVnZW5lcmF0ZSB0aGUgcG9saWN5IGFuZCBub3QgZmluZCBteXNlbGYg
bG9jayBvdXQgb2ZmIHRoZSBzeXN0ZW0sIHdoaWNoIEkgdW5kZXJzdGFuZCwgYnV0IHRoZSBwcm9i
bGVtIGlzOiB0byBwcmV2ZW50IGZyb20gZnVydGhlciB1bmxvY2sgYXR0ZW1wcywgYWZ0ZXIgdW5z
ZWFsaW5nIHRoZQogc2VjcmV0IHByb3RlY3RlZCBieSB0aGF0IHBvbGljeSwgSSB3aWxsIGV4dGVu
ZCBvbmUgb2YgdGhlIHBjciByZWdpc3RlcnMuLi4gc28sIGlmIEkgZ2VuZXJhdGUgdGhlIHBjciBw
b2xpY3kgd2l0aCB0aGUgbGl2ZSBzeXN0ZW0sIEkgd2lsbCBiZSB1c2luZyBwY3IgdmFsdWVzIHRo
YXQgaGF2ZSBiZWVuIGFsdGVyZWQuPGJyPgomZ3Q7ICZndDsgPGJyPgomZ3Q7ICZndDsgJmd0Ozxi
cj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDs8YnI+CiZndDsgJmd0OyA8YnI+CiZndDsg
Jmd0OyAmZ3Q7IE5vdywgSSBoYXZlIHRob3VnaHQgaW4gZWl0aGVyIGZvcmNpbmcgdGhlIEVGSSB1
cGRhdGVzIHRvIGhhcHBlbiBkdXJpbmcgdGhlIHN5c3RlbSBib290IChJIGRvd25sb2FkIHRoZSB1
cGRhdGUsIHJlY3JlYXRlIGEgaW5pdHJhbWZzIGluY2x1ZGluZyBpdCwgYW5kIGR1cmluZyB0aGUg
Zm9sbG93aW5nIGJvb3QsIGluIHRoZSB1bmxvY2tpbmcgc2NyaXB0LCB0aGUgVUVGSSBnZXRzIHVw
ZGF0ZWQgYW5kIHRoZSBwb2xpY3kgZ2V0cyBjcmVhdGVkCiBiZWZvcmUgdW5sb2NraW5nKSwgb3Ig
aW4gaGF2aW5nIGEgbXVsdGkgZmFjdG9yIGF1dGhlbnRpY2F0aW9uIHRoYXQgYWxsb3dzIG1lIHRv
IGdldCBpbiB3aXRoIGVpdGhlciB0aGUgcHJldmlvdXMgcG9saWN5IG9yIHdpdGggYW5vdGhlciBw
b2xpY3kgY29tcG9zZWQgYnkgdGhlIHByZXZpb3VzIHBhc3N3b3JkIGFuZCBhIHJlc2N1ZSBwYXNz
d29yZC4gSW4gdGhpcyBjYXNlLCBBTkQocGFzc3dvcmQxLCBPUihwYXNzd29yZDIsIHBjcikpLCBJ
IGhhdmUKIHdyaXR0ZW4gdGhlIGZvbGxvd2luZyBzdGF0ZW1lbnRzOjxicj4KJmd0OyAmZ3Q7IDxi
cj4KJmd0OyAmZ3Q7ICZndDs8YnI+CiZndDsgJmd0OyA8YnI+CiZndDsgJmd0OyAmZ3Q7PGJyPgom
Z3Q7ICZndDsgPGJyPgomZ3Q7ICZndDsgJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAjIHNl
c3Npb24gZm9yIGF1dGggYmFzZWQgb24gcGNyPGJyPgomZ3Q7ICZndDsgPGJyPgomZ3Q7ICZndDsg
Jmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB0cG0yX3N0YXJ0YXV0aHNlc3Npb24gLVMgc2Vz
c2lvbi5kYXQ8YnI+CiZndDsgJmd0OyA8YnI+CiZndDsgJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7IHRwbTJfcG9saWN5cGNyIC1TIHNlc3Npb24uZGF0IC1sICZxdW90O3NoYTI1Njow
LDEmcXVvdDsgLUwgcG9saWN5LnBjcjxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgdHBtMl9mbHVzaGNvbnRleHQgc2Vzc2lvbi5kYXQ8YnI+
CiZndDsgJmd0OyA8YnI+CiZndDsgJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHJt
IHNlc3Npb24uZGF0PGJyPgomZ3Q7ICZndDsgPGJyPgomZ3Q7ICZndDsgJmd0Ozxicj4KJmd0OyAm
Z3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgIyBzZXNzaW9u
IGZvciBhdXRoIGJhc2VkIG9uIHJlc2N1ZSBwYXNzd29yZDxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0
OyAmZ3Q7ICZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgdHBtMl9zdGFydGF1dGhzZXNzaW9u
IC1TIHNlc3Npb24uZGF0PGJyPgomZ3Q7ICZndDsgPGJyPgomZ3Q7ICZndDsgJmd0OyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyB0cG0yX3BvbGljeXBhc3N3b3JkIC1TIHNlc3Npb24uZGF0IC1MIHBv
bGljeS5yZXNjdWU8YnI+CiZndDsgJmd0OyA8YnI+CiZndDsgJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7IHRwbTJfZmx1c2hjb250ZXh0IHNlc3Npb24uZGF0PGJyPgomZ3Q7ICZndDsg
PGJyPgomZ3Q7ICZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsgcm0gc2Vzc2lvbi5kYXQ8YnI+CiZndDsgJmd0OyA8YnI+CiZn
dDsgJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgPGJyPgomZ3Q7ICZndDsgJmd0OyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyAjIGNvbXBvdW5kIGJvdGggcG9saWNpZXMgdXNpbmcgT1IgYW5kIHJlcXVp
cmUgYWx3YXlzIHRoZSBwYXNzd29yZDxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgdHBtMl9zdGFydGF1dGhzZXNzaW9uIC1TIHNlc3Npb24u
ZGF0PGJyPgomZ3Q7ICZndDsgPGJyPgomZ3Q7ICZndDsgJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyB0cG0yX3BvbGljeW9yIC1TIHNlc3Npb24uZGF0IC1MIHBvbGljeS5kYXQgc2hhMjU2OnBv
bGljeS5wY3IscG9saWN5LnJlc2N1ZTxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgdHBtMl9wb2xpY3lwYXNzd29yZCAtUyBzZXNzaW9uLmRh
dCAtTCBwb2xpY3kuZGF0PGJyPgomZ3Q7ICZndDsgPGJyPgomZ3Q7ICZndDsgJmd0OyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyB0cG0yX2ZsdXNoY29udGV4dCBzZXNzaW9uLmRhdDxicj4KJmd0OyAm
Z3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDs8YnI+CiZndDsgJmd0OyA8YnI+CiZndDsgJmd0OyAmZ3Q7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHJtIHNlc3Npb24uZGF0PGJyPgomZ3Q7ICZndDsgPGJy
PgomZ3Q7ICZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDs8YnI+CiZn
dDsgJmd0OyA8YnI+CiZndDsgJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgPGJyPgomZ3Q7ICZndDsg
Jmd0OyBJIHRoaW5rIHRoaXMgaXMgb2ssIGJ1dCB0aGVuLi4gSSBkbyBub3Qgc2VlIGhvdyB0byBp
bml0aWFsaXplIHRoZSBwYXNzd29yZCBwb2xpY2llcy4gSXMgdGhlcmUgYW55IGV4YW1wbGUgc2lt
aWxhciB0byB3aGF0IEkgd2FudCB0byBhY2hpZXZlPzxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAm
Z3Q7ICZndDs8YnI+CiZndDsgJmd0OyA8YnI+CiZndDsgJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsg
PGJyPgomZ3Q7ICZndDsgJmd0OyBUaGFuayB5b3UhPGJyPgomZ3Q7ICZndDsgPGJyPgomZ3Q7ICZn
dDsgJmd0Ozxicj4KJmd0OyAmZ3Q7IDxicj4KJmd0OyAmZ3Q7ICZndDsgRmVsaXg8YnI+CiZndDsg
Jmd0OyA8YnI+CiZndDsgJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgPGJyPgomZ3Q7ICZndDsgPGJy
PgomZ3Q7ICZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fPGJyPgomZ3Q7IHRwbTIg
bWFpbGluZyBsaXN0IC0tIHRwbTJAbGlzdHMuMDEub3JnPGJyPgomZ3Q7IFRvIHVuc3Vic2NyaWJl
IHNlbmQgYW4gZW1haWwgdG8gdHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8YnI+CiZndDsgJSh3ZWJf
cGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM8YnI+CiZndDsg
PGJyPgo8YnI+Cjxicj4KPGJyPgo8YnI+CjwvZGl2Pgo8L3NwYW4+PC9mb250PjwvZGl2Pgo8L2Jv
ZHk+CjwvaHRtbD4K

--===============0817640978731421558==--

