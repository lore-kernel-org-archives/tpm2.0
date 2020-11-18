Content-Type: multipart/mixed; boundary="===============4629496472736002374=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: tpm2_getekcertificate: certificate not found on Infineon
 SLB 9670
Date: Wed, 18 Nov 2020 20:53:12 +0000
Message-ID: <SN6PR11MB34377E077B4739794A1DC28DB8E10@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: 20201118192015.2865.73157@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4629496472736002374==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: nicolasoliver03(a)gmail.com <nicolasoliver03(a)gmail.com>
> Sent: Wednesday, November 18, 2020 1:20 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] tpm2_getekcertificate: certificate not found on Infineon =
SLB 9670
> =

> Hello,
> =

> I had some problems getting the Endorsement Key Certificate on a server u=
sing a
> TPM 2.0 Infineon SLB 9670.
> Version of the TPM2 Tools are 4.3 tagged release, compiled from source.
> The TPM seems to have the cert in the expected handle (0x1C00002 RSA,
> 0x1C0000a ECC)
> =

> $ tpm2_getcap handles-nv-index
> - 0x1C00002
> - 0x1C0000A
> =

> I initially tried to get that with the tpm2_getekcertificate, but when I =
run the tool,
> it returns an exit code 0, and a string saying that the cert could not be=
 found
> =

> $ tpm2_createek -G rsa -u ek.pub -c key.ctx $ ls ek.pub  key.ctx
> =

> $ tpm2_getekcertificate -u ek.pub
> Certificate not found
> =

> $ echo $?
> 0
> =

> Then, I executed the tool with --verbose mode, and I saw that is trying t=
o pull the
> cert from ekop.intel.com.
> I could not find the url for Infineon.
> =

> Later, I found this post https://www.infineonforums.com/threads/6044-Opti=
ga-
> Endorsement-Credential-Certificate-%28tpm2_getmanufec-URL%29
> and I could use that to retrieve the cert from the handle:
> =

> $ tpm2_nvread 0x1c00002 > nvread.1c00002.crt
> $ tpm2_nvread 0x1c0000a > nvread.1c0000a.crt
> =

> So, a couple of questions and comments:
> =

> 1. I noticed that the latest master tpm2_getekcertificate man page specif=
ies that
> it will fetch the cert from the nvindex now. So, with the next release, g=
etting the
> nvindex cert with tpm2_getekcertificate should work right? Also, is this =
version
> returning non 0 exit code if the cert was not found?

Yes the commit with that feature is on tag 5.0
$ git tag --contains e7e95b5dea110
5.0
5.0-rc0

As far as it returning non-zero, it appears so looking through the code, bu=
t I didn't test that.
@Desai, Imran do you know about the return-code?
(Wow I did an @ and a name and outlook popped up my contacts AND added them=
 to the to line, amazing)

> 2. Does Infineon provides a server for fetching the EK Cert? Having that =
service is
> important if you are doing bulk operations over several servers.

I don't think so, @andreas.fuchs(a)sit.fraunhofer.de might know.

> =

> It took some time to get this figured out for us, so I think any help fut=
ure users
> can get in the UX of using this tools is valuable!
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============4629496472736002374==--

