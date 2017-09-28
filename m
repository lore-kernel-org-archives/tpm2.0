Content-Type: multipart/mixed; boundary="===============0711029490875223657=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] List supported EC curves
Date: Thu, 28 Sep 2017 17:13:13 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC563EAF2D37@ORSMSX103.amr.corp.intel.com>
In-Reply-To: a22561d5-aee3-7599-0252-8fe6ab44fa6c@advancedtelematic.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0711029490875223657==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thank you, we merged your PR for this recently: https://github.com/01org/tp=
m2-tools/pull/530

From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Anton Gerasimov
Sent: Wednesday, September 27, 2017 10:12 AM
To: tpm2(a)lists.01.org
Subject: Re: [tpm2] List supported EC curves

On 09/27/2017 05:38 PM, Anton Gerasimov wrote:
Greetings,
is there a way to display list of supported elliptic curves in a TPM device=
? There should a TPM_CAP_ECC_CURVES field for it, but I couldn't find how t=
o extract it (or just raw dump of capabilities) with tpm2-tools.
Thanks,
Anton Gerasimov
Sorry, I've got the principle. I've made a patch in my working directory, i=
f someone thinks it can be useful I can compose a proper PR.
Thanks,
Anton Gerasimov

--===============0711029490875223657==--

