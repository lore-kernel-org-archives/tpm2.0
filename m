Content-Type: multipart/mixed; boundary="===============0494481380167588870=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] Issue Solved/Trusted Boot
Date: Mon, 04 Sep 2017 12:04:46 +0200
Message-ID: <a15fb54a-9d7c-657f-13f4-2c03435d8e5b@redhat.com>
In-Reply-To: CAHM15e3xAx4wz+t_X4-SJO9N2JVqF7KHbuFASdJJHjYr2TbaEg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0494481380167588870==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Haydon,

On 09/04/2017 11:27 AM, Haydon Cardew wrote:
> Hi,
> =

> =

> =

> Following a discussion on 01org/tpm2-tools #444 [https://github.com/01org/
> tpm2-tools/issues/444] I wanted to post an update on what the issue was.
>

I'm glad that your issue got solved.
 > =

> If I could ask one further thing (I believe this is the correct place to
> post this?), I=E2=80=99m looking at setting up a trusted boot system on m=
y current
> setup (Ubuntu 16.04, kernel 4.4) to be used with the now working tpm2. I
> have previously done this with tpm1.2 but the process seems rather
> different this time, if anyone can point me to any good resources/tutoria=
ls
> that would be a massive help.
> =


There isn't a single way to do this, so it depends on what kind of system y=
ou
want to use and what is your threat model.

For example, do you want to boot your system in EFI or BIOS mode? do you wa=
nt
to use Secure Boot or no?

For me the best way to do this is to use UEFI + Secure Boot and to seal your
secrets against PCR7 as described in this blog post [0] from Matthew Garret.

But for that you need latest shim that measures certificates into PCR7 [1] =
and
TPM2 measurement support in grub2 [2] that haven't landed yet.

If you want to boot your system in BIOS mode, then you have other options l=
ike
the TrustedGrub2 project [3].

[0]: https://mjg59.dreamwidth.org/48897.html
[1]: https://github.com/rhboot/shim/commit/8af7c4cacaf753f38f2564b26b962a7a=
2942d664
[2]: http://lists.gnu.org/archive/html/grub-devel/2017-07/msg00003.html
[3]: https://github.com/Rohde-Schwarz-Cybersecurity/TrustedGRUB2

Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============0494481380167588870==--

