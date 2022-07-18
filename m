Content-Type: multipart/mixed; boundary="===============4036018270365731964=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Recommended way to encrypt a credential
Date: Mon, 18 Jul 2022 14:47:28 +0000
Message-ID: <c5a60732db207ee8123fc8c314a1944b1e2d2892.camel@intel.com>
In-Reply-To: 20220716161849.2570.27559@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4036018270365731964==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 2022-07-16 at 16:18 +0000, Tim K wrote:
> Let's assume I have a credential for some other remote system that
> I'd like to store somewhat protected so it can be used in a cron job.
> What is the recommended way? I see a few possibilities:
> =

> 1. Create a primary key, an encryption key and seal the credential
> (it's small, less than 128 bytes)
> 2. Use an encryption key to encrypt something like a GPG passphrase
> (or maybe the GPG private key without a passphrase) and then gpg-
> encrypt a file that holds my credential
> 3. Use tpm2_encryptdecrypt which looks like some form of simplifying
> #2 above and may also work with files that may slightly exceed 128
> bytes
> 4. Just store the credential directly at an NV index

I would create a seal object, so example 1. As you point out the
limitation is size.

> =

> Thanks!
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============4036018270365731964==--

