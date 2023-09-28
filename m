Return-Path: <damiano.turriziani98@gmail.com>
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DFC360F3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C2E160EE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695910159; x=1696514959;
 darn=lists.linuxfoundation.org; 
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=tmtxlBYx4dwSYfP+nOeeDMWbBWq7+dEOTFIwEvmYibU=;
 b=T8Kdkhz0phzOWiGeWLd4zQCdAW6RR015silrN6nDp/L4cCmwwiGRC8vfXMZyaRRpNX
 ur1sAhNqF5QFxm/PbWIO5SMCS9Xbownx8Iux+XEnMx8Z+h5H+2tjNix2kXc6Py/xRvqT
 /Mwc7rcaE/ZF+m/UQVLl2Qij6q+hAzrXlyyORkfkDf+Ki6EVXne7f+hFEas00IS0XVxj
 wpn6Bju7s3oBzZYBP2xJXgUoEqX5xX1csLVx5Jx1mdkoV8axY/9CZutdJrzPLCn2Mfcs
 lIkNxG6yHqosowg/20t/7Abws6VszlfSQN16tIRHbfTmRm6rabskp6hWkfHKdcw52HEp
 WyHg==
MIME-Version: 1.0
From: Damiano Turriziani <damiano.turriziani98@gmail.com>
Date: Thu, 28 Sep 2023 16:09:08 +0200
Message-ID: <CADRyO0iWmTBtnXa9RZVuieobBJrRE6hOU3wKb08xr3B4Fm-Ysw@mail.gmail.com>
Content-Type: multipart/alternative; boundary="00000000000097b11e06066bda74"
Subject: [Tpm2] Creating a Sealed RSA key for an Apache Server
List-Id: The tpm2 userspace mailing list <tpm2.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/tpm2/>
List-Post: <mailto:tpm2@lists.linuxfoundation.org>
List-Help: <mailto:tpm2-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=subscribe>
To: tpm2@lists.linuxfoundation.org

--00000000000097b11e06066bda74
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Folks,


I am a master degree student and my thesis is based on the usage of the
TPM2 and in particular implementing the Sealing operation using the ESYS
API library. My main goal is to protect an RSA private key with the Sealing
operation and try to use it with an Apache server.


I have tried two possible implementations:

   - the first one is based on creating the RSA key using the TPM and
   protecting it with the PCRs values but this implementation has some
   problems which I couldn=E2=80=99t solve and for this reason I tried the =
second
   solution;
   - The second one is based on creating the RSA key without the TPM and
   splitting it in chunks of 128 bytes in order to create multiple sealed
   objects that will be reassembled after the unsealing operation.


For the *first implementation* I made some changes to the *tpm2-openssl*
library in order to directly create an RSA key which depends on the PCRs
values.


The first problem I encountered  is that I had to manually check the status
of the PCRs when the Key was loaded by: creating a new Policy Session,
calling the *PolicyPCR* function (passing an empty *TPM2B_DIGEST*) and
retrieving the Policy Digest and comparing it with the one embedded in the
Key inPublic structure. I know from the documentation that all of these
steps could be avoided by calling the PolicyPCR function and passing it the
Policy Digest of the key so that it automatically checks if the Policy
Digest passed matches the current digest of the selected PCR but I wasn=E2=
=80=99t
able to reproduce this behaviour. Maybe I got the documentation wrong
because every time I try passing that value it returns:* Esys_PolicyPCR()
Esys Finish ErrorCode(0x000001c4) -> tpm:parameter(1):value is out of range
or is not correct for the context.*


The second problem instead was when I started the TLS Server using the* ope=
nssl
s_server -provider tpm2 -provider default -propquery =E2=80=98?provider=3Dt=
pm2=E2=80=99
-accept 4431 -www -key myKey.pem -cert myCert.pem &* I could connect to it
only using* openssl s_client -provider tpm2 -provider default -propquery
=E2=80=98?provider=3Dtpm2=E2=80=99 -connect localhost:4431* even though in =
the test section
of tpm2-openssl the *curl* command is used. Same thing happens if
using *openssl
s_client *without the *-provider tpm2* parameters. In both cases it
returns: *error:02000088:rsa routines::salt length check failed. *


Instead, for the *second implementation* I created an RSA key, I splitted
it in chunks of 128 bytes and for each one of them I created a
sealed-object with the *Esys_Create* function. For each one of them I
retrieved the *outPublic* and the *outPrivate* data when they were created
and saved them in two different files. Because *outPublic* and *outPrivate*
have a fixed size I could retrieve them later when I wanted to unseal the
sealed-objects. So my idea is to make the Apache server accept in input
these two files in order to perform the unsealing and reassembling the RSA
private key.


I wanted to know if there was a better way to do that with respect to these
solutions, because the first one works only with few loopholes as
previously explained while the second solution theoretically works but I
haven=E2=80=99t modified the Apache source code to enable the unsealing of =
the
private key when the Apache Server starts.


Thanks,

Damiano Turriziani

