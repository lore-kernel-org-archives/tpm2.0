Content-Type: multipart/mixed; boundary="===============0165541017952930330=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Duplicate a TPM_ALG_KEYEDHASH Key in software
Date: Thu, 27 Oct 2022 15:58:55 +0000
Message-ID: <0443217b34af2540d3f8e5f2608a90e26184fe54.camel@intel.com>
In-Reply-To: 20221027142909.1727.89797@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0165541017952930330==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2022-10-27 at 14:29 +0000, Ronaldo Medeiros wrote:
> Hello everybody
> =

> Is it possible to run a tpm2_duplicate in software? That is, modify
> tpm2_tools so that it is possible to duplicate a TPM_ALG_KEYEDHASH
> Key without applying any Policy (TPM2_PolicyCommandCode or
> TPM2_PolicyDuplicationSelect) and if possible without the need for a
> TPM chip to execute the process.

The process of duplication is taking a key that is protected by the TPM
and protecting it with another storage parent (aka parent key). Without
having the key material itself, you must ask the TPM to perform this
operation. The tools assume a target TPM in both the import and
duplication case. If the issue here is that the other TPM to duplicate
to is remote, you can use the cmd tcti to open an ssh tunnel to the
remote TPM and run the tpm2-tools commands locally [1].

Now if you have the key material for the keyedhash object, you can use
tpm2_pytss to wrap[2] this with the new storage parent using the public
key of the new parent and optionally a protection seed.

If you create an object that is allowed to be duplicated in the TPM and
you want to "export" the key, you can perform the duplication process
to a new storage parent that you control the private portion of. You
can do this with the unwrap method[3]. The test code mentioned below
contains a method
called test_tpm_export_rsa_child_rsa_parent_with_inner_key that shows
how to do this. But again you must go to the TPM to ask it to perform
the duplication process since you do not have the key material itself.

The wrap and unwrap routines are in the tpm2_pytss.utils[4] package.
None of them require a running TPM.
Examples of usage can be found in test/test_utils.py[5] and they also
have pydocs for them.

The project can be found here:
  - https://github.com/tpm2-software/tpm2-pytss

1. PR that updates the man page to show how to use it: =

https://github.com/tpm2-software/tpm2-tss/pull/2443
2. =

https://tpm2-pytss.readthedocs.io/en/latest/utils.html#tpm2_pytss.utils.wrap
3. =

https://tpm2-pytss.readthedocs.io/en/latest/utils.html#tpm2_pytss.utils.unw=
rap
4. https://tpm2-pytss.readthedocs.io/en/latest/utils.html#
5. =

https://github.com/tpm2-software/tpm2-pytss/blob/master/test/test_utils.py

> =

> Regards
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============0165541017952930330==--

