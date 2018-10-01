Content-Type: multipart/mixed; boundary="===============4888662813984223732=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: Re: [tpm2] best way to verify tpm is alive
Date: Mon, 01 Oct 2018 09:52:35 -0700
Message-ID: <16c13855-0fc7-a2e3-e9ed-8adbf42963af@intel.com>
In-Reply-To: 3ca4069b2e3846fdba7e1d5d201b7e55@AZDC-MMB02.GD-MS.US
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4888662813984223732==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/27/18 1:24 PM, Scheie, Peter M wrote:
> What is the best way to verify the TPM is available, that is, that it has=
n=E2=80=99t died?=C2=A0 I have a requirement to send an alert if the TPM st=
ops working.=C2=A0 We have snmp processes that run every five seconds, so I=
 figure I can, say, check for something in /sys/class/tpm/tpm0 and as long =
as I get an expected response, I=E2=80=99ll report that everything is fine.=
=C2=A0 But what exactly should I look for?=C2=A0 Is the simple presence of =
/sys/class/tpm/tpm0 sufficient, because it means the kernel thinks the TPM =
is there?=C2=A0 If I cat /sys/class/tpm/tpm0/dev I get the major and minor =
numbers; I could look at those, or just test for the presence of the dev fi=
le on the premise that if the TPM failed that file would disappear.=C2=A0 I=
s that a good test?=C2=A0 Suggestions?

I would say that the best test would be to send an actual command.
tpm2_get_random would be a good candidate. If the TPM responds
with a valid response it means that it is alive, if not it is dead.
The presence of the /sys/class/tpm/tpm0 file doesn't guarantee that
the TPM is still healthy.
Thanks,
-- =

Tadeusz

--===============4888662813984223732==--

