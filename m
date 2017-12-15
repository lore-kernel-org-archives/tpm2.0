Content-Type: multipart/mixed; boundary="===============7781516446094340417=="
MIME-Version: 1.0
From: Jerry Snitselaar <jsnitsel at redhat.com>
Subject: [tpm2] test_tpm2_nv.sh
Date: Fri, 15 Dec 2017 12:31:57 -0700
Message-ID: <20171215193157.x2nlz4jr744hx2w5@cantor>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7781516446094340417==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi William,

With fixing the redirection for the tpm2_nvwrite portion of the large file =
test,
I see a buffer overflow with tpm2_nvwrite. I don't know if you are seeing t=
hat
there. This is with 3.0.1 using the PTT device. Prior to that and the fix f=
or
the filename I was seeing an error with the tpm2_nvread portion that is most
likely the following issue: https://github.com/intel/tpm2-tss/issues/667

I'll add an issue on github to track it.

--===============7781516446094340417==--

