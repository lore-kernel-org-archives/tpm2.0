Content-Type: multipart/mixed; boundary="===============4656737040017190188=="
MIME-Version: 1.0
From: John S <sedigj at gmail.com>
Subject: [tpm2] Re: Relating tpm2_createprimary, Primary Seeds, and tpm2_clear
Date: Wed, 01 Apr 2020 22:00:42 +0000
Message-ID: <20200401220042.2692.94193@ml01.vlan13.01.org>
In-Reply-To: 20200331155736.2692.99393@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4656737040017190188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thank you both for a prompt reply yesterday.

From what you contributed yesterday, I understand tpm2_clear will clear the=
 Owner seed/hierarchy, and that the functionality to perform the clear on t=
he Owner hierarchy can be disabled.

>Platform and Endorsement seeds generally are stable, but the command set
>Does allow for ChangeEPS and ChangeSPS commands. But I don't think I have
>ever seen a production TPM support this, but be aware that it exists.
This appears to be confirmation that these commands are Not present on my T=
PM:
$ tpm2_getcap commands|grep eps
$ tpm2_getcap commands|grep pps

I read in another discussion that it sounds like this means that platform a=
nd endorsement seeds would effectively be unchangeable in my case.
https://lists.01.org/hyperkitty/list/tpm2(a)lists.01.org/thread/5KE3W6QLYH3=
N76K753VNQSX6CPJMH7KJ/


>Also on the note of re-generating primary keys, you may find my previous t=
hread about the
>unique data option in tpm2_createprimary helpful if you want to use unique=
 data in
>addition to the seed.
Thanks, do you have a link? I could not find this thread yet after searchin=
g. Also, is there a good reason to use the unique data in addition to being=
 extra cautious? Maybe this is addressed in the thread.

Regarding Platform authorization value - should I expect this is controlled=
 by BIOS or OS?
Sounds like I can at least clear it via the BIOS, I'll check.
--===============4656737040017190188==--

