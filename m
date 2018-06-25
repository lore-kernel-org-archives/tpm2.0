Content-Type: multipart/mixed; boundary="===============6680610808490379125=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: Re: [tpm2] What is the exact meaning of "parameters" in cpHash?
Date: Mon, 25 Jun 2018 10:25:18 -0700
Message-ID: <190b50ad-e593-f2a8-af6f-6cc24e494ee3@intel.com>
In-Reply-To: BLUPR01MB227607224352A2C8DCC23DE854A0@BLUPR01MB227.prod.exchangelabs.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6680610808490379125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/25/2018 10:06 AM, Tianyu Qi wrote:
> Hi,=C2=A0
> =

> =

> I am writing implementation of TPM2_Load.=C2=A0When writing cpHash=C2=A0i=
n computing HMAC,=C2=A0I saw cpHash description in=C2=A0TPM-Rev-2.0-Part-1-=
Architecture-01.38 mentioned=C2=A0there is a "parameters" parameter at last=
, which represents remaining command parameters. Since the cpHash will use =
commandCode as the first parameter, does this "parameters" means every para=
meter in the command? For example, in TPM2_Load, I need to add tag, command=
Size, parentHandle, inPublic=C2=A0and inPrivate? If so, should I add the au=
thorization structure after parentHandle?
> =


Hi Tianyu,
What the spec [1] refers to as parameters is all that comes after the Autho=
rization area.
See the section 18 of [1].
Yes, the authorization area comes after the handlers and before the paramet=
ers.

[1] https://trustedcomputinggroup.org/wp-content/uploads/TPM-Rev-2.0-Part-1=
-Architecture-01.16.pdf

-- =

Tadeusz

--===============6680610808490379125==--

