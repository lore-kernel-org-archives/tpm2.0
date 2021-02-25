Content-Type: multipart/mixed; boundary="===============2255767280681959208=="
MIME-Version: 1.0
From: Luke Hinds <lhinds at redhat.com>
Subject: [tpm2] Re: tpm2_abrmd: Intel tools with abrmd?
Date: Thu, 25 Feb 2021 06:52:43 +0000
Message-ID: <CAKrSGQRKOSgUXS=m=rvrgmA==1fx0dEZaSdjoF9SJybd3UWMNg@mail.gmail.com>
In-Reply-To: OFF8EAB942.0DE27369-ON00258686.00764B04-85258686.0079881E@notes.na.collabserv.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2255767280681959208==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2021 at 10:07 PM Kenneth Goldman <kgoldman(a)us.ibm.com> wr=
ote:
>
> I have the Intel tools working with no abrmd and setenv TPM2TOOLS_TCTI "m=
ssim:host=3Dlocalhost,port=3D2321"
>
> What would I set the env variable to for abrmd?
>
> The docs at https://www.mankier.com/1/tpm2_getrandom
>
> discuss command line argument but not the env variable.
>
> 1 - Should I use bus_name or bus_type?
>
> "abrmd:bus_type=3Dsession" gives me this.
>
> ERROR: Could not load tcti, got: "abrmd:bus_type=3Dsession"
>
> 2 - bus_name requires a name. The example uses bus_name=3Dcom.example.Foo=
Bar:
> but I doubt foobar is correct.
>
> --
> Ken Goldman kgoldman(a)us.ibm.com
> 914-945-2415 (862-2415)
>

This works for me Ken:

export TPM2TOOLS_TCTI=3D"tabrmd:bus_name=3Dcom.intel.tss2.Tabrmd"

>
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============2255767280681959208==--

