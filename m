Content-Type: multipart/mixed; boundary="===============7357137264476742109=="
MIME-Version: 1.0
From: Petr Gotthard <petr.gotthard at advantech.cz>
Subject: [tpm2] tpm2_clear command misbehaving?
Date: Mon, 19 Oct 2020 11:02:57 +0000
Message-ID: <
 <TY2PR02MB367865E6C7660BFDDBA773AC811E0@TY2PR02MB3678.apcprd02.prod.outlook.com>>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7357137264476742109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I am trying to become acquainted with a TPM2.0 (an actual chip from ST) and=
 I found an unexplainable behaviour of the tpm2_clear command. (I suspect t=
he fault is on my side though.)

As written on the man page, I did expect the tpm2_clear "Clears lockout, en=
dorsement and owner hierarchy authorization values."

(1)
The -c parameter takes a hierarchy, it works on platform hierarchy, but doe=
s not work on owner.
I tried: tpm2_clear -c owner
which fails with "Unexpected handle - TPM2_RH_OWNER", probably because the =
owner hierarchy is not expected there
https://github.com/tpm2-software/tpm2-tools/blob/master/tools/tpm2_clear.c#=
L73
Is there a reason for that, please?

(2)
I did expect the authorization to be cleared. So, after I set a password "p=
1" for the platform hierarchy with
tpm2_changeauth -c p p1
I thought it will be cleared after calling
tpm2_clear -c p p1
so a subsequent tpm2_clear or tpm2_changeauth will not need any password an=
ymore, but it does as if nothing was cleared actually.
I need to call
tpm2_changeauth -c p p1 p2
to change the password again, despite I called tpm2_clear before.

What does the tpm2_clear actually clear, please? Am I doing a mistake somew=
here, please?


Kind Regards,
Petr

--===============7357137264476742109==--

