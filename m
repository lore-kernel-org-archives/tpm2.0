Content-Type: multipart/mixed; boundary="===============2774938241540182935=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Clearing TPM
Date: Fri, 30 Sep 2022 19:50:38 +0000
Message-ID: <d531f4528e631a01755f6d0a6e6907dd4964c420.camel@intel.com>
In-Reply-To: 20220930174650.2030.2395@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2774938241540182935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2022-09-30 at 17:46 +0000, burnsds.accounts(a)protonmail.com
wrote:
> Is there any way to get out of this state without the lockout
> password?

Platform auth, which you won't have as its typically randomly set by
the OS on boot or you can use the bios settings to clear an Intel or
AMD based TPM. For discrete TPMs you need to consult their manuals.
Typically, its playing with some jumpers. =


> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============2774938241540182935==--

