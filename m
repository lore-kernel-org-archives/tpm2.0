Content-Type: multipart/mixed; boundary="===============3535575269042454115=="
MIME-Version: 1.0
From: Thibaut Sautereau <thibaut.sautereau at clip-os.org>
Subject: Re: [tpm2] Issues experimenting with tpm2-tools and keyctl trusted
 keys
Date: Wed, 23 Jan 2019 14:56:57 +0100
Message-ID: <20190123135657.GB12820@gandi.net>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D014B4C36D5@exch2010c.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3535575269042454115==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 23, 2019 at 01:11:20PM +0000, Fuchs, Andreas wrote:
> have you tried running the same sequences but using tpm2_create
> instead of "keyctl new" and tpm2_unseal instead of "keyctl load" ?
> Just to make sure that the TPM side of things is working ok ?

Yes, using tpm2_create instead of "keyctl new" and tpm2_load+tpm2_unseal
(exclusively with handles) instead of "keyctl load" works perfectly.

> Then it would be narrowed down to finding the diff between the basic
> commands and how keyctl uses them.

Right.

-- =

Thibaut Sautereau
CLIP OS developer

--===============3535575269042454115==--

