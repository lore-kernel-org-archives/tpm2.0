Content-Type: multipart/mixed; boundary="===============8877446767618830386=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Can an unauthorized key be verified with
 activatecredential.
Date: Thu, 08 Sep 2022 16:00:13 +0000
Message-ID: <69fb958270e1dbf667e194f4d596ff259c7debe5.camel@intel.com>
In-Reply-To: 20220907171416.6482.13937@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8877446767618830386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2022-09-07 at 17:14 +0000, Steven Clark wrote:
> I've been using a copy of tpm2_tools 4.0.x (and 5.x something) and I
> created a key just for parameter encryption that specifically has
> decrypt but adminwithpolicy and no userwithauth with the blank
> policy.  The idea was that there was no way the key could be used to
> decrypt a session later as there's no valid way to authorize
> it.  This seems to work just fine in Tools and the ESAPI so I figured
> nothing was wrong with it.
> =

> I'm now trying to add verification via endorsement key to the
> process.  I can run an activatecredential on essentially any key
> except this session key.  Does the activatecredential command require
> authorization for all objects and that's why it's failing?

Yes, if you look at [1] table 12.5.2 it shows that the
@activateHandle and @keyHandle both need auth. So with no way to
authorize you cannot use it in the command. You could create a policy
that says the only way you can use the key is within the command of
ActicateCredential by using a Command Code Policy
see TPM2_PolicyCommandCode and the associated APIs and tpm2-tools

[1] =

https://trustedcomputinggroup.org/wp-content/uploads/TCG_TPM2_r1p59_Part3_C=
ommands_pub.pdf

> =

> If so what's the recommended replacement?  Can I just make a
> restricted encryption key and use that for establishing and
> encrypting/decrypting session?
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============8877446767618830386==--

