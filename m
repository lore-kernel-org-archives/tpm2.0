Content-Type: multipart/mixed; boundary="===============7972571549439679668=="
MIME-Version: 1.0
From: =?utf-8?q?Max_Halld=C3=A9n_=3Cmax=2Ehallden_at_wisi=2Ese=3E?=
Subject: [tpm2] Re: unique identifier
Date: Wed, 30 Oct 2019 15:33:45 +0000
Message-ID: <156b0cca-d175-ce67-359b-bb12a39099be@wisi.se>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E2DF10@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7972571549439679668==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I use the the resource manager in Linux via the /dev/tpmrm0 device.

I looked at tpm2_getcap commands and it doesn't list ChangeEPS so it
definitely makes sense that it throws that error.

Yeah, I didn't realize at all that there were major optional parts, it
is definitely a surprise to me. So thanks for the tip about
tpm2_getcap commands, that helps a lot :)

Regards
Max

On 2019-10-30 14:22, Roberts, William C wrote:
> The TSS supports it. If you look at the return code:
>
> ERROR: Esys_ChangeEPS(0xB0143) - rmt:error(2.0): command code not
> supported
>
> The "rmt" portion is the layer that the return code was sent from.
> Looks like the resource manager detected that the command isn't
> supported and issued an error.  I know for tpm2-abrmd it works with
> the simulator, so perhaps abrmd has this logic in it. =

>
> Which resource manager are you using?
>
> So if you get a TPM that rejects this command, you can look in tpm2_getca=
p commands
> For a list of supported commands, then you know that in fact your epSeed =
is fixed and
> Non-changeable and that EC is a unique identifier. If the command exists,=
 well... then it
> Is likely to be unique but not guaranteed.
>
> Somewhere in the spec is the list of commands indicating which are option=
al and which are required,
> I would guess almost no manufacturers are implementing this interface. Bu=
t I have no empirical
> evidence to assert that claim, just a hunch.
>
> This is what can make the TPM such a pain at times, is this optional stuf=
f, there are vast differences
> in resources and capabilities.
>
> Bill
>
>
>> -----Original Message-----
>> From: Max Halld=C3=A9n [mailto:max.hallden(a)wisi.se]
>> Sent: Wednesday, October 30, 2019 3:21 AM
>> To: Roberts, William C <william.c.roberts(a)intel.com>; Ian Oliver
>> <ian.justin.oliver(a)gmail.com>
>> Cc: tpm2(a)lists.01.org
>> Subject: Re: [tpm2] Re: unique identifier
>>
>> Thank you for your answers!
>>
>> It sounds like I might be looking elsewhere for some kind of platform id=
entifier.
>> Although I'm sure EK or similar would work since we won't change any see=
ds, it is
>> nice to be able to say that it can't ever change or be removed.
>>
>> The idea that TPM manufacturers might block the changeEPS command is
>> interesting though and when I tested this for my Infineon TPM I got this:
>>
>> root@(none):~# tpm2_changeeps --tcti=3Ddevice:/dev/tpmrm0
>> WARNING:esys:../tpm2-tss-2.3.1/src/tss2-
>> esys/api/Esys_ChangeEPS.c:283:Esys_ChangeEPS_Finish()
>> Received TPM Error
>> ERROR:esys:../tpm2-tss-2.3.1/src/tss2-
>> esys/api/Esys_ChangeEPS.c:98:Esys_ChangeEPS()
>> Esys Finish ErrorCode (0x000b0143)
>> ERROR: Esys_ChangeEPS(0xB0143) - rmt:error(2.0): command code not
>> supported
>>
>> Granted, I did a quick update from tpm2-tools 4.0 to master to get suppo=
rt for
>> that specific command, so it might be tss or something that doesn't supp=
ort it.
>> But that looks like the TPM is not supporting it to me.
>>
>> Regards
>> Max
>>
>> On 2019-10-29 22:46, Roberts, William C wrote:
>>> Section 14.3.2 of the architecture doc is relevant:
>>> https://trustedcomputinggroup.org/wp-content/uploads/TPM-Rev-2.0-Part-
>>> 1-Architecture-01.38.pdf
>>>
>>> While it's safe to say that most of the time the manufacturers key
>>> could be the identifier, it's not guaranteed to always be there if
>>> someone rolls the epSeed. If someone does that, they'd be throwing away=
 the
