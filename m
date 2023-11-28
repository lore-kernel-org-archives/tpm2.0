Return-Path: <al.garnier.trad@gmail.com>
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A028C4177D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1CA24177B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701196925; x=1701801725;
 darn=lists.linuxfoundation.org; 
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=RhKQycGSTxMM+FB9flE54LPTD+AU2ZzzhZB3UugEUU4=;
 b=J357Ca4+TsRMH2veB6Vu/IodZvMCRD2a4em4phaZtDYp8zVdudsubIxx9qlSs+JUXi
 RQKirHIU63l+5S0jxXpxCwAH0kX5Fnhd5+mCHmfwkufNMCl9TxtquTZDSHePf/fYZF9H
 yaGEGRoQCaVbxv9gA0She+a4X+y4RORHhUqgZrOQDaYjZhPIEoBat/4a6P/4HhaeMSVg
 3AEJb0z5OHg+1JJ+vR6lkzLhoRZF10vRqf0tyNPUmEU/wC+r0qk0UZN2HQgQUnr/Bx+b
 vE0uDB4gH1BkYYY4ta5HtwpEXTdv+PyhcVLaWgELBfSVCMt7d7Gmr4tyMSKAHePSWe8S
 E1Pg==
MIME-Version: 1.0
From: Alexis Garnier <al.garnier.trad@gmail.com>
Date: Tue, 28 Nov 2023 19:41:54 +0100
Message-ID: <CANbXECnRoE2R3mog=aj_qDYFkDj-fvwYkpoZNVyyayyEHXHyrQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary="00000000000071cf36060b3ac6dd"
Subject: [Tpm2] Windows TBS and using tpm2-tss FAPI
List-Id: The tpm2 userspace mailing list <tpm2.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/tpm2/>
List-Post: <mailto:tpm2@lists.linuxfoundation.org>
List-Help: <mailto:tpm2-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=subscribe>
To: tpm2@lists.linuxfoundation.org

--00000000000071cf36060b3ac6dd
Content-Type: text/plain; charset="UTF-8"

Hello,

I have been trying to implement a solution using the tpm2-tss FAPI to talk
to a Windows TPM, via the TCTI TBS.

I have used the FAPI successfully on Linux and thought that by using the
Visual Studio existing solution in tpm2-tss and porting the tpm2-tss FAPI
on top I might be able to have something working.

Whilst part of the solution seems to work, the Windows TPM has been
uncooperative on a lot of instances, first during the startup sequence when
trying to get capabilities, among other things.

I'm also assuming the provisioning process based on the fapi profiles
process will not work for TBS.

My question is simple, has there ever been a successful ESYS implementation
on Windows ? One with examples I might be able to base myself on to try and
make it work ?

I might be a bit green when it comes to working with TPMs so I apologize if
my request seems ignorant.

Thanks in advance for your help

Regards,
Alexis Garnier

--00000000000071cf36060b3ac6dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I have been trying to implement =
a solution using the tpm2-tss FAPI to talk to a Windows TPM, via the TCTI T=
BS.</div><div><br></div><div>I have used the FAPI successfully on Linux and=
 thought that by using the Visual Studio existing solution in tpm2-tss and =
porting the tpm2-tss FAPI on top I might be able to have something working.=
</div><div><br></div><div>Whilst part of the solution seems to work, the Wi=
ndows TPM has been uncooperative on a lot of instances, first during the st=
artup sequence when trying to get capabilities, among other things.</div><d=
iv><br></div><div>I&#39;m also assuming the provisioning process based on t=
he fapi profiles process will not work=C2=A0for TBS.</div><div><br></div><d=
iv>My question is simple, has there ever been a successful ESYS implementat=
ion on Windows ? One with examples I might be able to base myself on to try=
 and make it work ?</div><div><br></div><div>I might be a bit green when it=
 comes to working with TPMs so I apologize if my request seems ignorant.</d=
iv><div><br></div><div>Thanks in advance for your help</div><div><br></div>=
<div>Regards,</div><div>Alexis Garnier</div></div>

--00000000000071cf36060b3ac6dd--
