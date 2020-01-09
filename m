Content-Type: multipart/mixed; boundary="===============5635188617463471400=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] Re: How do I set the TSS2 log level from my source?
Date: Thu, 09 Jan 2020 09:31:02 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0163C46FF9@EXCH2010B.sit.fraunhofer.de>
In-Reply-To: CAOCvsSngFGP9MxN-SRPwq2ZRfztW7y-nWWu4inWMXi-xq7zeBQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5635188617463471400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

you can set the maxloglevel from ./configure to be none
then all logging code is compiled out.

Alternatively, setenv("TSS2_LOG")

Cheers,
Andreas
________________________________________
From: Steven Clark [davolfman(a)gmail.com]
Sent: Thursday, January 09, 2020 02:38
To: tpm2
Subject: [tpm2] How do I set the TSS2 log level from my source?

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
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============5635188617463471400==--

