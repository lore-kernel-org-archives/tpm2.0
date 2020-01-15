Content-Type: multipart/mixed; boundary="===============6603843882579762225=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: some questions about Identity
Date: Wed, 15 Jan 2020 18:18:59 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E66C9D@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20200115171713.2574.28120@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6603843882579762225==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: nicolasoliver03(a)gmail.com [mailto:nicolasoliver03(a)gmail.com]
> Sent: Wednesday, January 15, 2020 11:17 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Re: some questions about Identity
> =

> About tpm2_getekcertificate, I executed it agains https://ekop.intel.com/=
ekcert
> (hope it is the correct one):
> =

> tpm2_createek -G rsa -u ek.pub -c key.ctx tpm2_getekcertificate -X -o ECc=
ert.bin
> -u ek.pub https://ekop.intel.com/ekcert
> =

> Output:
> =

> WARN: TLS communication with the said TPM manufacturer server setup with
> SSL_NO_VERIFY!
> ERROR: Cannot proceed. For further information please refer to:
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-
> 00086.html. Recovery tools are located here:https://github.com/intel/INTE=
L-SA-
> 00086-Linux-Recovery-Tools
> ERROR: Unable to run tpm2_getekcertificate
> =

> Is that expected?

I think so, came in:

commit 0df61fcb928e6cf762b08e37312d70edd5f539ec
Author: Imran Desai <imran.desai(a)intel.com>
Date:   Tue Aug 6 12:06:18 2019 -0700

    tpm2_getekcertificate: Parses tpm manufacturers for unique issues
    =

    1. If the TPM manufacturer is the IBM simulator, error out since the
       simulator endorsement keys aren't certified by IBM.
    2. If the TPM manufacturer is Intel aka the the TPM2 device is PTT,
       also if the tpmGeneratedEPS bit is set it implies that the soc
       or pch has a firmware that has mitigations for Intel security
       advisory SA-00086. And so another utility must be used to retrieve
       the endorsement key certificate. More information on the advisory:
       https://www.intel.com/content/www/us/en/security-center/advisory/int=
el-sa-00086.html
       The alternative utility and the instructions can be found here:
       https://github.com/intel/INTEL-SA-00086-Linux-Recovery-Tools.
---

Looks like there's another way to get the EK cert. I wonder if we could pul=
l that logic in over erroring
out. Looking at that repo it looks like the functionality is not trivial to=
 implement.

Imran, Can you clarify?

Thanks,
Bill


> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============6603843882579762225==--

