Content-Type: multipart/mixed; boundary="===============0180400371392058412=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Example with multifactor authentication available?
Date: Fri, 27 Aug 2021 17:55:52 +0000
Message-ID: <SN6PR11MB3437BAC63FD92B682A26738BB8C89@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: 1670959.retPWs6WYh@polaris
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0180400371392058412==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

You should never deploy with an empty owner password, as a DOS attack would=
 be pretty trivial.
________________________________
From: Felix Rubio Dalmau <felix(a)kngnt.org>
Sent: Tuesday, August 24, 2021 1:29 PM
To: Roberts, William C <william.c.roberts(a)intel.com>
Cc: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
Subject: Re: [tpm2] Example with multifactor authentication available?

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
>
> policypassword - allows you to specify a password to use an object when t=
he objects userauth attribute is 0. For objects that are only able to
> be authenticated to with policies.
>
> policysecret - couple an objects auth value to something else, like the o=
wner hierarchy.
>
> policyauthorize - couple an objects auth value to a signing authority.
>
> We only care about the first two things here, policy password and policys=
ecret.
>
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
>
> The manpage for policyor actually gives  this exact scenario:
> https://github.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_policyor=
.1.md#examples
>
> But in your initial email you talk about a policy where its policy(passwo=
rd1) or policy(password2, PCR), to get there you would need to use
> policysecret since you need an object to have multiple auth values, an ob=
ject can only have one, so policysecret would let you couple N
> secrets.
>
> Here's a gist (https://gist.github.com/williamcroberts/7a3bba2f45bf28c5a1=
9c5e13e5c8da21)
> that seems to do what you want, I sourced it and did this on a SIMULATOR:
>
> tpm2_changeauth -c o ownerpass
> tpm2_createprimary -c primary.ctx
>
> do_policy_secret
> 0d84f55daf6e43ac97966e62c9bb989d3397777d25c5f749868055d65394f952
>
> do_policy_pcr_and_pass
> 8fcd2169ab92694e0c633f1ab772842b8241bbc20288981fc7ac1eddc1fddb0e
> ea35b777fa3f5a5e702f0a42691e37cf3e76a7a8e2894bc7e61a2d0effbd0e74
>
> do_policy_or
> 952a41a9678af53d04e6607a5ed51d522023e81a1fd68872e9dcc96fee2be3fb
>
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
>
> do_unseal_pcr
> 8fcd2169ab92694e0c633f1ab772842b8241bbc20288981fc7ac1eddc1fddb0e
> ea35b777fa3f5a5e702f0a42691e37cf3e76a7a8e2894bc7e61a2d0effbd0e74
> 952a41a9678af53d04e6607a5ed51d522023e81a1fd68872e9dcc96fee2be3fb
> mysecret
>
> do_break_pcr
> sha1: f1d2d2f924e986ac86fdf7b36c94bcdf32beec15
> sha256: b5bb9d8014a0f9b1d61e21e796d78dccdf1352f23cd32812f4850b878ae4944c
> sha384: 8effdabfe14416214a250f935505250bd991f106065d899db6e19bdc8bf648f3a=
c0f1935c4f65fe8f798289b1a0d1e06
> sha512: 0cf9180a764aba863a67b6d72f0918bc131c6772642cb2dce5a34f0a702f9470d=
dc2bf125c12198b1995c233c34b4afd346c54a2334c350a948a51b6e8b4e6b6
>
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
>
> # recover with owner pass
> do_unseal_recovery
> 0d84f55daf6e43ac97966e62c9bb989d3397777d25c5f749868055d65394f952
> 952a41a9678af53d04e6607a5ed51d522023e81a1fd68872e9dcc96fee2be3fb
> mysecret
>
> ________________________________
> From: Felix Rubio Dalmau <felix(a)kngnt.org>
> Sent: Sunday, August 22, 2021 2:57 AM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
> Subject: Re: [tpm2] Example with multifactor authentication available?
>
>
> Hi William,
>
>
>     Sorry for answering so late after your last email. I had to jump to a=
nother subject, then holidays... yeah, life I guess! I have started again l=
ooking at this matter, and... I do not understand the part of the rescue pa=
ssword and how to use it. I see that using policysecret is the way to go, b=
ecause it does not set any flag to require a password when the create is is=
sued, but I still do not see how to use it to input a password. In the help=
 of policysecret, it states:
>
>
>      "TPM2_PolicySecret command requires you to pass in the name of the o=
bject whose password is required to satisfy the policy"
>
>
> Does this mean that I should create an object, password-protected, just f=
or the sake of using it later with policysecret?? It sounds weird to me, bu=
t I am not skilled enough to properly assess it.
>
>
> Regards!
>
> Felix
>
>
> On Monday, 14 June 2021 20:51:14 CEST Roberts, William C wrote:
>
> > Two things, if you need different PCR values than what's on the system,=
 the TPM only cares about the hash of all the banks, so you can just specif=
y that expected hash of the PCR state as argument 3 to tpm2_policypcr as sh=
own in the man page (since 5.0). If on early versions, you can create a bin=
ary file, that's a list of binary hashes in order of the PCR selection. Ie =
if you did sha256:1,2,3, the file would be 3 * 32 bytes in size and contain=
 the hashes of PCR1, 2, 3 in that order. This is the binary format from tpm=
2_pcrread -o, so if you have a system in the expected state, you can use th=
at to output it, or hand jam it.
>
> >
>
> > policy password just says, hey require a password for this object, and =
it will be found in the TPM header in the command.
>
> >
>
> > So, the better way would be to look at policysecret, which effectively =
does the same thing, but puts it in the session
>
> > over the command header. Thus, you can have multiple secrets for an obj=
ect.
>
> >
>
> > Typically, for a recovery password, folks couple it to the hierarchy th=
e object belongs in via policyauthorize.
>
> >
>
> > ________________________________
>
> > From: Felix Rubio Dalmau <felix(a)kngnt.org>
>
> > Sent: Saturday, June 12, 2021 12:58 AM
>
> > To: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
>
> > Subject: [tpm2] Example with multifactor authentication available?
>
> >
>
> >
>
> > Hi everybody!
>
> >
>
> >
>
> > I am still learning about tpm and tpm2-tools. Following the advice from=
 William Roberts, I set the authentication policy up as AND(pcr, password) =
