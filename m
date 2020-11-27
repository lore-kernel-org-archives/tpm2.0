Content-Type: multipart/mixed; boundary="===============1943021389384627988=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: question: how to test a case where the selftest command
 fails
Date: Fri, 27 Nov 2020 14:38:53 +0000
Message-ID: <SN6PR11MB343716ACC62B57C0C97A75EAB8F80@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: 63cc0593-732b-5423-922d-cf5b16c8c958@collabora.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1943021389384627988==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

That's possible, but then you would have to maintain a patched emulator. Yo=
u could just use something
like cmocka and wrap the TPM call so it never hits the TPM and return an er=
ror.

> -----Original Message-----
> From: Dafna Hirschfeld <dafna.hirschfeld(a)collabora.com>
> Sent: Friday, November 27, 2020 7:45 AM
> To: tpm2(a)lists.01.org
> Cc: Enric Balletbo i Serra <enric.balletbo(a)collabora.com>
> Subject: [tpm2] question: how to test a case where the selftest command f=
ails
> =

> Hi,
> I am working for Collabora on a list of patches in the Chromeos kernel.
> I want to check if I can upstream those patches to the mainline kernel.
> There is one patch [1] to ignore the case that the 'selftest' command fai=
led when
> adding the '/dev/tpm' device. The idea is that userspace could still inte=
ract with
> the device to some extent event if it fails.
> I was wandering how do I test such a case.
> I thought that I can test it with a tpm emulator and change the emulator =
code to
> fail on 'selftest'.
> I am new to TPM and still know little about it so I thought maybe some of=
 the
> people here have better ideas?
> =

> [1]
> https://chromium.googlesource.com/chromiumos/third_party/kernel/+/1065c2f
> e54d6%5E%21/
> =

> Thanks a lot,
> Dafna Hirschfeld.
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============1943021389384627988==--

