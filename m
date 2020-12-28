Content-Type: multipart/mixed; boundary="===============2622775750310167470=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: TPM2 TSS on Android
Date: Mon, 28 Dec 2020 20:48:01 +0000
Message-ID: <SN6PR11MB343795E940B82F00B1D0E60AB8D90@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: SN6PR11MB3437AABDE8F745AA35EBCAFCB8D90@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2622775750310167470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

But I guess all my ramblings about NDK builds are pointless, because unless=
 something has changed,
You won't have access to the TPM chip anyways from applications.

> -----Original Message-----
> From: Roberts, William C
> Sent: Monday, December 28, 2020 2:19 PM
> To: 'Phani Srinivas' <phani.srinivas(a)in.abb.com>; 'Fuchs, Andreas'
> <andreas.fuchs(a)sit.fraunhofer.de>; 'tpm2(a)lists.01.org' <tpm2(a)lists.=
01.org>
> Subject: RE: TPM2 TSS on Android
> =

> There are some other things to be aware of here. The first being that And=
roid-
> NDK has pretty clean And documented integration now with autoconf project=
s,
> so it's pretty simple to build the:
>   - tss2-sys
>   - tss2-tcti-*
>   - tss2-tctildr
>   - tss2-mu
>   - tss2-rc
> =

> Libraries by following the section on autoconf:
> https://developer.android.com/ndk/guides/other_build_systems#autoconf
> =

> Then configuring the project like so:
> ./configure --host=3D$TARGET --disable-esys --disable-fapi
> =

> make -j$(nproc)
> <snip>
>   CCLD     libutil.la
>   CCLD     src/tss2-mu/libtss2-mu.la
>   CCLD     src/tss2-tcti/libtss2-tctildr.la
>   CCLD     src/tss2-rc/libtss2-rc.la
>   CCLD     src/tss2-tcti/libtss2-tcti-device.la
>   CCLD     src/tss2-tcti/libtss2-tcti-swtpm.la
>   CCLD     src/tss2-tcti/libtss2-tcti-pcap.la
>   CCLD     src/tss2-tcti/libtss2-tcti-mssim.la
>   CCLD     src/tss2-tcti/libtss2-tcti-cmd.la
>   CCLD     src/tss2-sys/libtss2-sys.la
> =

> readelf -h ./src/tss2-sys/.libs/libtss2-sys.so | grep -i Machine
>   Machine:                           AArch64
> =

> You can download the NDK from here:
> https://developer.android.com/ndk/downloads
> =

> It get's tricky in that in order to use the ESYS or FAPI libraries, you n=
eed to satisfy
> the openssl dependency.
> For Android in-tree, they have Boring OSSL and are carrying patches on our
> project for integrating with Boring SSL.
> =

> For mainline, you can build OSSL against the NDK and then configure tpm2-=
tss
> project using normal autoconf idioms to use that OSSL:
> https://wiki.openssl.org/index.php/Android
> =

> You would set CFLAGS and LDFLAGS to point to the needed include dirs and
> library paths for OSSL, something Like what is mentioned in the " Install=
 the
> OpenSSL Library" and " Compile and Link against the Library" in The
> aforementioned OpenSSL Android instructions link.
> =

