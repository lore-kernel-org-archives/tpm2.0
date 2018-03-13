Content-Type: multipart/mixed; boundary="===============4416676620757814886=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] TPM 2.0 in embedded systems
Date: Tue, 13 Mar 2018 13:32:02 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D010EAD9325@exch2010c.sit.fraunhofer.de>
In-Reply-To: 56BB5165-78EA-4B87-B5EE-665CE0D7AFB6@svenschwermer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4416676620757814886==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Sven,

you are asking all the right questions, that people are working on in TCG a=
nd everywhere else.

I'd even add the question about CRTMs for Embedded (ARM) Systems to the mix.

What I can point you to is:
- https://trustedcomputinggroup.org/wp-content/uploads/TCG-TPM-v2.0-Provisi=
oning-Guidance-Published-v1r1.pdf
- https://trustedcomputinggroup.org/wp-content/uploads/TCG_Guidance_for_Sec=
uring_NetEq_1_0r29.pdf
- https://trustedcomputinggroup.org/wp-content/uploads/TCG-Guidance-for-Sec=
uring-Resource-Constrained-Devices-v1r22.pdf

Maybe you will find some of those answers there.

Otherwise, embedded platforms differ so hugely, that some custom aspects al=
ways need to be accounted for...
Thus in the end, its a matter of profiles and some example cases that you w=
ill need to choose from. The problem with
this is however that it's a bunch of eggs with no hens...
I.e. IMHO, I think we may need more real-world deployments that are custom =
build before being able to further cluster, classify and standardize on dep=
loyment and other processes in the embedded realm. So anything you may want=
 to share about your project could help in this effort.

I hope I could confuse you enough... ;-)

Cheers,
Andreas
________________________________________
From: tpm2 [tpm2-bounces(a)lists.01.org] on behalf of Sven Schwermer [sven(=
a)svenschwermer.de]
Sent: Tuesday, March 13, 2018 13:52
To: tpm2(a)lists.01.org
Subject: [tpm2] TPM 2.0 in embedded systems

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
_______________________________________________
tpm2 mailing list
tpm2(a)lists.01.org
https://lists.01.org/mailman/listinfo/tpm2

--===============4416676620757814886==--

