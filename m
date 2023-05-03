Return-Path: <petr.gotthard@centrum.cz>
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B73D8149B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE01B8148A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=centrum.cz; s=mail;
 t=1683114199; bh=i+18P3fkO5aTq2QieVnV9nG472wXxiMYm/uwkebdc5Y=;
 h=Date:From:Subject:To:References:In-Reply-To:From;
 b=BMtQF/5l4OUhIk4mFEqnfDbdv1x0rKTDCSl8TOiTuxaXNFlhj6w+o8gZXGe+cXGxG
 e39Qcxpf7NaEb8sveBq1sbob9b/SWCifED/eSKcSpIrb5VF52N/vCj3GTEGoZV7GF9
 Uvg6uh72z5jzo4WJa7+iJ0wOjxqyfgwWqK+h8ERM=
Date: Wed, 03 May 2023 13:43:18 +0200
From: Petr Gotthard <petr.gotthard@centrum.cz>
References: <20230304111257.FBBD1E80@centrum.cz>
In-Reply-To: <20230304111257.FBBD1E80@centrum.cz>
MIME-Version: 1.0
Message-Id: <20230503134318.423136D0@centrum.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: [Tpm2] [RELEASE CANDIDATE] tpm2-openssl 1.2.0-rc1
List-Id: The tpm2 userspace mailing list <tpm2.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/tpm2/>
List-Post: <mailto:tpm2@lists.linuxfoundation.org>
List-Help: <mailto:tpm2-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=subscribe>
To: tpm2@lists.linuxfoundation.org

Hello,

I would like to announce the release of tpm2-openssl 1.2.0-rc1: https://git=
hub.com/tpm2-software/tpm2-openssl/releases/tag/1.2.0-rc1

This fixes some warnings displayed when building on Fedora Linux and improv=
es tests to work also on FC38.


Petr

______________________________________________________________
> Komu: "tpm2@lists.linuxfoundation.org" <tpm2@lists.linuxfoundation.org>
> Datum: 04.03.2023 11:20
> P=C5=99edm=C4=9Bt: [Tpm2] [RELEASE CANDIDATE] tpm2-openssl 1.2.0-rc0
>
>Hello,
>=20
>I would like to announce the release of tpm2-openssl 1.2.0-rc0: https://gi=
thub.com/tpm2-software/tpm2-openssl/releases/tag/1.2.0-rc0
>
>=20
>Added
>- Added support for ECDH with a KDF, which is used by ECC-based CMS (S/MIM=
E).
>
>Changed
>- Symmetric operations are disabled by default. In most situations these a=
re not needed and cause a huge performance penalty.
>  To enable configure with `--enable-op-digest` or `--enable-op-cipher`.
>
>Removed
>- Removed unofficial support for tpm2-tss < 3.2.0, which do not support th=
e openssl 3.x.
>
>Fixed
>- Fixed OSSL_FUNC_KEYMGMT_HAS operations with NULL keys
>- Modified documentation: the user-space resource manager (abrmd) is almos=
t mandatory for complex scenarios such as SSL or X.509 operations.
>
>
>Kind Regards,
>Petr
