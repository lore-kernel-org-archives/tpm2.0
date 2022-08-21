Content-Type: multipart/mixed; boundary="===============3692909988910078284=="
MIME-Version: 1.0
From: Felix Rubio Dalmau <felix at kngnt.org>
Subject: [tpm2] System design question
Date: Sun, 21 Aug 2022 09:17:56 +0200
Message-ID: <22755930.6Emhk5qWAg@polaris>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3692909988910078284==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi everybody,

I am playing with a QEMU VM that uses swtpm. My goal is to make a stable, e=
asily maintainable setup to have ZFS native full disk encription, and I am =
facing a problem:

* I was relying on GRUB2 signature-checking capabilities to make sure that,=
 besides the kernel (that is checked by Secure Boot anyway), initramfs had =
not been tampered with. However, this introduces yet a new (GPG) private ke=
y that needs to be stored, initramfs needs to be signed when changed, etc.
* Recently I have learned that from kernel 5.10 on, the measurements of ini=
tramfs can be found on PCR9, so I modified my PCR-based policy to make use =
of registers 0,1,7 and 9 and I am planning to remove the GRUB2 checks. But =
the problem now is: After generating the policies, which I do by....

```bash
# Recreate the PCR-based policy
tpm2_startauthsession -S session.ctx
tpm2_policypcr -S session.ctx -L regular.policy -l sha256:0,1,7,9
tpm2_policypassword -S session.ctx -L regular.policy
tpm2_flushcontext session.ctx

# session for auth based on rescue password
tpm2_startauthsession -S session.ctx
tpm2_policysecret -S session.ctx -L rescue.policy -c o '<tpm_ownerpass>'
tpm2_flushcontext session.ctx

# compound both policies using OR
tpm2_startauthsession -S session.ctx
tpm2_policyor -S session.ctx -L compound.policy sha256:rescue.policy,regula=
r.policy
tpm2_flushcontext session.ctx

# create the seal object (the FS password is requested to the user)
tpm2_create -C prim.ctx -c key.ctx -u key.pub -r key.priv -L compound.polic=
y -i- -p '<disk_unlock_password>' -a 'fixedtpm|fixedparent'

# persist the object to the TPM
tpm2_evictcontrol -c key.ctx 0x81010001 -P '<tpm_ownerpass>'
```

... then I need to store regular.policy and rescue.policy in initramfs, whi=
ch will produce a different hash next time.

Therefore, the question is: is there any way I can store the policies in th=
e TPM itself, so that I do not have to rebuild initramfs? Do you guys think=
 this is not the way to go, and there is a better approach?

Thank you very much!
Felix


--===============3692909988910078284==--

