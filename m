Content-Type: multipart/mixed; boundary="===============9130166620097528583=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] Re: Information Needed on FAPI Usage
Date: Tue, 21 Jul 2020 08:05:04 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0171B9176A@exch2010c.sit.fraunhofer.de>
In-Reply-To: 20200720180705.2739.39316@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9130166620097528583==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Phani,

=E2=80=A2       Does FAPI_createKey support symmetric key creation
No it does not. Reason is that most TPMs do not support it.

=E2=80=A2       Is there any Template for the crypto profile used in FAPI
I don't know what you mean by this?
By default, our implementation comes with two example profiles. RSA2kSHA256=
 and ECCP256SHA256
to be chosen in fapi-config file.

=E2=80=A2       How to specify the Unique value in the profile while creati=
ng the SRK
This is currently not forseen. Is this really necessary ?
We're currently using the most-used template.

=E2=80=A2       Can multiple profiles be used in FAPI and provisioned indiv=
idually
Yes, you can provision multiple profiles by changing the profile in the con=
fig and calling provision again.
Just make sure that the persistent handles for the SRKs do not collide (ins=
ide the profile).
Then you can always access all provisioned profiles.

Hope this helps,
Andreas
--===============9130166620097528583==--

