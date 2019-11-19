Content-Type: multipart/mixed; boundary="===============8423530294695443302=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Any suggestions on how to lock a TPM without passwords?
Date: Tue, 19 Nov 2019 14:46:06 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E4569B@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAOCvsSn5gYap6ZmX_dOtMdPPdsoZuZbie-TS-x+tXB94me3Nsw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8423530294695443302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Steven Clark [mailto:davolfman(a)gmail.com]
> Sent: Monday, November 18, 2019 3:51 PM
> To: Zhu, Bing <bing.zhu(a)intel.com>
> Cc: tpm2(a)lists.01.org
> Subject: [tpm2] Re: Any suggestions on how to lock a TPM without password=
s?
> =

> I've done my experimenting with writelocking using a tools 4.1 rc0 build =
I've got
> kicking around and some more spec reading.
> tpm2_nvwritelock isn't enough to actually secure an index against tamperi=
ng until
> the next reboot.  The problem is it doesn't block undefine calls.
> There is an NV attribute which would allow control of deletion behavior
> TPMA_NV_POLICY_DELETE but according to the standard Vol 1 section
> 37.2.22 : "If the Index to be created has its TPMA_NV_POLICY_DELETE attri=
bute
> SET, then platform authorization is required for allocation."
> This is said to be necessary to prevent a user from shooting themselves i=
n the
> foot with an undeleteable-by-default object that can only be removed by t=
he
> platform.  But thanks to the PPI I ~can~ reliably get the platform to del=
ete this.
> =

> Is NV Write Lock with owner authorization even useful?

What exactly are you looking for? An NV index that only the "nv index owner=
" can
modify including delete?

Revision 131 made this note:
Noted that TPMA_NV_POLICY_DELETE with a policy that cannot be satisfied def=
ines an Index that can
never be deleted.

-- That seems very dangerous though --
You would always need to go into some side-channel mode, like through bios,=
 to clear
a TPM. Maybe if you need something like this, that a transient object you s=
eal data to
would be better for the threat model your facing.


> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============8423530294695443302==--