by doing the following:
>
> >
>
> >
>
> >     # create a policy that requires the pcr and the password
>
> >
>
> >     tpm2_startauthsession -S session.dat
>
> >
>
> >     tpm2_policypcr -S session.dat -l "sha1:0,1,2,3" -L policy.dat
>
> >
>
> >     tpm2_policypassword -S session.dat -L policy.dat
>
> >
>
> >     tpm2_flushcontext session.dat
>
> >
>
> >
>
> >     # and the sealing goes with
>
> >
>
> >     echo mysecret | tpm2_create -C primary.ctx -u key.pub -r key.priv -=
i- -p password -L policy.dat
>
> >
>
> >
>
> > William suggested I should set up a signed policy so that when UEFI get=
s updated I can regenerate the policy and not find myself lock out off the =
system, which I understand, but the problem is: to prevent from further unl=
ock attemps, after unsealing the secret protected by that policy, I will ex=
tend one of the pcr registers... so, if I generate the pcr policy with the =
live system, I will be using pcr values that have been altered.
>
> >
>
> >
>
> > Now, I have thought in either forcing the EFI updates to happen during =
the system boot (I download the update, recreate a initramfs including it, =
and during the following boot, in the unlocking script, the UEFI gets updat=
ed and the policy gets created before unlocking), or in having a multi fact=
or authentication that allows me to get in with either the previous policy =
or with another policy composed by the previous password and a rescue passw=
ord. In this case, AND(password1, OR(password2, pcr)), I have written the f=
ollowing statements:
>
> >
>
> >
>
> >     # session for auth based on pcr
>
> >     tpm2_startauthsession -S session.dat
>
> >     tpm2_policypcr -S session.dat -l "sha256:0,1" -L policy.pcr
>
> >     tpm2_flushcontext session.dat
>
> >     rm session.dat
>
> >
>
> >     # session for auth based on rescue password
>
> >     tpm2_startauthsession -S session.dat
>
> >     tpm2_policypassword -S session.dat -L policy.rescue
>
> >     tpm2_flushcontext session.dat
>
> >
>
> >     rm session.dat
>
> >
>
> >     # compound both policies using OR and require always the password
>
> >     tpm2_startauthsession -S session.dat
>
> >     tpm2_policyor -S session.dat -L policy.dat sha256:policy.pcr,policy=
.rescue
>
> >     tpm2_policypassword -S session.dat -L policy.dat
>
> >     tpm2_flushcontext session.dat
>
> >
>
> >     rm session.dat
>
> >
>
> >
>
> >
>
> > I think this is ok, but then.. I do not see how to initialize the passw=
ord policies. Is there any example similar to what I want to achieve?
>
> >
>
> >
>
> > Thank you!
>
> >
>
> > Felix
>
> >
>
>
>





