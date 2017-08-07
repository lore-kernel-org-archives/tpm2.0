Content-Type: multipart/mixed; boundary="===============8279512934997655153=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] How to use PolicyAuthorize for flexiable PCR policy?
Date: Mon, 07 Aug 2017 17:16:36 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC563EAABF28@ORSMSX103.amr.corp.intel.com>
In-Reply-To: CAMGQdGLUHXGwm406npDH9qNqPZHWGSuDoD-jS9=inHh2Tu0okA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8279512934997655153==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Sorry for top posting, I need to configure my email client still.

The problem with the tools right now, is that the policy sessions are getti=
ng destroyed when the command exits
when you use the resource manager. The resource manager always flushes the =
TPM when a client exists.

You have three choices at the moment:
1. use /dev/tpm0 directly, which means no other clients can be using the TP=
M at that time.
2. Patch the tools to be able to set up simple pcr policy sessions, like tp=
m2_unseal. This is currently issue https://github.com/01org/tpm2-tools/issu=
es/348
3. Use the experimental tpm_shell from my github repo: https://github.com/w=
illiamcroberts/tpm2.0-tools/tree/tpm-shell

As far as your steps below:
1. I don't see PolicyAuthorize on master branch, so I am not 100% sure what=
 tool your calling.
2. I am assuming by call NVDefineIndex you mean tpm2_nvdefine?
3. When use NVIndex (read or write)... Doesn't support PCR based policies a=
s discussed above.

Bill

From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Kh=C3=A1nh Ngu=
y?n
Sent: Friday, August 4, 2017 11:32 AM
To: tpm2(a)lists.01.org
Subject: [tpm2] How to use PolicyAuthorize for flexiable PCR policy?

Hi all,
I have read in A Practical Guide to TPM 2.0 book, there is a example about =
policy for flexible PCRs. Thay said use PolicyAuthorize in case use NVIndex=
 hold full disk encryption key. I confused about how to use PolicyAuthorize=
, so I ask a man in github, he answer but I still not total clear.
Can you list all step use of PolicyAuthorize or give me a example code?
This is that I understand about use of PolicyAuthorize, can you correct me?
- When define new NVIndex:
=C2=A0 =C2=A0 + Use TPM create sign key
=C2=A0 =C2=A0 + Create a trail session
=C2=A0 =C2=A0 + Call PolicyAuthorize with input is sign key
=C2=A0 =C2=A0 + Get policydigest and call NVDefineIndex with policydigest.
- When use NVIndex (read or write):
=C2=A0 =C2=A0 + Create trail session, call PolicyPCR, call GetDigest to get=
 a policydigest1
=C2=A0 =C2=A0 + Sign policydigest1 with sign key
=C2=A0 =C2=A0 + VerifySignature with input is sign key, signature, sign key=
 and get a ticket
=C2=A0 =C2=A0 + Pass ticket, sign key name, policydigest1 to PolicyAuthoriz=
e, if all thing right, policy session->policydigest will change to policydi=
gest
=C2=A0 =C2=A0 + Use that policydigest to use with NVIndex.

Thank you!


--===============8279512934997655153==--

