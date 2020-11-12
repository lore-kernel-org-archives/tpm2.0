Content-Type: multipart/mixed; boundary="===============4028009461786959953=="
MIME-Version: 1.0
From: =?utf-8?q?Max_Halld=C3=A9n_=3Cmax=2Ehallden_at_wisi=2Ese=3E?=
Subject: [tpm2] Re: TPM within Containers
Date: Thu, 12 Nov 2020 10:09:05 +0100
Message-ID: <4adfbb7f-8aec-b333-38ac-49b376001423@wisi.se>
In-Reply-To: 17a961c7-b742-69b3-040b-8d6a077ca10f@uvensys.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4028009461786959953==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I haven't tried anything tpm-related in docker, but consider using =

--device /dev/tpm0:/dev/tpm0 to avoid having to run the container in =

privileged mode.

Not sure what your use-case is for vTPM, but if you just want to share =

the tpm I think it should work as long as you access it via tpm2-abrmd =

or /dev/tpmrm0.

Regards,
Max

On 11/12/20 9:14 AM, Steffen Schwebel wrote:
> Hello,
>
> Although I havent really looked into this, Id assume you would need to
> expose the device to the container, like you would do with any other
>
> Alternatively, assuming your USB device is available with drivers working=
, etc. on the host in /dev/bus/usb, you can mount this in the container usi=
ng privileged mode and the volumes option. For example:
>
> docker run -t -i --privileged -v /dev/bus/usb:/dev/bus/usb ubuntu bash
>
> So, maybe something along the lines of
>
> docker run -t -i --privileged -v /dev/tpm0:/dev/tpm0 ubuntu bash
>
> might be=C2=A0 worthwile to take a look at
>
> Regards,
> Steffen Schwebel
>
>
> On 11/12/20 2:30 AM, Eduardo Falc=C3=A3o wrote:
>> Hello everyone
>>
>> Does anyone know any tutorial to deploy TPM-enabled containers?
>> I was looking for some example with vTPM, instead of simulation tools li=
ke IBM and others.
>> In addition, it seems that enabling IMA in containers is a challenging t=
ask...
>> I came across 2 papers, "Container-IMA: A privacy-preserving Integrity M=
easurement Architecture for Containers" and " Integrity verification of doc=
ker containers for a lightweight cloud environment", but there is no tutori=
al on how to deploy such a container.
>>
>> Any help is appreciated.
>>
>> Best regards.
>> _______________________________________________
>> tpm2 mailing list -- tpm2(a)lists.01.org
>> To unsubscribe send an email to tpm2-leave(a)lists.01.org
>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============4028009461786959953==--

