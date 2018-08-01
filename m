Content-Type: multipart/mixed; boundary="===============3573951177988990254=="
MIME-Version: 1.0
From: Peter Magnusson <blaufish.public.email at gmail.com>
Subject: Re: [tpm2] Regarding storing simple data into nv memory of
 slb9670(tpm 2.0)
Date: Wed, 01 Aug 2018 11:21:35 +0200
Message-ID: <CANtcRX6xUcVqmRU16APKBFXzT5uPtj6wdN33jRmRCCVhwAzLyA@mail.gmail.com>
In-Reply-To: CAM8JkLKguQtLmuTSGX1U7ejMLTbo937jWZfDpisCgg8RK5Np=A@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3573951177988990254==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I would suggest you perform the things you want to do first on a high
level operating system (e.g. Linux) using tpm2_nvwrite / tpm2_nvread
and using TSS2_LOG=3Dall+TRACE to get traces of what actually is
communicated with the TPM.

Then you replicate your success again on the MCU / SPI, feeding it
similar SPI commands as shown in the traces.

On Fri, Jul 27, 2018 at 3:00 PM Abbaraju Manojsai
<abbarajumanojsai(a)gmail.com> wrote:
>
> We interfaced  slb 9670   (TPM 2.0) with Msp430 16 bit controller through=
 spi which does not support Linux Kernel.
>
> Our Main Task , is store a few bytes of data in NV memory as simple way i=
nto SLB 9670  (TPM 2.0)
>
> Now we able to access the spi communication of slb 9670 with controller,
>
> we tested the reading sample  registers of slb 9670   like DIDVID registe=
r , version id of slb 9670, status register  and  writing a values  into re=
gisters through spi communication.
>
> so spi  read and spi write communication is working  with chip  by access=
ing this registers.
>
> Our Main Task , is store a few bytes of data into Nv memory of SLB 9670.p=
lease help me.
>
> i am not able to properly understand the tcg stack documents of tpm 2.0
>
> so kindly help me at what are required steps , should i follow ?
>
> Regards,
>
> Manoj ,
> +91-9063249308.
>
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2

--===============3573951177988990254==--

