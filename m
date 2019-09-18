Content-Type: multipart/mixed; boundary="===============6763405841645354072=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: Re: [tpm2] Incomplete TPM event log on Linux?
Date: Wed, 18 Sep 2019 13:18:54 -0700
Message-ID: <e115c94b-69ac-0290-9082-a1e978755dbc@intel.com>
In-Reply-To: CANKkrzGHbn3pF-K__ebsNBg2h4T--iMNrw+SAMPsE6-_TgV0iA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6763405841645354072==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/18/19 12:01 PM, Matthew Dempsky wrote:
> On Wed, Sep 18, 2019 at 11:33 AM Matthew Dempsky <matthew(a)dempsky.org <=
mailto:matthew(a)dempsky.org>> wrote:
> =

>     Yeah, Shim and the X1 Carbon's BIOS/EFI both seem like likely culprit=
s here. On the one hand, Shim is generating malformed event log entries <ht=
tps://github.com/rhboot/shim/issues/184>, but also the BIOS is incorrectly =
logging the "Calling UEFI Application from Boot Option" event to PCR[5] ins=
tead of PCR[4] (which was fixed upstream 2.5 years ago <https://github.com/=
tianocore/edk2/commit/c1b0828b3ba8fa203033ede0c3329c0d5573719e>).
> =

> =

> Seems like probably a Shim issue:=C2=A0https://github.com/rhboot/shim/iss=
ues/185=C2=A0

Probably not relevant anymore since you have narrowed it down to the shim,
but just to keep in mind that the IAM can also extend PCRs after boot if it=
 is enabled:
https://elixir.bootlin.com/linux/latest/source/security/integrity/ima/ima_q=
ueue.c#L194

Thanks,
-- =

Tadeusz

--===============6763405841645354072==--

