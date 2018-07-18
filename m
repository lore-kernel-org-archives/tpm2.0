Content-Type: multipart/mixed; boundary="===============6384801572395172963=="
MIME-Version: 1.0
From: flihp <flihp at twobit.us>
Subject: Re: [tpm2] Running tests
Date: Wed, 18 Jul 2018 11:01:10 -0700
Message-ID: <75a765cc-0fa7-a292-9fe2-acbda383fda3@twobit.us>
In-Reply-To: B445B76DF3794A499C4EDCFBEE7A3455198E1658@CINMBCNA04.e2k.ad.ge.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6384801572395172963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/12/2018 11:27 AM, Ahmed, Safayet (GE Global Research, US) wrote:
> I'm interested in running the integration tests and unit tests for the tp=
m2
> software stack (tss, abrm, and the tools).
> =

> Is there any documentation on the switches to use with configure and make=
 to
> run those tests? Unfortunately, I couldn't find it.

Enable unit tests:
https://github.com/tpm2-software/tpm2-abrmd/blob/master/INSTALL.md#enable-u=
nit-tests---enable-unit
Enable integration
tests:https://github.com/tpm2-software/tpm2-abrmd/blob/master/INSTALL.md#ru=
n-integration-tests---enable-integration

The docs in the tpm2-tss repo don't include these configure options.

> Also, are those tests hard coded to use the IBM tpm2 simulator? I noticed
> that tpm2-abrmd allows you to test against the hardware tpm. Is it possib=
le
> to configure these tests to use the mssim tcti with non-default configs?

The environment variables that control this aren't documented in the
INSTALL file since they're not relevant to building / installing the
software. The best reference for them is the script that integrates our
tests with the automake test driver:

https://github.com/tpm2-software/tpm2-abrmd/blob/master/scripts/int-test-se=
tup.sh#L179

It looks like the analog in the tpm2-tss test harness could use some
cleaning up. A bunch of the environment variables still reference the
'socket' TCTI that doesn't exist any longer. I'd guess these environment
variables aren't being used by the integration tests and are just being
ignored :\

Philip

--===============6384801572395172963==--

