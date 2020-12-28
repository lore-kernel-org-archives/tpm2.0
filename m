Content-Type: multipart/mixed; boundary="===============2765256516030364035=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: TPM2 TSS on Android
Date: Mon, 28 Dec 2020 19:19:21 +0000
Message-ID: <SN6PR11MB343783C1E3DDAC606ACB29BCB8D90@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: AM6PR06MB494782617BEAAAA487C650D9A6DC0@AM6PR06MB4947.eurprd06.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2765256516030364035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The example Andreas shows is built using a "Blueprint" file. It was part of=
 the switch that occurred
to in-aosp-tree projects when they went to this Ninja Kata build system. Ho=
wever, AFAIK, the NDK
has stayed Make. So that example, won't really be a drop in for an NDK buil=
d. I can throw together
a proper Android.mk and add it to the project. We can probably setup a buil=
t in Github Actions for
it as well.

> -----Original Message-----
> From: Phani Srinivas <phani.srinivas(a)in.abb.com>
> Sent: Friday, December 25, 2020 1:37 AM
> To: Fuchs, Andreas <andreas.fuchs(a)sit.fraunhofer.de>; tpm2(a)lists.01.o=
rg
> Subject: [tpm2] Re: TPM2 TSS on Android
> =

> Hello Andreas,
> =

> =

> =

> Thank you for the links, will follow them and see if it works for us and
> =

> post on this forum the feedback.
> =

> =

> =

> Regards
> =

> Phani Srinivas S
> =

> =

> =

> From: Fuchs, Andreas <andreas.fuchs(a)sit.fraunhofer.de>
> Sent: Tuesday, December 22, 2020 4:18 PM
> To: Phani Srinivas <phani.srinivas(a)in.abb.com>; tpm2(a)lists.01.org
> Subject: RE: TPM2 TSS on Android
> =

> =

> =

> 	This email originated from outside of your organization. Please do not
> click on links or open attachments unless you recognize the sender and kn=
ow the
> content is safe.
> =

> =

> =

> In terms of calling the tss from java you might then want to look at tpm2=
-swig
> =

> for bindings: https://github.com/tpm2-software/tpm2-swig
> <https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith=
ub.c
> om%2Ftpm2-software%2Ftpm2-
> swig&data=3D04%7C01%7Cphani.srinivas%40in.abb.com%7C6846451297664907e5ba
> 08d8a6670c45%7C372ee9e09ce04033a64ac07073a91ecd%7C0%7C0%7C637442308
> 817499576%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l
> uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3DAVD9sR8I9jU7eRe9w6
> tUOgLJVLe%2Bz4Kpm5IAibUP9dc%3D&reserved=3D0>
> =

> =

> =

> Cheers,
> =

> Andreas
> =

> ________________________________
> =

> From: Florian.Schreiner(a)infineon.com <mailto:Florian.Schreiner(a)infine=
on.com>
> [Florian.Schreiner(a)infineon.com]
> Sent: Monday, December 21, 2020 12:04
> To: phani.srinivas(a)in.abb.com <mailto:phani.srinivas(a)in.abb.com> ;
> tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> Subject: [tpm2] Re: TPM2 TSS on Android
> =

> Hi Phani,
> =

> =

> =

> after a quick research, I have found the following:
> https://android.googlesource.com/platform/external/tpm2-tss/
> <https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fandr=
oid.
> googlesource.com%2Fplatform%2Fexternal%2Ftpm2-
> tss%2F&data=3D04%7C01%7Cphani.srinivas%40in.abb.com%7C6846451297664907e5
> ba08d8a6670c45%7C372ee9e09ce04033a64ac07073a91ecd%7C0%7C0%7C6374423
> 08817509567%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi
> V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3DUFmq4RNyalzYbG
> %2F1kopjBi98R%2BCTTZlWZcr12B38oAA%3D&reserved=3D0>
> =

> I would be curious to get to know if that fits to your request.
> =

> =

> =

> Best,
> =

> Florian
> =

> =

> =

> From: Phani Srinivas <phani.srinivas(a)in.abb.com
> <mailto:phani.srinivas(a)in.abb.com> >
> Sent: Samstag, 19. Dezember 2020 09:24
> To: tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> Subject: [tpm2] TPM2 TSS on Android
> =

> =

> =

> Caution: This e-mail originated outside Infineon Technologies. Do not cli=
ck on links
> or open attachments unless you validate it is safe
> <https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgoto=
.infi
> neon.com%2FSocialEngineering&data=3D04%7C01%7Cphani.srinivas%40in.abb.com
> %7C6846451297664907e5ba08d8a6670c45%7C372ee9e09ce04033a64ac07073a91e
> cd%7C0%7C0%7C637442308817509567%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi
> MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&s
> data=3DLRPYzyge%2F0biY%2F2sw75R5p0HDniEVH2qPEOSyyEn6KE%3D&reserved=3D0
> > .
> =

> =

> =

> Hello All,
> =

> =

> =

> We are trying to use  TPM2.0 on Android, would like to port TPM2 TSS on t=
o it,
> =

> could any of you suggest any tutorials on the NDK Build compilation of TP=
M2 TSS
> and relevant details to use TPM2 TSS on Android
> =

> =

> =

> Regards
> =

> Phani Srinivas S

--===============2765256516030364035==--

