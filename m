Content-Type: multipart/mixed; boundary="===============3467424771860611535=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: System design question
Date: Mon, 22 Aug 2022 13:08:10 +0000
Message-ID: <2804512fa1ee852681ee5db51d4633dbce1db1ba.camel@intel.com>
In-Reply-To: 22755930.6Emhk5qWAg@polaris
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3467424771860611535==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 2022-08-21 at 09:17 +0200, Felix Rubio Dalmau wrote:
> Hi everybody,
> =

> I am playing with a QEMU VM that uses swtpm. My goal is to make a
> stable, easily maintainable setup to have ZFS native full disk
> encription, and I am facing a problem:
> =

> * I was relying on GRUB2 signature-checking capabilities to make sure
> that, besides the kernel (that is checked by Secure Boot anyway),
> initramfs had not been tampered with. However, this introduces yet a
> new (GPG) private key that needs to be stored, initramfs needs to be
> signed when changed, etc.
> * Recently I have learned that from kernel 5.10 on, the measurements
> of initramfs can be found on PCR9, so I modified my PCR-based policy
> to make use of registers 0,1,7 and 9 and I am planning to remove the
> GRUB2 checks. But the problem now is: After generating the policies,
> which I do by....
> =

> ```bash
> # Recreate the PCR-based policy
> tpm2_startauthsession -S session.ctx
> tpm2_policypcr -S session.ctx -L regular.policy -l sha256:0,1,7,9
> tpm2_policypassword -S session.ctx -L regular.policy
> tpm2_flushcontext session.ctx
> =

> # session for auth based on rescue password
> tpm2_startauthsession -S session.ctx
> tpm2_policysecret -S session.ctx -L rescue.policy -c o
> '<tpm_ownerpass>'
> tpm2_flushcontext session.ctx
> =

> # compound both policies using OR
> tpm2_startauthsession -S session.ctx
> tpm2_policyor -S session.ctx -L compound.policy
> sha256:rescue.policy,regular.policy
> tpm2_flushcontext session.ctx
> =

> # create the seal object (the FS password is requested to the user)
> tpm2_create -C prim.ctx -c key.ctx -u key.pub -r key.priv -L
> compound.policy -i- -p '<disk_unlock_password>' -a
> 'fixedtpm|fixedparent'
> =

> # persist the object to the TPM
> tpm2_evictcontrol -c key.ctx 0x81010001 -P '<tpm_ownerpass>'
> ```
> =

> ... then I need to store regular.policy and rescue.policy in
> initramfs, which will produce a different hash next time.
> =

> Therefore, the question is: is there any way I can store the policies
> in the TPM itself, so that I do not have to rebuild initramfs? Do you
> guys think this is not the way to go, and there is a better approach?
> =


Policy Hashes are stable and can be computed without the use of the
tpm. =

You don't really need to save those policy files as they are just the
hash. Polcies are enforced by ensuring the hash generated on the
sessoion via policy commands matches the policy field in the public
portion of the object and that additional state, dependent on the
policy commands, is also verified (like policy secret password).

tpm2 policysecret -S s.ctx -co -L policy.dat
0d84f55daf6e43ac97966e62c9bb989d3397777d25c5f749868055d65394f952

xxd -p -c256 policy.dat =

0d84f55daf6e43ac97966e62c9bb989d3397777d25c5f749868055d65394f952

The policy files are just a way to move the digest between tools.

So really all that needs to occur is the code/script needs to be in
place that does the normal PCR flow or rescue flow. The create call can
be hardcoded to the known hash, that isn't changing and can be included
in the filesystem when generated. If that doesn;t work we could support
embedding the raw hex hash into the create command as an argument
rather than a file argument.

> Thank you very much!
> Felix
> =

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============3467424771860611535==--

