Content-Type: multipart/mixed; boundary="===============3804228554327956648=="
MIME-Version: 1.0
From: Sven Schwermer <sven at svenschwermer.de>
Subject: [tpm2] TPM 2.0 in embedded systems
Date: Tue, 13 Mar 2018 13:52:35 +0100
Message-ID: <56BB5165-78EA-4B87-B5EE-665CE0D7AFB6@svenschwermer.de>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3804228554327956648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi!

I am looking into using a TPM 2.0 in an embedded Linux system. I am facing =
a few challenges that I couldn=E2=80=99t really find answers to. Some of th=
e open questions are:

- What are the best practices for what hierarchies to use? Since there is n=
o =E2=80=9Cend user=E2=80=9D, but only a platform manufacturer, all hierarc=
hies seem similarly suited.
- How does authorisation work on an embedded system? All pre-shared secrets=
 (plain text passwords/HMAC) would need to be baked into the firmware, so t=
here is no real security benefit. Are we stuck with the complex but powerfu=
l policy-based authorisation (likely PCR based)?
- How to provision the device? What needs to be done at the factory, what i=
s done on boot?
- Best practices for common problems, e.g. how securely authenticate agains=
t a server.

Are there resources out there that answer the above mentioned types of ques=
tions?

Thanks,
Sven
--===============3804228554327956648==--

