Content-Type: multipart/mixed; boundary="===============3256737627352814657=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] Re: [RELEASE CANDIDATES] tpm2-tss 3.2.0-rc1 3.1.1-rc1 3.0.5-rc1
Date: Thu, 17 Feb 2022 07:37:09 +0000
Message-ID: <AS8P194MB166981393B258909077D2041A6369@AS8P194MB1669.EURP194.PROD.OUTLOOK.COM>
In-Reply-To: AS8P194MB1669C63EAE2FE6600D1E8085A6359@AS8P194MB1669.EURP194.PROD.OUTLOOK.COM
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3256737627352814657==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi all,

just another RC 3.2.0-rc3 this time with a fix for the curl changes from rc=
2.

Check it out at https://github.com/tpm2-software/tpm2-tss/tags

Thanks,
Andreas

________________________________________
Von: Fuchs, Andreas <andreas.fuchs(a)sit.fraunhofer.de>
Gesendet: Mittwoch, 16. Februar 2022 18:21
An: tpm2(a)lists.01.org
Betreff: [tpm2] Re: [RELEASE CANDIDATES] tpm2-tss 3.2.0-rc1 3.1.1-rc1 3.0.5=
-rc1

Hi all,

I just tagged 3.2.0-rc2 with a fix to curl invocation.

Give it some testing and I'll release tomorrow if there are no further comp=
laints.

Thanks,
Andreas

________________________________________
Von: Fuchs, Andreas <andreas.fuchs(a)sit.fraunhofer.de>
Gesendet: Montag, 14. Februar 2022 18:43
An: tpm2(a)lists.01.org
Betreff: [tpm2] [RELEASE CANDIDATES] tpm2-tss 3.2.0-rc1 3.1.1-rc1 3.0.5-rc1

Hi all,

I wanted to announce that I've just tagged versions 3.2.0-rc1 3.1.1-rc1 and=
 3.0.5-rc1 of the tpm2-tss project.

You can find the tags in git and here: https://github.com/tpm2-software/tpm=
2-tss/tags

For your convenience, here are the changelog-changes for this rc:
## [3.2.0-rc1] - 2022-02-14
### Fixed
- Fix buffer upcast leading to misalignment
- Fix check whether SM3 is available
- Update git.mk to support R/O src-dir

### Added
- Add additional IFX root CAs

Since we had only few feedback on -rc0 I want to release final in the next =
few days.

Cheers,
Andreas
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============3256737627352814657==--