--00000000000097b11e06066bda74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p style=3D"margin:0px;font-stretch:normal;font-size:13px;=
line-height:normal;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:=
none;font-kerning:auto;font-variant-alternates:normal;font-variant-ligature=
s:normal;font-variant-numeric:normal;font-variant-east-asian:normal;font-fe=
ature-settings:normal">Hi Folks,</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal;min-height:15px"><br></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal">I am a master degree student and my thesis is based on the usage of t=
he TPM2 and in particular implementing the Sealing operation using the ESYS=
 API library. My main goal is to protect an RSA private key with the Sealin=
g operation and try to use it with an Apache server.<span class=3D"gmail-Ap=
ple-converted-space">=C2=A0</span></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal;min-height:15px"><br></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal">I have tried two possible implementations:<span class=3D"gmail-Apple-=
converted-space">=C2=A0</span></p>
<ul style=3D"list-style-type:&quot;\002014\0000a0\0000a0&quot;"><li><span s=
tyle=3D"font-family:&quot;Helvetica Neue&quot;;font-size:13px">the first on=
e is based on creating the RSA key using the TPM and protecting it with the=
 PCRs values but this implementation has some problems which I couldn=E2=80=
=99t solve and for this reason I tried the second solution;</span><br></li>=
<li>The<span style=3D"font-family:&quot;Helvetica Neue&quot;;font-size:13px=
"> second one is based on creating the RSA key without the TPM and splittin=
g it in chunks of 128 bytes in order to create multiple sealed objects that=
 will be reassembled after the unsealing operation.</span><span class=3D"gm=
ail-Apple-converted-space" style=3D"font-family:&quot;Helvetica Neue&quot;;=
font-size:13px">=C2=A0</span><br></li>
</ul>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal;min-height:15px"><br></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal">For the <b>first implementation</b> I made some changes to the <i>tpm=
2-openssl</i> library in order to directly create an RSA key which depends =
on the PCRs values.<span class=3D"gmail-Apple-converted-space">=C2=A0</span=
></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal;min-height:15px"><br></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal">The first problem I encountered<span class=3D"gmail-Apple-converted-s=
pace">=C2=A0 </span>is that I had to manually check the status of the PCRs =
when the Key was loaded by: creating a new Policy Session, calling the <i>P=
olicyPCR</i> function (passing an empty <i>TPM2B_DIGEST</i>) and retrieving=
 the Policy Digest and comparing it with the one embedded in the Key inPubl=
ic structure. I know from the documentation that all of these steps could b=
e avoided by calling the PolicyPCR function and passing it the Policy Diges=
t of the key so that it automatically checks if the Policy Digest passed ma=
tches the current digest of the selected PCR but I wasn=E2=80=99t able to r=
eproduce this behaviour. Maybe I got the documentation wrong because every =
time I try passing that value it returns:<i> Esys_PolicyPCR() Esys Finish E=
rrorCode(0x000001c4) -&gt; tpm:parameter(1):value is out of range or is not=
 correct for the context.</i></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal;min-height:15px"><br></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal">The second problem instead was when I started the TLS Server using th=
e<b>=C2=A0openssl s_server -provider tpm2 -provider default -propquery =E2=
=80=98?provider=3Dtpm2=E2=80=99 -accept 4431 -www -key myKey.pem -cert myCe=
rt.pem &amp;</b>=C2=A0I could connect to it only using<b>=C2=A0openssl s_cl=
ient -provider tpm2 -provider default -propquery =E2=80=98?provider=3Dtpm2=
=E2=80=99 -connect localhost:4431</b>=C2=A0even though in the test section =
of tpm2-openssl the <b>curl</b>=C2=A0command is used. Same thing happens if=
 using <b>openssl s_client=C2=A0</b>without the <b>-provider tpm2</b>=C2=A0=
parameters. In both cases it returns: <i>error:02000088:rsa routines::salt =
length check failed.<span class=3D"gmail-Apple-converted-space">=C2=A0</spa=
n></i></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal;min-height:15px"><br></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal">Instead, for the <b>second implementation</b> I created an RSA key, I=
 splitted it in chunks of 128 bytes and for each one of them I created a se=
aled-object with the <i>Esys_Create</i> function. For each one of them I re=
trieved the <i>outPublic</i> and the <i>outPrivate</i> data when they were =
created and saved them in two different files. Because <i>outPublic</i> and=
 <i>outPrivate</i> have a fixed size I could retrieve them later when I wan=
ted to unseal the sealed-objects. So my idea is to make the Apache server a=
ccept in input these two files in order to perform the unsealing and reasse=
mbling the RSA private key.</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal;min-height:15px"><br></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal">I wanted to know if there was a better way to do that with respect to=
 these solutions, because the first one works only with few loopholes as pr=
eviously explained while the second solution theoretically works but I have=
n=E2=80=99t modified the Apache source code to enable the unsealing of the =
private key when the Apache Server starts.</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal;min-height:15px"><br></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal">Thanks,</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal">Damiano Turriziani</p>
<br class=3D"gmail-Apple-interchange-newline"></div>

--00000000000097b11e06066bda74--
