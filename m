Content-Type: multipart/mixed; boundary="===============1017377069902489989=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Re: [tpm2][tpm2-abrmd]tpm2-abrmd.service may run before udev
 rule.
Date: Mon, 02 Dec 2019 13:19:11 -0800
Message-ID: <CAOCvsSnV93zkxNYkdCSxnomzvQRHZKdpHZ8qF43WAjEO=HYB+Q@mail.gmail.com>
In-Reply-To: DB638850A6A2434A93ECADDA0BC838909CEE341D@ORSMSX104.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1017377069902489989==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

It would be largely unrelated to the project's actual source control,
but I could manufacture one, given a day or two, if you want.  It
might even be from HEAD and tested if I can find the time.  I've been
using my personal account for interaction with the mailing list until
there's an SOP for contributing back from work.

This patch could probably use a little outside review, honestly.
Systemd ordering cycles have mostly non-deterministic failure
behavior, as part of the spec.  If someone out there is performing TPM
operations in a systemd-based initramfs (maybe Dracut) and could check
they don't end up with any cycles in their graph it would be nice.
This has only been tested with a manual init system and no ABRMD in
the initramfs in my case.
--===============1017377069902489989==--

