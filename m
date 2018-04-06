Content-Type: multipart/mixed; boundary="===============5566434955401290663=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: Re: [tpm2] SLB 9670 TPM 2.0 device,
 How many keys I can store inside TPM as persistent
Date: Fri, 06 Apr 2018 12:11:37 -0700
Message-ID: <feadfac9-bb65-964e-2584-46ccee79c241@intel.com>
In-Reply-To: e6f127d2-576d-274f-817b-fe731304814e@mikronika.pl
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5566434955401290663==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 04/05/2018 10:49 PM, Tomasz Przybysz wrote:
> #define=C2=A0=C2=A0=C2=A0 TPM_PT_HR_PERSISTENT_MIN=C2=A0=C2=A0=C2=A0 (PT_=
FIXED + 15 )=C2=A0=C2=A0=C2=A0 =C2=A0/* the minimum number of persistent ob=
jects that can be held in TPM NV memoryNOTE=C2=A0=C2=A0=C2=A0 This minimum =
shall be no less than the minimum value required by the platformspecific sp=
ecification to which the TPM is built.=C2=A0 */
> =

> I don't uderstand. So what is max capacity of this device ?

The maximum capacity of the device is limited only by the amount of the NV =
memory in the chip, which for this chip is 7KB as far as I can see.

> *
> Up to 7 loaded persistent Objects***for my understandig it's max capacity=
. But why this parameter is called *TPM_PT_HR_PERSISTENT_MIN* ?
> vs
> "the minimum number of persistent objects that can be held in TPM NV memo=
ry"
> =

> So is it min or max ?

It's min. The spec defines some minimums in order to ensure proper operatio=
n.
See section 41. "Minimums" in https://trustedcomputinggroup.org/wp-content/=
uploads/TPM-Rev-2.0-Part-1-Architecture-01.16.pdf
The chip vendor can define other minimums, not less than the minimums speci=
fied by the spec.
Put in other words. This tells you what is the minimum number of persistent=
 objects a TPM needs to support to be able to support all TPM command imple=
mented by the given TPM chip.

> =

> What does 'loaded persistent' mean=C2=A0 ? As I know persistent key is al=
ways loaded.
> When I want to use persistent key I don't need load it.

Right, you don't need to load a persistent key, assuming it wasn't evicted =
by tpm2_evictcontrol tool.
For more info see section 37.3 "Owner and Platform Evict Objects" from the =
spec above.

Hope that helps.
-- =

Tadeusz

--===============5566434955401290663==--

