Content-Type: multipart/mixed; boundary="===============8039669272974968301=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] Re: tpm2-tss v2.4.0
Date: Fri, 13 Mar 2020 08:52:11 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0171ACE833@exch2010c.sit.fraunhofer.de>
In-Reply-To: bd7178a2-47c9-f244-ce72-fd987772223f@uvensys.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8039669272974968301==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

There's a bunch of manpages and the specs:
https://trustedcomputinggroup.org/wp-content/uploads/TSS_FAPI_v0.94_r04_pub=
rev.pdf
https://trustedcomputinggroup.org/wp-content/uploads/TSS_JSON_Policy_v0.7_r=
04_pubrev.pdf

Hope that helps,
Andreas
________________________________________
From: Steffen Schwebel [s.schwebel(a)uvensys.de]
Sent: Friday, March 13, 2020 09:50
To: tpm2(a)lists.01.org
Subject: [tpm2] Re: tpm2-tss v2.4.0

Hello,

thanks for your work on this.

Are they any informations avaible on the FAPI?
Ive often heard about it but dont really know anything about it.

Regards,
Steffen

On 3/12/20 12:05 AM, Tadeusz Struk wrote:
> Hello,
> After rather long rc cycle I'm happy to anounce that the final release
> of tpm2-tss v2.4.0 is out. It can be found here:
> https://github.com/tpm2-software/tpm2-tss/releases/tag/2.4.0
>
> The main change is the addition of the FAPI implementation.
> The release also comes with number of fixes and changes:
>
> Added
> - Added a new Feature API (FAPI) implementation
> - Added Esys_TRSess_GetAuthRequired() ESAPI function
> - Added Esys_TR_GetTpmHandle() SAPI function
> - Added Esys_GetSysContext() SAPI function
> - Added the with-sanitizer configure option
> - Added CI for FreeBSD
>
> Changed
> - Changed MSSIM TCTI to be async capable
> - Removed TCTI loaders from ESYS dependencies in pkg-config
> - Changed getPollHandles to allow num_handles query
> - Improved CI builds
> - Converted builds to docker builds
> - Number of fixes and improvements in the test code
> - Changed tcti-device in non-async mode to allways block
>
> Fixed
> - Fixed hmac calculation for tpm2_clear command in ESAPI
> - Fixed mixing salted and unsalted sessions in the same ESAPI context
> - Removed use of VLAs from TPML marshal code
> - Fixed setting C++ compiler for non-fuzzing builds at configure
> - Fixed setting the name of session objects
> - Fixed page alignment errors in Sys_Get/SetAuths functions
> - Fixed potential buffer overflow in tcti_mssim_receive
> - Fixed invalid memory alloc failure in Tss2_TctiLdr_Initialize
> - Fixed list of exported symbols map for libtss2-mu
> - Fixed resource name calculation in Esys_CreateLoaded
> - Fixed keysize of ECC curve TPM2_ECC_NISTP224
> - Fixed segmentation fault in tctildr if name_conf was too big
> - Fixed memory leak in tctildr-tcti tests
> - Fixed HMAC generation for policy sessions
> - Added check for object node before calling compute_session_value functi=
on
> - Fixed auth calculation in Esys_StartAuthSession called with optional
> parameters
> - Fixed compute_encrypted_salt error handling in Esys_StartAuthSession
> - Fixed exported symbols map for libtss2-mu
>
>
> Thanks,
> --
> Tadeusz
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--
Steffen Schwebel
Mail: s.schwebel(a)uvensys.de
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============8039669272974968301==--

