Content-Type: multipart/mixed; boundary="===============8586511632021883998=="
MIME-Version: 1.0
From: ted.h.kim at oracle.com
Subject: [tpm2] key destruction
Date: Fri, 29 May 2020 14:44:51 -0700
Message-ID: <5bcc1bd1-0adb-54da-929f-4d3eb14d1e19@oracle.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8586511632021883998==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Folks,

Sorry for what might be an obvious question ...

What is the right command sequence to destroy keys, despite the users =

possibly still having context files?

I read something about resetting the seed for a hierarchy through the =

TPM2_Clear operation (presumably the tpm2_clear command can do this). =

But that is too drastic.

I just want to kill off a single key and make it not usable. If I kill =

off a parent presumably I can destroy a whole tree of keys. But that =

just moves the problem, potentially up to a primary key.
What is the right way to do this?

I suppose there is some trick whereby you make a policy not able to be =

satisfied. But then it seems you still need to retain state to prevent =

the key from being used. I would rather just have all the key state be =

gone and not able to be recreated.

Thanks,
-ted

--
Ted H. Kim, PhD
ted.h.kim(a)oracle.com
+1 310-258-7515


--===============8586511632021883998==--

