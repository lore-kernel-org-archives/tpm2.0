Content-Type: multipart/mixed; boundary="===============2806576821519788222=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] How do I set the TSS2 log level from my source?
Date: Wed, 08 Jan 2020 17:38:44 -0800
Message-ID: <CAOCvsSngFGP9MxN-SRPwq2ZRfztW7y-nWWu4inWMXi-xq7zeBQ@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2806576821519788222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'm slowly trying to relearn some operations in C/C++ so they can be
used in different parts of the workflow.
Right now I'm trying to just verify if a given handle is accessible.
The easiest way I can see to do this is to try to turn it into an
ESAPI resource using Esys_TR_FromTPMPublic() and see if I get a
non-zero return code.  The only issue is every layer in the API stack
wants to let me know there's a problem on stderr.  From console I can
set  TSS2_LOG to all+NONE to suppress this, but that documentation
doesn't say how to do this from C land.  Is there a good way to do
this?
--===============2806576821519788222==--

