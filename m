Content-Type: multipart/mixed; boundary="===============7557610057720008186=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: Re: [tpm2] Putting a persistant string into the tpm2 using tpm2_tools.
Date: Fri, 20 Sep 2019 09:29:17 -0700
Message-ID: <14285882-804e-1b18-7a5a-fe77a051401f@intel.com>
In-Reply-To: 62b22807-115d-444b-af44-b1c0ab16daf9@www.fastmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7557610057720008186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/20/19 7:34 AM, Trey Weaver wrote:
> I want to put a small string into the TPM2 and be able to recall it over =
restarts.=C2=A0 Here is what I have tried:

To make an object persistent you need to use tpm2_evictcontrol command.

After step:
$ tpm2_load -C primary.ctx -u obj.pub -r obj.priv -c key.ctx

try:
$ tpm2_evictcontrol -C o -c key.ctx

-- =

Tadeusz

--===============7557610057720008186==--