> > -----Original Message-----
> > From: Roberts, William C
> > Sent: Monday, December 28, 2020 1:19 PM
> > To: Phani Srinivas <phani.srinivas(a)in.abb.com>; Fuchs, Andreas
> > <andreas.fuchs(a)sit.fraunhofer.de>; tpm2(a)lists.01.org
> > Subject: RE: TPM2 TSS on Android
> >
> > The example Andreas shows is built using a "Blueprint" file. It was
> > part of the switch that occurred to in-aosp-tree projects when they
> > went to this Ninja Kata build system. However, AFAIK, the NDK has
> > stayed Make. So that example, won't really be a drop in for an NDK
> > build. I can throw together a proper Android.mk and add it to the
> > project. We can probably setup a built in Github Actions for it as well.
> >
> > > -----Original Message-----
> > > From: Phani Srinivas <phani.srinivas(a)in.abb.com>
> > > Sent: Friday, December 25, 2020 1:37 AM
> > > To: Fuchs, Andreas <andreas.fuchs(a)sit.fraunhofer.de>;
> > > tpm2(a)lists.01.org
> > > Subject: [tpm2] Re: TPM2 TSS on Android
> > >
> > > Hello Andreas,
> > >
> > >
> > >
> > > Thank you for the links, will follow them and see if it works for us
> > > and
> > >
> > > post on this forum the feedback.
> > >
> > >
> > >
> > > Regards
> > >
> > > Phani Srinivas S
> > >
> > >
> > >
> > > From: Fuchs, Andreas <andreas.fuchs(a)sit.fraunhofer.de>
> > > Sent: Tuesday, December 22, 2020 4:18 PM
> > > To: Phani Srinivas <phani.srinivas(a)in.abb.com>; tpm2(a)lists.01.org
> > > Subject: RE: TPM2 TSS on Android
> > >
> > >
> > >
> > > 	This email originated from outside of your organization. Please do
> > > not click on links or open attachments unless you recognize the
> > > sender and know the content is safe.
> > >
> > >
> > >
> > > In terms of calling the tss from java you might then want to look at
> > > tpm2-swig
> > >
> > > for bindings: https://github.com/tpm2-software/tpm2-swig
> > > <https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg
> > > it
> > > hub.c
> > > om%2Ftpm2-software%2Ftpm2-
> > >
> >
> swig&data=3D04%7C01%7Cphani.srinivas%40in.abb.com%7C6846451297664907e5ba
> > >
> >
> 08d8a6670c45%7C372ee9e09ce04033a64ac07073a91ecd%7C0%7C0%7C637442308
> > >
> >
> 817499576%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l
> > >
> >
> uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3DAVD9sR8I9jU7eRe9w6
> > > tUOgLJVLe%2Bz4Kpm5IAibUP9dc%3D&reserved=3D0>
> > >
> > >
> > >
> > > Cheers,
> > >
> > > Andreas
> > >
> > > ________________________________
> > >
> > > From: Florian.Schreiner(a)infineon.com
> > > <mailto:Florian.Schreiner(a)infineon.com>
> > > [Florian.Schreiner(a)infineon.com]
> > > Sent: Monday, December 21, 2020 12:04
> > > To: phani.srinivas(a)in.abb.com <mailto:phani.srinivas(a)in.abb.com> ;
> > > tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> > > Subject: [tpm2] Re: TPM2 TSS on Android
> > >
> > > Hi Phani,
> > >
> > >
> > >
> > > after a quick research, I have found the following:
> > > https://android.googlesource.com/platform/external/tpm2-tss/
> > >
> >
> <https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fandr=
oid.
> > > googlesource.com%2Fplatform%2Fexternal%2Ftpm2-
> > >
> >
> tss%2F&data=3D04%7C01%7Cphani.srinivas%40in.abb.com%7C6846451297664907e5
> > >
> >
> ba08d8a6670c45%7C372ee9e09ce04033a64ac07073a91ecd%7C0%7C0%7C6374423
> > >
> >
> 08817509567%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi
> > >
> >
> V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3DUFmq4RNyalzYbG
> > > %2F1kopjBi98R%2BCTTZlWZcr12B38oAA%3D&reserved=3D0>
> > >
> > > I would be curious to get to know if that fits to your request.
> > >
> > >
> > >
> > > Best,
> > >
> > > Florian
> > >
> > >
> > >
> > > From: Phani Srinivas <phani.srinivas(a)in.abb.com
> > > <mailto:phani.srinivas(a)in.abb.com> >
> > > Sent: Samstag, 19. Dezember 2020 09:24
> > > To: tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> > > Subject: [tpm2] TPM2 TSS on Android
> > >
> > >
> > >
> > > Caution: This e-mail originated outside Infineon Technologies. Do
> > > not click on links or open attachments unless you validate it is
> > > safe
> > > <https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg
> > > ot
> > > o.infi
> > > neon.com%2FSocialEngineering&data=3D04%7C01%7Cphani.srinivas%40in.abb.
> > > co
> > > m
> >
> %7C6846451297664907e5ba08d8a6670c45%7C372ee9e09ce04033a64ac07073a91e
> > >
> >
> cd%7C0%7C0%7C637442308817509567%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi
> > >
> >
> MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&s
> > >
> >
> data=3DLRPYzyge%2F0biY%2F2sw75R5p0HDniEVH2qPEOSyyEn6KE%3D&reserved=3D0
> > > > .
> > >
> > >
> > >
> > > Hello All,
> > >
> > >
> > >
> > > We are trying to use  TPM2.0 on Android, would like to port TPM2 TSS
> > > on to it,
> > >
> > > could any of you suggest any tutorials on the NDK Build compilation
> > > of
> > > TPM2 TSS and relevant details to use TPM2 TSS on Android
> > >
> > >
> > >
> > > Regards
> > >
> > > Phani Srinivas S

--===============2622775750310167470==--