--===============0180400371392058412==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD11cy1hc2NpaSI+CjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4KPC9oZWFkPgo8Ym9keSBkaXI9Imx0ciI+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxp
YnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9y
OiByZ2IoMCwgMCwgMCk7Ij4KWW91IHNob3VsZCBuZXZlciBkZXBsb3kgd2l0aCBhbiBlbXB0eSBv
d25lciBwYXNzd29yZCwgYXMgYSBET1MgYXR0YWNrIHdvdWxkIGJlIHByZXR0eSB0cml2aWFsLjwv
ZGl2Pgo8ZGl2IGlkPSJhcHBlbmRvbnNlbmQiPjwvZGl2Pgo8aHIgc3R5bGU9ImRpc3BsYXk6aW5s
aW5lLWJsb2NrO3dpZHRoOjk4JSIgdGFiaW5kZXg9Ii0xIj4KPGRpdiBpZD0iZGl2UnBseUZ3ZE1z
ZyIgZGlyPSJsdHIiPjxmb250IGZhY2U9IkNhbGlicmksIHNhbnMtc2VyaWYiIHN0eWxlPSJmb250
LXNpemU6MTFwdCIgY29sb3I9IiMwMDAwMDAiPjxiPkZyb206PC9iPiBGZWxpeCBSdWJpbyBEYWxt
YXUgJmx0O2ZlbGl4QGtuZ250Lm9yZyZndDs8YnI+CjxiPlNlbnQ6PC9iPiBUdWVzZGF5LCBBdWd1
c3QgMjQsIDIwMjEgMToyOSBQTTxicj4KPGI+VG86PC9iPiBSb2JlcnRzLCBXaWxsaWFtIEMgJmx0
O3dpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSZndDs8YnI+CjxiPkNjOjwvYj4gdHBtMkBsaXN0
cy4wMS5vcmcgJmx0O3RwbTJAbGlzdHMuMDEub3JnJmd0Ozxicj4KPGI+U3ViamVjdDo8L2I+IFJl
OiBbdHBtMl0gRXhhbXBsZSB3aXRoIG11bHRpZmFjdG9yIGF1dGhlbnRpY2F0aW9uIGF2YWlsYWJs
ZT88L2ZvbnQ+CjxkaXY+Jm5ic3A7PC9kaXY+CjwvZGl2Pgo8ZGl2IGNsYXNzPSJCb2R5RnJhZ21l
bnQiPjxmb250IHNpemU9IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFwdDsiPgo8ZGl2IGNs
YXNzPSJQbGFpblRleHQiPkhpIFdpbGxpYW0sPGJyPgo8YnI+CmZpcnN0IG9mIGFsbCwgdGhhbmsg
eW91IHZlcnkgbXVjaCBmb3IgeW91ciBlbWFpbCEgSSBoYXZlIG9uZSBxdWVzdGlvbjogc28gZmFy
LCBJIGFtIGlzc3VpbmcgYWxsIHRoZXNlIGNvbW1hbmRzIGFmdGVyIGNsZWFyaW5nIHRoZSB0cG0g
YW5kIHdpdGhvdXQgdGFraW5nIG93bmVyc2hpcCBvZiBpdCAoc28sIEkgYW0gbm90IHNwZWNpZnlp
bmcgYW55IHBhc3N3b3JkIGF0IGFsbCkuIElmIGRvaW5nIHNvLCBhbmQgdXNpbmcgdGhlIFRQTSBv
d25lciBwYXNzd29yZAogYXMgdGhlIHJlc2N1ZSBwYXNzd29yZC4uLiBkbyB5b3UgdGhpbmsgdGhh
dCBpcyBhIGdvb2QgaWRlYT8gSSBhbSBub3QgY2hhbGxlbmdpbmcgeW91LCBidXQgSSB3b3VsZCBs
aWtlIHRvIGdldCB5b3VyIHRob3VnaHRzLjxicj4KPGJyPgpUaGFuayB5b3UgdmVyeSBtdWNoITxi
cj4KPGJyPgpGZWxpeDxicj4KPGJyPgpPbiBNb25kYXksIDIzIEF1Z3VzdCAyMDIxIDIyOjQ4OjM4
IENFU1QgUm9iZXJ0cywgV2lsbGlhbSBDIHdyb3RlOjxicj4KJmd0OyBJIGdvdCBhIGZldyB0aGlu
Z3Mgd3JvbmcgaW4gdGhhdCByZXNwb25zZSwgbXkgYXBvbG9naWVzIGFuZCBsZXQgbWUgdHJ5IGFu
ZCBjbGFyaWZ5Ojxicj4KJmd0OyA8YnI+CiZndDsgcG9saWN5cGFzc3dvcmQgLSBhbGxvd3MgeW91
IHRvIHNwZWNpZnkgYSBwYXNzd29yZCB0byB1c2UgYW4gb2JqZWN0IHdoZW4gdGhlIG9iamVjdHMg
dXNlcmF1dGggYXR0cmlidXRlIGlzIDAuIEZvciBvYmplY3RzIHRoYXQgYXJlIG9ubHkgYWJsZSB0
bzxicj4KJmd0OyBiZSBhdXRoZW50aWNhdGVkIHRvIHdpdGggcG9saWNpZXMuPGJyPgomZ3Q7IDxi
cj4KJmd0OyBwb2xpY3lzZWNyZXQgLSBjb3VwbGUgYW4gb2JqZWN0cyBhdXRoIHZhbHVlIHRvIHNv
bWV0aGluZyBlbHNlLCBsaWtlIHRoZSBvd25lciBoaWVyYXJjaHkuPGJyPgomZ3Q7IDxicj4KJmd0
OyBwb2xpY3lhdXRob3JpemUgLSBjb3VwbGUgYW4gb2JqZWN0cyBhdXRoIHZhbHVlIHRvIGEgc2ln
bmluZyBhdXRob3JpdHkuPGJyPgomZ3Q7IDxicj4KJmd0OyBXZSBvbmx5IGNhcmUgYWJvdXQgdGhl
IGZpcnN0IHR3byB0aGluZ3MgaGVyZSwgcG9saWN5IHBhc3N3b3JkIGFuZCBwb2xpY3lzZWNyZXQu
PGJyPgomZ3Q7IDxicj4KJmd0OyBUaGUga2V5cyBoZXJlIGFyZSB1bmRlcnN0YW5kaW5nIHdoYXQg
eW91IHdhbnQgYmFzZWQgb24gdGhlIGF0dHJpYnV0ZXMgb2YgYW4gb2JqZWN0IGFuZCBob3cgYXV0
aCB3b3JrIGluIHRoZSBUUE0uPGJyPgomZ3Q7IE9iamVjdHMgY2FuIGVpdGhlciBoYXZlIHVzZXJ3
aXRoYXV0aCAxIG9yIDAsIGlmIGl0J3MgMCwgdGhlbiBvbmx5IHBvbGljeSBiYXNlZCBhdXRob3Jp
emF0aW9uIHdpbGwgd29yay4gV2hlbiB5b3UgY3JlYXRlIHRoZTxicj4KJmd0OyBvYmplY3QsIGEg
cG9saWN5IGhhc2ggaXMgc3RvcmVkIGluIHRoZSBwdWJsaWMgcG9ydGlvbiBhbmQgdGhlIHBhc3N3
b3JkIGlmIHNwZWNpZmllZCBpcyBzdG9yZWQgaW4gdGhlIHByaXZhdGUgcG9ydGlvbi4gV2hlbiB5
b3Ugd2FudDxicj4KJmd0OyB0byB1c2UgdGhhdCBvYmplY3QsIHRoZSBUUE0gd2lsbCByZXF1aXJl
IHBvbGljeS1iYXNlZCBhdXRob3JpemF0aW9ucywgaWYgeW91IHdhbnQgdGhlIFRQTSB0byBpbnZl
c3RpZ2F0ZSB0aGUgY29tbWFuZCZuYnNwOyBoZWFkZXIgZm9yIGEgcGFzc3dvcmQ8YnI+CiZndDsg
dGhlbiB5b3UgaGF2ZSB0byB1c2UgdGhlIHBvbGljeXBhc3N3b3JkIGNvbW1hbmQgc28gaXQga25v
d3MuIElmIHlvdSBzZXQgYSBwYXNzd29yZCBmb3IgYW4gb2JqZWN0IHdpdGggdXNlcndpdGhhdXRo
IDEgYXR0cmlidXRlLCB0aGVuIHlvdSBjYW4gYXV0aGVudGljYXRlIHRvIGl0IHdpdGggZWl0aGVy
IHRoZSBwb2xpY3kgb3IgdGhlIHBhc3N3b3JkLCBzbyB3ZSBuZWVkIHRvIHR1cm4gdGhpcyBvZmYg
dG8gZ2V0IGl0IGludG8gdGhlIEFORCByZXF1aXJlbWVudAogeW91IGhhdmUuPGJyPgomZ3Q7IDxi
cj4KJmd0OyBUaGUgbWFucGFnZSBmb3IgcG9saWN5b3IgYWN0dWFsbHkgZ2l2ZXMmbmJzcDsgdGhp
cyBleGFjdCBzY2VuYXJpbzo8YnI+CiZndDsgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3Rw
bTItc29mdHdhcmUvdHBtMi10b29scy9ibG9iL21hc3Rlci9tYW4vdHBtMl9wb2xpY3lvci4xLm1k
I2V4YW1wbGVzIj4KaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10b29scy9i
bG9iL21hc3Rlci9tYW4vdHBtMl9wb2xpY3lvci4xLm1kI2V4YW1wbGVzPC9hPjxicj4KJmd0OyA8
YnI+CiZndDsgQnV0IGluIHlvdXIgaW5pdGlhbCBlbWFpbCB5b3UgdGFsayBhYm91dCBhIHBvbGlj
eSB3aGVyZSBpdHMgcG9saWN5KHBhc3N3b3JkMSkgb3IgcG9saWN5KHBhc3N3b3JkMiwgUENSKSwg
dG8gZ2V0IHRoZXJlIHlvdSB3b3VsZCBuZWVkIHRvIHVzZTxicj4KJmd0OyBwb2xpY3lzZWNyZXQg
c2luY2UgeW91IG5lZWQgYW4gb2JqZWN0IHRvIGhhdmUgbXVsdGlwbGUgYXV0aCB2YWx1ZXMsIGFu
IG9iamVjdCBjYW4gb25seSBoYXZlIG9uZSwgc28gcG9saWN5c2VjcmV0IHdvdWxkIGxldCB5b3Ug
Y291cGxlIE48YnI+CiZndDsgc2VjcmV0cy48YnI+CiZndDsgPGJyPgomZ3Q7IEhlcmUncyBhIGdp
c3QgKDxhIGhyZWY9Imh0dHBzOi8vZ2lzdC5naXRodWIuY29tL3dpbGxpYW1jcm9iZXJ0cy83YTNi
YmEyZjQ1YmYyOGM1YTE5YzVlMTNlNWM4ZGEyMSI+aHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vd2ls
bGlhbWNyb2JlcnRzLzdhM2JiYTJmNDViZjI4YzVhMTljNWUxM2U1YzhkYTIxPC9hPik8YnI+CiZn
dDsgdGhhdCBzZWVtcyB0byBkbyB3aGF0IHlvdSB3YW50LCBJIHNvdXJjZWQgaXQgYW5kIGRpZCB0
aGlzIG9uIGEgU0lNVUxBVE9SOjxicj4KJmd0OyA8YnI+CiZndDsgdHBtMl9jaGFuZ2VhdXRoIC1j
IG8gb3duZXJwYXNzPGJyPgomZ3Q7IHRwbTJfY3JlYXRlcHJpbWFyeSAtYyBwcmltYXJ5LmN0eDxi
cj4KJmd0OyA8YnI+CiZndDsgZG9fcG9saWN5X3NlY3JldDxicj4KJmd0OyAwZDg0ZjU1ZGFmNmU0
M2FjOTc5NjZlNjJjOWJiOTg5ZDMzOTc3NzdkMjVjNWY3NDk4NjgwNTVkNjUzOTRmOTUyPGJyPgom
Z3Q7IDxicj4KJmd0OyBkb19wb2xpY3lfcGNyX2FuZF9wYXNzPGJyPgomZ3Q7IDhmY2QyMTY5YWI5
MjY5NGUwYzYzM2YxYWI3NzI4NDJiODI0MWJiYzIwMjg4OTgxZmM3YWMxZWRkYzFmZGRiMGU8YnI+
CiZndDsgZWEzNWI3NzdmYTNmNWE1ZTcwMmYwYTQyNjkxZTM3Y2YzZTc2YTdhOGUyODk0YmM3ZTYx
YTJkMGVmZmJkMGU3NDxicj4KJmd0OyA8YnI+CiZndDsgZG9fcG9saWN5X29yPGJyPgomZ3Q7IDk1
MmE0MWE5Njc4YWY1M2QwNGU2NjA3YTVlZDUxZDUyMjAyM2U4MWExZmQ2ODg3MmU5ZGNjOTZmZWUy
YmUzZmI8YnI+CiZndDsgPGJyPgomZ3Q7IGRvX2NyZWF0ZTxicj4KJmd0OyBuYW1lLWFsZzo8YnI+
CiZndDsmbmJzcDsmbmJzcDsgdmFsdWU6IHNoYTI1Njxicj4KJmd0OyZuYnNwOyZuYnNwOyByYXc6
IDB4Yjxicj4KJmd0OyBhdHRyaWJ1dGVzOjxicj4KJmd0OyZuYnNwOyZuYnNwOyB2YWx1ZTogZml4
ZWR0cG18Zml4ZWRwYXJlbnQ8YnI+CiZndDsmbmJzcDsmbmJzcDsgcmF3OiAweDEyPGJyPgomZ3Q7
IHR5cGU6PGJyPgomZ3Q7Jm5ic3A7Jm5ic3A7IHZhbHVlOiBrZXllZGhhc2g8YnI+CiZndDsmbmJz
cDsmbmJzcDsgcmF3OiAweDg8YnI+CiZndDsgYWxnb3JpdGhtOjxicj4KJmd0OyZuYnNwOyZuYnNw
OyB2YWx1ZTogbnVsbDxicj4KJmd0OyZuYnNwOyZuYnNwOyByYXc6IDB4MTA8YnI+CiZndDsga2V5
ZWRoYXNoOiBlY2RkYmY3NTQzMWVlYjYzNWQxMThlZjU5ZGM5YTEwMDYxMmJiNTk1YmY0MjE2NGRj
N2FmNDNlZmVkZWFlM2FiPGJyPgomZ3Q7IGF1dGhvcml6YXRpb24gcG9saWN5OiA5NTJhNDFhOTY3
OGFmNTNkMDRlNjYwN2E1ZWQ1MWQ1MjIwMjNlODFhMWZkNjg4NzJlOWRjYzk2ZmVlMmJlM2ZiPGJy
PgomZ3Q7IDxicj4KJmd0OyBkb191bnNlYWxfcGNyPGJyPgomZ3Q7IDhmY2QyMTY5YWI5MjY5NGUw
YzYzM2YxYWI3NzI4NDJiODI0MWJiYzIwMjg4OTgxZmM3YWMxZWRkYzFmZGRiMGU8YnI+CiZndDsg
ZWEzNWI3NzdmYTNmNWE1ZTcwMmYwYTQyNjkxZTM3Y2YzZTc2YTdhOGUyODk0YmM3ZTYxYTJkMGVm
ZmJkMGU3NDxicj4KJmd0OyA5NTJhNDFhOTY3OGFmNTNkMDRlNjYwN2E1ZWQ1MWQ1MjIwMjNlODFh
MWZkNjg4NzJlOWRjYzk2ZmVlMmJlM2ZiPGJyPgomZ3Q7IG15c2VjcmV0PGJyPgomZ3Q7IDxicj4K
Jmd0OyBkb19icmVha19wY3I8YnI+CiZndDsgc2hhMTogZjFkMmQyZjkyNGU5ODZhYzg2ZmRmN2Iz
NmM5NGJjZGYzMmJlZWMxNTxicj4KJmd0OyBzaGEyNTY6IGI1YmI5ZDgwMTRhMGY5YjFkNjFlMjFl
Nzk2ZDc4ZGNjZGYxMzUyZjIzY2QzMjgxMmY0ODUwYjg3OGFlNDk0NGM8YnI+CiZndDsgc2hhMzg0
OiA4ZWZmZGFiZmUxNDQxNjIxNGEyNTBmOTM1NTA1MjUwYmQ5OTFmMTA2MDY1ZDg5OWRiNmUxOWJk
YzhiZjY0OGYzYWMwZjE5MzVjNGY2NWZlOGY3OTgyODliMWEwZDFlMDY8YnI+CiZndDsgc2hhNTEy
OiAwY2Y5MTgwYTc2NGFiYTg2M2E2N2I2ZDcyZjA5MThiYzEzMWM2NzcyNjQyY2IyZGNlNWEzNGYw
YTcwMmY5NDcwZGRjMmJmMTI1YzEyMTk4YjE5OTVjMjMzYzM0YjRhZmQzNDZjNTRhMjMzNGMzNTBh
OTQ4YTUxYjZlOGI0ZTZiNjxicj4KJmd0OyA8YnI+CiZndDsgZG9fdW5zZWFsX3Bjcjxicj4KJmd0
OyA4ZmNkMjE2OWFiOTI2OTRlMGM2MzNmMWFiNzcyODQyYjgyNDFiYmMyMDI4ODk4MWZjN2FjMWVk
ZGMxZmRkYjBlPGJyPgomZ3Q7IDA1ZjdmMzYxZTJkZDdlZmRlMGFlZTFmMGUyYTM2YTQ5MTg1YjZj
MWZhNDc5ZjQ2ZjA5ZGFkNjhiMmFmOWRmN2I8YnI+CiZndDsgV0FSTklORzplc3lzOnNyYy90c3My
LWVzeXMvYXBpL0VzeXNfUG9saWN5T1IuYzoyODY6RXN5c19Qb2xpY3lPUl9GaW5pc2goKSBSZWNl
aXZlZCBUUE0gRXJyb3I8YnI+CiZndDsgRVJST1I6ZXN5czpzcmMvdHNzMi1lc3lzL2FwaS9Fc3lz
X1BvbGljeU9SLmM6MTAwOkVzeXNfUG9saWN5T1IoKSBFc3lzIEZpbmlzaCBFcnJvckNvZGUgKDB4
MDAwMDAxYzQpPGJyPgomZ3Q7IEVSUk9SOiBFc3lzX1BvbGljeUF1dGhvcml6ZSgweDFDNCkgLSB0
cG06cGFyYW1ldGVyKDEpOnZhbHVlIGlzIG91dCBvZiByYW5nZSBvciBpcyBub3QgY29ycmVjdCBm
b3IgdGhlIGNvbnRleHQ8YnI+CiZndDsgRVJST1I6IENvdWxkIG5vdCBidWlsZCBwb2xpY3lvciBU
UE08YnI+CiZndDsgRVJST1I6IFVuYWJsZSB0byBydW4gdHBtMl9wb2xpY3lvcjxicj4KJmd0OyBX
QVJOSU5HOmVzeXM6c3JjL3RzczItZXN5cy9hcGkvRXN5c19VbnNlYWwuYzoyOTU6RXN5c19VbnNl
YWxfRmluaXNoKCkgUmVjZWl2ZWQgVFBNIEVycm9yPGJyPgomZ3Q7IEVSUk9SOmVzeXM6c3JjL3Rz
czItZXN5cy9hcGkvRXN5c19VbnNlYWwuYzo5ODpFc3lzX1Vuc2VhbCgpIEVzeXMgRmluaXNoIEVy
cm9yQ29kZSAoMHgwMDAwMDk5ZCk8YnI+CiZndDsgRVJST1I6IEVzeXNfVW5zZWFsKDB4OTlEKSAt
IHRwbTpzZXNzaW9uKDEpOmEgcG9saWN5IGNoZWNrIGZhaWxlZDxicj4KJmd0OyBFUlJPUjogVW5h
YmxlIHRvIHJ1biB0cG0yX3Vuc2VhbDxicj4KJmd0OyA8YnI+CiZndDsgIyByZWNvdmVyIHdpdGgg
b3duZXIgcGFzczxicj4KJmd0OyBkb191bnNlYWxfcmVjb3Zlcnk8YnI+CiZndDsgMGQ4NGY1NWRh
ZjZlNDNhYzk3OTY2ZTYyYzliYjk4OWQzMzk3Nzc3ZDI1YzVmNzQ5ODY4MDU1ZDY1Mzk0Zjk1Mjxi
cj4KJmd0OyA5NTJhNDFhOTY3OGFmNTNkMDRlNjYwN2E1ZWQ1MWQ1MjIwMjNlODFhMWZkNjg4NzJl
OWRjYzk2ZmVlMmJlM2ZiPGJyPgomZ3Q7IG15c2VjcmV0PGJyPgomZ3Q7IDxicj4KJmd0OyBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXzxicj4KJmd0OyBGcm9tOiBGZWxpeCBSdWJpbyBE
YWxtYXUgJmx0O2ZlbGl4QGtuZ250Lm9yZyZndDs8YnI+CiZndDsgU2VudDogU3VuZGF5LCBBdWd1
c3QgMjIsIDIwMjEgMjo1NyBBTTxicj4KJmd0OyBUbzogUm9iZXJ0cywgV2lsbGlhbSBDICZsdDt3
aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20mZ3Q7PGJyPgomZ3Q7IENjOiB0cG0yQGxpc3RzLjAx
Lm9yZyAmbHQ7dHBtMkBsaXN0cy4wMS5vcmcmZ3Q7PGJyPgomZ3Q7IFN1YmplY3Q6IFJlOiBbdHBt
Ml0gRXhhbXBsZSB3aXRoIG11bHRpZmFjdG9yIGF1dGhlbnRpY2F0aW9uIGF2YWlsYWJsZT88YnI+
CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyBIaSBXaWxsaWFtLDxicj4KJmd0OyA8YnI+CiZndDsg
PGJyPgomZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IFNvcnJ5IGZvciBhbnN3ZXJpbmcgc28g
bGF0ZSBhZnRlciB5b3VyIGxhc3QgZW1haWwuIEkgaGFkIHRvIGp1bXAgdG8gYW5vdGhlciBzdWJq
ZWN0LCB0aGVuIGhvbGlkYXlzLi4uIHllYWgsIGxpZmUgSSBndWVzcyEgSSBoYXZlIHN0YXJ0ZWQg
YWdhaW4gbG9va2luZyBhdCB0aGlzIG1hdHRlciwgYW5kLi4uIEkgZG8gbm90IHVuZGVyc3RhbmQg
dGhlIHBhcnQgb2YgdGhlIHJlc2N1ZSBwYXNzd29yZCBhbmQgaG93IHRvIHVzZSBpdC4gSSBzZWUK
IHRoYXQgdXNpbmcgcG9saWN5c2VjcmV0IGlzIHRoZSB3YXkgdG8gZ28sIGJlY2F1c2UgaXQgZG9l
cyBub3Qgc2V0IGFueSBmbGFnIHRvIHJlcXVpcmUgYSBwYXNzd29yZCB3aGVuIHRoZSBjcmVhdGUg
aXMgaXNzdWVkLCBidXQgSSBzdGlsbCBkbyBub3Qgc2VlIGhvdyB0byB1c2UgaXQgdG8gaW5wdXQg
YSBwYXNzd29yZC4gSW4gdGhlIGhlbHAgb2YgcG9saWN5c2VjcmV0LCBpdCBzdGF0ZXM6PGJyPgom
Z3Q7IDxicj4KJmd0OyA8YnI+CiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgJnF1
b3Q7VFBNMl9Qb2xpY3lTZWNyZXQgY29tbWFuZCByZXF1aXJlcyB5b3UgdG8gcGFzcyBpbiB0aGUg
bmFtZSBvZiB0aGUgb2JqZWN0IHdob3NlIHBhc3N3b3JkIGlzIHJlcXVpcmVkIHRvIHNhdGlzZnkg
dGhlIHBvbGljeSZxdW90Ozxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IERvZXMgdGhpcyBt
ZWFuIHRoYXQgSSBzaG91bGQgY3JlYXRlIGFuIG9iamVjdCwgcGFzc3dvcmQtcHJvdGVjdGVkLCBq
dXN0IGZvciB0aGUgc2FrZSBvZiB1c2luZyBpdCBsYXRlciB3aXRoIHBvbGljeXNlY3JldD8/IEl0
IHNvdW5kcyB3ZWlyZCB0byBtZSwgYnV0IEkgYW0gbm90IHNraWxsZWQgZW5vdWdoIHRvIHByb3Bl
cmx5IGFzc2VzcyBpdC48YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyBSZWdhcmRzITxicj4K
Jmd0OyA8YnI+CiZndDsgRmVsaXg8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyBPbiBNb25k
YXksIDE0IEp1bmUgMjAyMSAyMDo1MToxNCBDRVNUIFJvYmVydHMsIFdpbGxpYW0gQyB3cm90ZTo8
YnI+CiZndDsgPGJyPgomZ3Q7ICZndDsgVHdvIHRoaW5ncywgaWYgeW91IG5lZWQgZGlmZmVyZW50
IFBDUiB2YWx1ZXMgdGhhbiB3aGF0J3Mgb24gdGhlIHN5c3RlbSwgdGhlIFRQTSBvbmx5IGNhcmVz
IGFib3V0IHRoZSBoYXNoIG9mIGFsbCB0aGUgYmFua3MsIHNvIHlvdSBjYW4ganVzdCBzcGVjaWZ5
IHRoYXQgZXhwZWN0ZWQgaGFzaCBvZiB0aGUgUENSIHN0YXRlIGFzIGFyZ3VtZW50IDMgdG8gdHBt
Ml9wb2xpY3lwY3IgYXMgc2hvd24gaW4gdGhlIG1hbiBwYWdlIChzaW5jZSA1LjApLgogSWYgb24g
ZWFybHkgdmVyc2lvbnMsIHlvdSBjYW4gY3JlYXRlIGEgYmluYXJ5IGZpbGUsIHRoYXQncyBhIGxp
c3Qgb2YgYmluYXJ5IGhhc2hlcyBpbiBvcmRlciBvZiB0aGUgUENSIHNlbGVjdGlvbi4gSWUgaWYg
eW91IGRpZCBzaGEyNTY6MSwyLDMsIHRoZSBmaWxlIHdvdWxkIGJlIDMgKiAzMiBieXRlcyBpbiBz
aXplIGFuZCBjb250YWluIHRoZSBoYXNoZXMgb2YgUENSMSwgMiwgMyBpbiB0aGF0IG9yZGVyLiBU
aGlzIGlzIHRoZSBiaW5hcnkgZm9ybWF0CiBmcm9tIHRwbTJfcGNycmVhZCAtbywgc28gaWYgeW91
IGhhdmUgYSBzeXN0ZW0gaW4gdGhlIGV4cGVjdGVkIHN0YXRlLCB5b3UgY2FuIHVzZSB0aGF0IHRv
IG91dHB1dCBpdCwgb3IgaGFuZCBqYW0gaXQuPGJyPgomZ3Q7IDxicj4KJmd0OyAmZ3Q7PGJyPgom
Z3Q7IDxicj4KJmd0OyAmZ3Q7IHBvbGljeSBwYXNzd29yZCBqdXN0IHNheXMsIGhleSByZXF1aXJl
IGEgcGFzc3dvcmQgZm9yIHRoaXMgb2JqZWN0LCBhbmQgaXQgd2lsbCBiZSBmb3VuZCBpbiB0aGUg
VFBNIGhlYWRlciBpbiB0aGUgY29tbWFuZC48YnI+CiZndDsgPGJyPgomZ3Q7ICZndDs8YnI+CiZn
dDsgPGJyPgomZ3Q7ICZndDsgU28sIHRoZSBiZXR0ZXIgd2F5IHdvdWxkIGJlIHRvIGxvb2sgYXQg
cG9saWN5c2VjcmV0LCB3aGljaCBlZmZlY3RpdmVseSBkb2VzIHRoZSBzYW1lIHRoaW5nLCBidXQg
cHV0cyBpdCBpbiB0aGUgc2Vzc2lvbjxicj4KJmd0OyA8YnI+CiZndDsgJmd0OyBvdmVyIHRoZSBj
b21tYW5kIGhlYWRlci4gVGh1cywgeW91IGNhbiBoYXZlIG11bHRpcGxlIHNlY3JldHMgZm9yIGFu
IG9iamVjdC48YnI+CiZndDsgPGJyPgomZ3Q7ICZndDs8YnI+CiZndDsgPGJyPgomZ3Q7ICZndDsg
VHlwaWNhbGx5LCBmb3IgYSByZWNvdmVyeSBwYXNzd29yZCwgZm9sa3MgY291cGxlIGl0IHRvIHRo
ZSBoaWVyYXJjaHkgdGhlIG9iamVjdCBiZWxvbmdzIGluIHZpYSBwb2xpY3lhdXRob3JpemUuPGJy
PgomZ3Q7IDxicj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7IDxicj4KJmd0OyAmZ3Q7IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fPGJyPgomZ3Q7IDxicj4KJmd0OyAmZ3Q7IEZyb206IEZlbGl4
IFJ1YmlvIERhbG1hdSAmbHQ7ZmVsaXhAa25nbnQub3JnJmd0Ozxicj4KJmd0OyA8YnI+CiZndDsg
Jmd0OyBTZW50OiBTYXR1cmRheSwgSnVuZSAxMiwgMjAyMSAxMjo1OCBBTTxicj4KJmd0OyA8YnI+
CiZndDsgJmd0OyBUbzogdHBtMkBsaXN0cy4wMS5vcmcgJmx0O3RwbTJAbGlzdHMuMDEub3JnJmd0
Ozxicj4KJmd0OyA8YnI+CiZndDsgJmd0OyBTdWJqZWN0OiBbdHBtMl0gRXhhbXBsZSB3aXRoIG11
bHRpZmFjdG9yIGF1dGhlbnRpY2F0aW9uIGF2YWlsYWJsZT88YnI+CiZndDsgPGJyPgomZ3Q7ICZn
dDs8YnI+CiZndDsgPGJyPgomZ3Q7ICZndDs8YnI+CiZndDsgPGJyPgomZ3Q7ICZndDsgSGkgZXZl
cnlib2R5ITxicj4KJmd0OyA8YnI+CiZndDsgJmd0Ozxicj4KJmd0OyA8YnI+CiZndDsgJmd0Ozxi
cj4KJmd0OyA8YnI+CiZndDsgJmd0OyBJIGFtIHN0aWxsIGxlYXJuaW5nIGFib3V0IHRwbSBhbmQg
dHBtMi10b29scy4gRm9sbG93aW5nIHRoZSBhZHZpY2UgZnJvbSBXaWxsaWFtIFJvYmVydHMsIEkg
c2V0IHRoZSBhdXRoZW50aWNhdGlvbiBwb2xpY3kgdXAgYXMgQU5EKHBjciwgcGFzc3dvcmQpIGJ5
IGRvaW5nIHRoZSBmb2xsb3dpbmc6PGJyPgomZ3Q7IDxicj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7IDxi
cj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7IDxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7ICMgY3JlYXRlIGEgcG9saWN5IHRoYXQgcmVxdWlyZXMgdGhlIHBjciBhbmQgdGhlIHBhc3N3
b3JkPGJyPgomZ3Q7IDxicj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7IDxicj4KJmd0OyAmZ3Q7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7IHRwbTJfc3RhcnRhdXRoc2Vzc2lvbiAtUyBzZXNzaW9uLmRhdDxi
cj4KJmd0OyA8YnI+CiZndDsgJmd0Ozxicj4KJmd0OyA8YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyB0cG0yX3BvbGljeXBjciAtUyBzZXNzaW9uLmRhdCAtbCAmcXVvdDtzaGEx
OjAsMSwyLDMmcXVvdDsgLUwgcG9saWN5LmRhdDxicj4KJmd0OyA8YnI+CiZndDsgJmd0Ozxicj4K
Jmd0OyA8YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB0cG0yX3BvbGljeXBh
c3N3b3JkIC1TIHNlc3Npb24uZGF0IC1MIHBvbGljeS5kYXQ8YnI+CiZndDsgPGJyPgomZ3Q7ICZn
dDs8YnI+CiZndDsgPGJyPgomZ3Q7ICZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgdHBtMl9m
bHVzaGNvbnRleHQgc2Vzc2lvbi5kYXQ8YnI+CiZndDsgPGJyPgomZ3Q7ICZndDs8YnI+CiZndDsg
PGJyPgomZ3Q7ICZndDs8YnI+CiZndDsgPGJyPgomZ3Q7ICZndDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsgIyBhbmQgdGhlIHNlYWxpbmcgZ29lcyB3aXRoPGJyPgomZ3Q7IDxicj4KJmd0OyAmZ3Q7
PGJyPgomZ3Q7IDxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGVjaG8gbXlz
ZWNyZXQgfCB0cG0yX2NyZWF0ZSAtQyBwcmltYXJ5LmN0eCAtdSBrZXkucHViIC1yIGtleS5wcml2
IC1pLSAtcCBwYXNzd29yZCAtTCBwb2xpY3kuZGF0PGJyPgomZ3Q7IDxicj4KJmd0OyAmZ3Q7PGJy
PgomZ3Q7IDxicj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7IDxicj4KJmd0OyAmZ3Q7IFdpbGxpYW0gc3Vn
Z2VzdGVkIEkgc2hvdWxkIHNldCB1cCBhIHNpZ25lZCBwb2xpY3kgc28gdGhhdCB3aGVuIFVFRkkg
Z2V0cyB1cGRhdGVkIEkgY2FuIHJlZ2VuZXJhdGUgdGhlIHBvbGljeSBhbmQgbm90IGZpbmQgbXlz
ZWxmIGxvY2sgb3V0IG9mZiB0aGUgc3lzdGVtLCB3aGljaCBJIHVuZGVyc3RhbmQsIGJ1dCB0aGUg
cHJvYmxlbSBpczogdG8gcHJldmVudCBmcm9tIGZ1cnRoZXIgdW5sb2NrIGF0dGVtcHMsIGFmdGVy
IHVuc2VhbGluZyB0aGUKIHNlY3JldCBwcm90ZWN0ZWQgYnkgdGhhdCBwb2xpY3ksIEkgd2lsbCBl
eHRlbmQgb25lIG9mIHRoZSBwY3IgcmVnaXN0ZXJzLi4uIHNvLCBpZiBJIGdlbmVyYXRlIHRoZSBw
Y3IgcG9saWN5IHdpdGggdGhlIGxpdmUgc3lzdGVtLCBJIHdpbGwgYmUgdXNpbmcgcGNyIHZhbHVl
cyB0aGF0IGhhdmUgYmVlbiBhbHRlcmVkLjxicj4KJmd0OyA8YnI+CiZndDsgJmd0Ozxicj4KJmd0
OyA8YnI+CiZndDsgJmd0Ozxicj4KJmd0OyA8YnI+CiZndDsgJmd0OyBOb3csIEkgaGF2ZSB0aG91
Z2h0IGluIGVpdGhlciBmb3JjaW5nIHRoZSBFRkkgdXBkYXRlcyB0byBoYXBwZW4gZHVyaW5nIHRo
ZSBzeXN0ZW0gYm9vdCAoSSBkb3dubG9hZCB0aGUgdXBkYXRlLCByZWNyZWF0ZSBhIGluaXRyYW1m
cyBpbmNsdWRpbmcgaXQsIGFuZCBkdXJpbmcgdGhlIGZvbGxvd2luZyBib290LCBpbiB0aGUgdW5s
b2NraW5nIHNjcmlwdCwgdGhlIFVFRkkgZ2V0cyB1cGRhdGVkIGFuZCB0aGUgcG9saWN5IGdldHMg
Y3JlYXRlZCBiZWZvcmUKIHVubG9ja2luZyksIG9yIGluIGhhdmluZyBhIG11bHRpIGZhY3RvciBh
dXRoZW50aWNhdGlvbiB0aGF0IGFsbG93cyBtZSB0byBnZXQgaW4gd2l0aCBlaXRoZXIgdGhlIHBy
ZXZpb3VzIHBvbGljeSBvciB3aXRoIGFub3RoZXIgcG9saWN5IGNvbXBvc2VkIGJ5IHRoZSBwcmV2
aW91cyBwYXNzd29yZCBhbmQgYSByZXNjdWUgcGFzc3dvcmQuIEluIHRoaXMgY2FzZSwgQU5EKHBh
c3N3b3JkMSwgT1IocGFzc3dvcmQyLCBwY3IpKSwgSSBoYXZlIHdyaXR0ZW4KIHRoZSBmb2xsb3dp
bmcgc3RhdGVtZW50czo8YnI+CiZndDsgPGJyPgomZ3Q7ICZndDs8YnI+CiZndDsgPGJyPgomZ3Q7
ICZndDs8YnI+CiZndDsgPGJyPgomZ3Q7ICZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgIyBz
ZXNzaW9uIGZvciBhdXRoIGJhc2VkIG9uIHBjcjxicj4KJmd0OyA8YnI+CiZndDsgJmd0OyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyB0cG0yX3N0YXJ0YXV0aHNlc3Npb24gLVMgc2Vzc2lvbi5kYXQ8
YnI+CiZndDsgPGJyPgomZ3Q7ICZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgdHBtMl9wb2xp
Y3lwY3IgLVMgc2Vzc2lvbi5kYXQgLWwgJnF1b3Q7c2hhMjU2OjAsMSZxdW90OyAtTCBwb2xpY3ku
cGNyPGJyPgomZ3Q7IDxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHRwbTJf
Zmx1c2hjb250ZXh0IHNlc3Npb24uZGF0PGJyPgomZ3Q7IDxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7IHJtIHNlc3Npb24uZGF0PGJyPgomZ3Q7IDxicj4KJmd0OyAmZ3Q7PGJy
PgomZ3Q7IDxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICMgc2Vzc2lvbiBm
b3IgYXV0aCBiYXNlZCBvbiByZXNjdWUgcGFzc3dvcmQ8YnI+CiZndDsgPGJyPgomZ3Q7ICZndDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgdHBtMl9zdGFydGF1dGhzZXNzaW9uIC1TIHNlc3Npb24u
ZGF0PGJyPgomZ3Q7IDxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHRwbTJf
cG9saWN5cGFzc3dvcmQgLVMgc2Vzc2lvbi5kYXQgLUwgcG9saWN5LnJlc2N1ZTxicj4KJmd0OyA8
YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB0cG0yX2ZsdXNoY29udGV4dCBz
ZXNzaW9uLmRhdDxicj4KJmd0OyA8YnI+CiZndDsgJmd0Ozxicj4KJmd0OyA8YnI+CiZndDsgJmd0
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBybSBzZXNzaW9uLmRhdDxicj4KJmd0OyA8YnI+CiZn
dDsgJmd0Ozxicj4KJmd0OyA8YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAj
IGNvbXBvdW5kIGJvdGggcG9saWNpZXMgdXNpbmcgT1IgYW5kIHJlcXVpcmUgYWx3YXlzIHRoZSBw
YXNzd29yZDxicj4KJmd0OyA8YnI+CiZndDsgJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB0
cG0yX3N0YXJ0YXV0aHNlc3Npb24gLVMgc2Vzc2lvbi5kYXQ8YnI+CiZndDsgPGJyPgomZ3Q7ICZn
dDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgdHBtMl9wb2xpY3lvciAtUyBzZXNzaW9uLmRhdCAt
TCBwb2xpY3kuZGF0IHNoYTI1Njpwb2xpY3kucGNyLHBvbGljeS5yZXNjdWU8YnI+CiZndDsgPGJy
PgomZ3Q7ICZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgdHBtMl9wb2xpY3lwYXNzd29yZCAt
UyBzZXNzaW9uLmRhdCAtTCBwb2xpY3kuZGF0PGJyPgomZ3Q7IDxicj4KJmd0OyAmZ3Q7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7IHRwbTJfZmx1c2hjb250ZXh0IHNlc3Npb24uZGF0PGJyPgomZ3Q7
IDxicj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7IDxicj4KJmd0OyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7IHJtIHNlc3Npb24uZGF0PGJyPgomZ3Q7IDxicj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7IDxi
cj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7IDxicj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7IDxicj4KJmd0OyAm
Z3Q7IEkgdGhpbmsgdGhpcyBpcyBvaywgYnV0IHRoZW4uLiBJIGRvIG5vdCBzZWUgaG93IHRvIGlu
aXRpYWxpemUgdGhlIHBhc3N3b3JkIHBvbGljaWVzLiBJcyB0aGVyZSBhbnkgZXhhbXBsZSBzaW1p
bGFyIHRvIHdoYXQgSSB3YW50IHRvIGFjaGlldmU/PGJyPgomZ3Q7IDxicj4KJmd0OyAmZ3Q7PGJy
PgomZ3Q7IDxicj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7IDxicj4KJmd0OyAmZ3Q7IFRoYW5rIHlvdSE8
YnI+CiZndDsgPGJyPgomZ3Q7ICZndDs8YnI+CiZndDsgPGJyPgomZ3Q7ICZndDsgRmVsaXg8YnI+
CiZndDsgPGJyPgomZ3Q7ICZndDs8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+Cjxi
cj4KPGJyPgo8YnI+Cjxicj4KPC9kaXY+Cjwvc3Bhbj48L2ZvbnQ+PC9kaXY+CjwvYm9keT4KPC9o
dG1sPgo=

--===============0180400371392058412==--

