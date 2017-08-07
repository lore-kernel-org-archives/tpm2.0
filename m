Content-Type: multipart/mixed; boundary="===============6622931479842897479=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] How to use PolicyAuthorize for flexiable PCR policy?
Date: Tue, 08 Aug 2017 01:34:55 +0200
Message-ID: <240151b1-8a09-7b97-a296-6874ba9decae@redhat.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC563EAABF28@ORSMSX103.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6622931479842897479==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Kh=C3=A1nh,

On 08/07/2017 07:16 PM, Roberts, William C wrote:> Sorry for top posting, I=
 need to configure my email client still.
> =

> The problem with the tools right now, is that the policy sessions are get=
ting destroyed when the command exits
> when you use the resource manager. The resource manager always flushes th=
e TPM when a client exists.
> =

> You have three choices at the moment:
> 1. use /dev/tpm0 directly, which means no other clients can be using the =
TPM at that time.
> 2. Patch the tools to be able to set up simple pcr policy sessions, like =
tpm2_unseal. This is currently issue https://github.com/01org/tpm2-tools/is=
sues/348

To elaborate on Bill's comment, you can take a look to the following issue =
that
mentioned the same problem on the tpm2_unseal tool and has references to the
commits used to add support for authentication using a PCR policy session:

https://github.com/01org/tpm2-tools/issues/313
https://github.com/01org/tpm2-tools/pull/354
https://github.com/01org/tpm2-tools/pull/365

If you decide to go (2), then you need to implement something similar to th=
ese
patches for the tpm2_nv* tools. I have on my TODO list to implement this bu=
t I
have been busy with other stuff.

> 3. Use the experimental tpm_shell from my github repo: https://github.com=
/williamcroberts/tpm2.0-tools/tree/tpm-shell
> =

> As far as your steps below:
> 1. I don't see PolicyAuthorize on master branch, so I am not 100% sure wh=
at tool your calling.
> 2. I am assuming by call NVDefineIndex you mean tpm2_nvdefine?
> 3. When use NVIndex (read or write)... Doesn't support PCR based policies=
 as discussed above.
> =

> Bill
> =

> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Kh=C3=A1nh N=
guy?n
> Sent: Friday, August 4, 2017 11:32 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] How to use PolicyAuthorize for flexiable PCR policy?
> =

> Hi all,
> I have read in A Practical Guide to TPM 2.0 book, there is a example abou=
t policy for flexible PCRs. Thay said use PolicyAuthorize in case use NVInd=
ex hold full disk encryption key. I confused about how to use PolicyAuthori=
ze, so I ask a man in github, he answer but I still not total clear.

Can you link to the discussion that happened on Github to have more context?

Also, what's your use case? IIUC you want to store a full disk encryption k=
ey
in a NV area, is that correct? If that's the case, then can you see if what=
's
described in this thread is something that can work for you:

https://lists.01.org/pipermail/tpm2/2017-July/000015.html

Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============6622931479842897479==--