>> manufacturers claims of its authenticity and ensuring they remain anonym=
ous.
>>> So be careful with that command! I wonder if TPM manufacturers are allo=
wed
>> to, or do block that command.
>>>> -----Original Message-----
>>>> From: Ian Oliver [mailto:ian.justin.oliver(a)gmail.com]
>>>> Sent: Tuesday, October 29, 2019 2:50 PM
>>>> To: Roberts, William C <william.c.roberts(a)intel.com>
>>>> Cc: tpm2(a)lists.01.org
>>>> Subject: Re: [tpm2] Re: unique identifier
>>>>
>>>> Thanks - will take a look with the particular TPMs we're using
>>>>
>>>> t.
>>>>
>>>> Ian
>>>>
>>>>
>>>> On Tue, 29 Oct 2019 at 20:37, Roberts, William C
>>>> <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com> =
> wrote:
>>>>
>>>>
>>>> 	Forgot "to be changed" in my sentence... one of those days.
>>>>
>>>> 	> -----Original Message-----
>>>> 	> From: Roberts, William C [mailto:william.c.roberts(a)intel.com
>>>> <mailto:william.c.roberts(a)intel.com> ]
>>>> 	> Sent: Tuesday, October 29, 2019 1:36 PM
>>>> 	> To: Ian Oliver <ian.justin.oliver(a)gmail.com
>>>> <mailto:ian.justin.oliver(a)gmail.com> >
>>>> 	> Cc: tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
>>>> 	> Subject: [tpm2] Re: unique identifier
>>>> 	>
>>>> 	The TPM allows the seed to be changed on the 3 non-volatile
>>>> hierarchy
>>>> seeds:
>>>> 	>
>>>> 	> TPM2_ChangeEPS - endorsement seed
>>>> 	> TPM2_ChangePPS - platform seed
>>>> 	> TPM2_Clear - Storage "Owner" seed
>>>> 	>
>>>> 	> Null changes on every tpm boot.
>>>> 	>
>>>> 	> > -----Original Message-----
>>>> 	> > From: Ian Oliver [mailto:ian.justin.oliver(a)gmail.com
>>>> <mailto:ian.justin.oliver(a)gmail.com> ]
>>>> 	> > Sent: Tuesday, October 29, 2019 11:59 AM
>>>> 	> > To: Roberts, William C <william.c.roberts(a)intel.com
>>>> <mailto:william.c.roberts(a)intel.com> >
>>>> 	> > Cc: Max Halld=C3=A9n <max.hallden(a)wisi.se
>>>> <mailto:max.hallden(a)wisi.se> >; tpm2(a)lists.01.org
>> <mailto:tpm2(a)lists.01.org>
>>>> 	> > Subject: Re: [tpm2] Re: unique identifier
>>>> 	> >
>>>> 	> > IIRC the EK is generated from a seed unique to each TPM and typic=
ally
>>>> 	> > implemented as a set of fuses blown at manufacturing time. So the=
 EK
>>>> 	> > can be generated in a predictable manner and therefore the
>>>> EK_public
>>>> 	> > can act as an identifier for that TPM.
>>>> 	> >
>>>> 	> >
>>>> 	> > The privacy aspect applies to the AK as far as I recall reading, =
but
>>>> 	> > the notion of privacy here is rather tenuous anyway.
>>>> 	> >
>>>> 	> > At least in our work, the EK and AK have proven robust enough to =
be
>>>> 	> > used as permanent identifiers
>>>> 	> >
>>>> 	> >
>>>> 	> > Ian
>>>> 	> >
>>>> 	> >
>>>> 	> > On Tue, 29 Oct 2019 at 18:40, Roberts, William C
>>>> 	> > <william.c.roberts(a)intel.com
>>>> <mailto:william.c.roberts(a)intel.com>
>>>> <mailto:william.c.roberts(a)intel.com
>>>> <mailto:william.c.roberts(a)intel.com> > >
>>>> wrote:
>>>> 	> >
>>>> 	> >
>>>> 	> >     I think that's intentional by design due to privacy concerns.
>>>> 	> >
>>>> 	> >     > -----Original Message-----
>>>> 	> >     > From: Max Halld=C3=A9n [mailto:max.hallden(a)wisi.se
>>>> <mailto:max.hallden(a)wisi.se>
>>>> 	> > <mailto:max.hallden(a)wisi.se <mailto:max.hallden(a)wisi.se> > ]
>>>> 	> >     > Sent: Tuesday, October 29, 2019 9:58 AM
>>>> 	> >     > To: tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
>>>> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
>>>> 	> >     > Subject: [tpm2] unique identifier
>>>> 	> >     >
>>>> 	> >     > Hi all,
>>>> 	> >     >
>>>> 	> >     > I'm looking for some kind of unique identifier for the tpm =
that
>>>> 	> > can't be cleared.
>>>> 	> >     > AFAICT the TPM2 standard doesn't contain anything like this=
? The
>>>> 	> > closest thing is
>>>> 	> >     > the EK I guess, but even that can be cleared.
>>>> 	> >     >
>>>> 	> >     > Regards,
>>>> 	> >     > Max
>>>> 	> >     >
>>>> 	> >     > _______________________________________________
>>>> 	> >     > tpm2 mailing list -- tpm2(a)lists.01.org <mailto:tpm2(a)lis=
ts.01.org>
>>>> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
>>>> 	> >     > To unsubscribe send an email to tpm2-leave(a)lists.01.org
>>>> <mailto:tpm2-leave(a)lists.01.org>
>>>> 	> > <mailto:tpm2- <mailto:tpm2->  leave(a)lists.01.org
>>>> <mailto:leave(a)lists.01.org> >
>>>> 	> >     > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>>>> 	> >     _______________________________________________
>>>> 	> >     tpm2 mailing list -- tpm2(a)lists.01.org <mailto:tpm2(a)lists=
.01.org>
>>>> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
>>>> 	> >     To unsubscribe send an email to tpm2-leave(a)lists.01.org
>>>> <mailto:tpm2-leave(a)lists.01.org>  <mailto:tpm2- <mailto:tpm2->
>>>> 	> > leave(a)lists.01.org <mailto:leave(a)lists.01.org> >
>>>> 	> >     %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>>>> 	> >
>>>> 	>
>>>> 	> _______________________________________________
>>>> 	> tpm2 mailing list -- tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.or=
g>
>>>> 	> To unsubscribe send an email to tpm2-leave(a)lists.01.org
>>>> <mailto:tpm2- leave(a)lists.01.org>
>>>> 	> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>>>>
>>> _______________________________________________
>>> tpm2 mailing list -- tpm2(a)lists.01.org To unsubscribe send an email to
>>> tpm2-leave(a)lists.01.org
>>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s



--===============7972571549439679668==--

