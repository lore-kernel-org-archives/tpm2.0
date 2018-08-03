Content-Type: multipart/mixed; boundary="===============4557140526892512891=="
MIME-Version: 1.0
From: Peter Magnusson <blaufish.public.email at gmail.com>
Subject: Re: [tpm2] Initializing & Programming PCRs
Date: Fri, 03 Aug 2018 13:54:32 +0200
Message-ID: <CANtcRX4MEebkKfzm61aXqmYvLwKa4osZTgokE=v6mdYyqV1z+g@mail.gmail.com>
In-Reply-To: CAHa3UP6tGfSv6fAo6avmCRfU5R+-VqFoF+Z32zriL8TV9n52MA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4557140526892512891==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If I understand correctly, you either need tboot, trustedgrub or
similar to get kernel measurements. Traditional Linux boot does not
measure kernel.

If I misunderstood something or is referencing outdated information,
please correct me :)

PCRs:
PCR 0-7 are for low level (UEFI etc)
PCR 8 and up are for higher level parts like kernel.

OpenXT which is based upon tboot (Intel TXT) recommends focusing on
PCR0, PCR1, PCR2, PCR3, PCR17, PCR18, PCR19.
TrustedGrub I am not so familiar with, but here's a thread about their
PCRs: https://security.stackexchange.com/questions/47573/how-to-measure-the=
-integrity-of-the-os-linux

If your processor support TXT, tboot is available from Ubuntu using
sudo apt install tboot. On a client device, tboot also requires the
correct ACM to be installed in order to complete measurements (on a
server, ACM might be provided in the BIOS)

b.
I haven't gotten SecureBoot working with TrustedBoot. To my
understanding, Ubuntu and Intel lacks a complete chain Secure Boot
chain for tboot.

d.
tboot provides a utility for reviewing the tboot startup after Linux
has completed booting.

//P
On Thu, Aug 2, 2018 at 4:07 AM Arvind Kumar <arvind.kumar(a)iotium.io> wrot=
e:
>
> Hi All,
>
> I have a hardware with TPM 2.0 on which I have installed ubuntu in UEFI m=
ode. I need to trigger UEFI  to measure the boot components (uefi/shim/boot=
 loader, kernel, initrd) into respective PCRs. For which, I have following =
questions.
>
> a. As soon as the  TPM 2.0  is enabled from BIOS and device is booted, do=
es UEFI start the measurements and record them into PCRS by default or ther=
e is some config to tell UEFI to start measurements ?
>
> b. Should secure boot be enabled in order to trigger the UEFI to start ab=
ove measurements ?
>
> c. I enabled TPM 2.0 and installed ubuntu in UEFI mode, and I can see tha=
t PCR 0 to 7 are populated with some values and all other PCRs are zeros. A=
re these boot measurements correct, how can I verify ?
>
> d. Is there any logs on TPM 2.0 or UEFI that I can refer to ?
>
> Any help is appreciated.
>
> Thanks,
> Arvind
>
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2

--===============4557140526892512891==--

