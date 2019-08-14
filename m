Content-Type: multipart/mixed; boundary="===============5511846513005350151=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: Re: [tpm2] Question about SPI encryption
Date: Wed, 14 Aug 2019 13:03:38 -0700
Message-ID: <f965b5a9-b367-0e98-2455-02a0a47abca4@intel.com>
In-Reply-To: BN7PR03MB44985D6CE2F94FA02831B9B0E6AD0@BN7PR03MB4498.namprd03.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5511846513005350151==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello James,
On 8/14/19 11:56 AM, Gallagher, James wrote:
> Hello,
> Supposing I was using a TPM that is connected to its host device via the =
SPI bus, would it be possible to encrypt all communication over that bus. I=
 recently read the TPMgeany papers, linked here:=C2=A0https://github.com/nc=
cgroup/TPMGenie=C2=A0in which a man-in-the-middle attack could be used to s=
poof packets to and from the TPM.
> I was curious if The ESAPI, SAPI or something else could be used to encry=
pt communication over the SPI bus to mitigate these vulnerabilities.=C2=A0

There is nothing it the TPM software stack that will allow all communicatio=
n to be encrypted,
however some commands support sensitive parameters in requests and/or respo=
nses to be encrypted
using a TPM session key. Have a look at section 21. "Session-based encrypti=
on" of the spec[1]
This will prevent sniffing TPM communication. An HMAC session can be used t=
o prevent packet spoofing.

[1] https://www.trustedcomputinggroup.org/wp-content/uploads/TPM-Rev-2.0-Pa=
rt-1-Architecture-01.38.pdf
-- =

Tadeusz



--===============5511846513005350151==--

