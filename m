Return-Path: <SAI.VAMSEE.KRISHNA.Lankisetti@ibm.com>
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CC3B40291
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6561A4022E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=pp1;
 bh=k0eBchRG8dlVucdKQEzNzcvMnBa44Hr8vvrHv795c4Q=;
 b=F/wB/SFrNkSpay7Pzh2IV5hIX0YeKljk7bvkXr3gRxGTmqppy5SiyHPcoEdqBXzg+I5l
 BMHdqwGF+hOBSdcUOXDJTHOFL9g8H1c7U2UdMlJ7L0mVTYDx8bwruaejuWAmHkVTSDdM
 x05VHRyZu0Gh7XqUTVP0svZ6+liw+KXsu/OzNkqkbBlLslD8VJbb8dcpedW3PZ0O76/4
 Fhynd1C2SKvpZF/xr6rh8ImFJG8cvmPGVd+alXC1A36nxyBt7cnHJxqDoYMB90T9qMz2
 m5QLWIO2oFiUz49PxKXG+Otnzor19hbLE3OIcOcyrSwwpQ4eWBt9J8836MEzVQqTCsaA cA== 
From: SAI VAMSEE KRISHNA Lankisetti <SAI.VAMSEE.KRISHNA.Lankisetti@ibm.com>
Date: Mon, 10 Jul 2023 06:48:10 +0000
Message-ID: <BYAPR15MB285529F9E51DA6DBE54728B7F530A@BYAPR15MB2855.namprd15.prod.outlook.com>
Content-Language: en-IN
Content-Type: multipart/alternative;
 boundary="_000_BYAPR15MB285529F9E51DA6DBE54728B7F530ABYAPR15MB2855namp_"
MIME-Version: 1.0
Subject: [Tpm2] help regarding how to create NV under platform hierarchy
List-Id: The tpm2 userspace mailing list <tpm2.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/tpm2/>
List-Post: <mailto:tpm2@lists.linuxfoundation.org>
List-Help: <mailto:tpm2-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=subscribe>
To: "tpm2@lists.linuxfoundation.org" <tpm2@lists.linuxfoundation.org>
Cc: Ravindra Sure <ravisure@in.ibm.com>

--_000_BYAPR15MB285529F9E51DA6DBE54728B7F530ABYAPR15MB2855namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Folks,
I am new to tpm2.


I am trying to create NV index under platform hierarchy using tpm2-tools bu=
t getting below error.

tpm2_nvdefine 0x01000000 -C p -s 32 -a "ppwrite|ppread|platformcreate" WARN=
ING:esys:src/tss2-esys/api/Esys_NV_DefineSpace.c:337:Esys_NV_DefineSpace_Fi=
nish() Received TPM Error ERROR:esys:src/tss2-esys/api/Esys_NV_DefineSpace.=
c:122:Esys_NV_DefineSpace() Esys Finish ErrorCode (0x000009a2) ERROR: Faile=
d to define NV area at index 0x1000000 ERROR: Esys_NV_DefineSpace(0x9A2) - =
tpm:session(1):authorization failure without DA implications ERROR: Failed =
to create NV index 0x1000000.


need help regarding above error and how to create nv index in platform hier=
archy
if I create nv index in owner hierarchy tmp2_clear will remove the NV index=
 which i don't want to happen so I am trying to create in platform hierarch=
y.

are there any ways to store a symmetric key in TPM for external use other t=
han nv index?

Thanks,
Vamsee Krishna.


--_000_BYAPR15MB285529F9E51DA6DBE54728B7F530ABYAPR15MB2855namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Hi Folks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
I am new to tpm2.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<p dir=3D"auto" class=3D"ContentPasted1">I am trying to create NV index und=
er platform hierarchy using tpm2-tools but getting below error.<br class=3D=
"ContentPasted1">
</p>
<p dir=3D"auto" class=3D"ContentPasted1"><code class=3D"notranslate Content=
Pasted1">tpm2_nvdefine 0x01000000 -C p -s 32 -a &quot;ppwrite|ppread|platfo=
rmcreate&quot; WARNING:esys:src/tss2-esys/api/Esys_NV_DefineSpace.c:337:Esy=
s_NV_DefineSpace_Finish() Received TPM Error ERROR:esys:src/tss2-esys/api/E=
sys_NV_DefineSpace.c:122:Esys_NV_DefineSpace()
 Esys Finish ErrorCode (0x000009a2) ERROR: Failed to define NV area at inde=
x 0x1000000 ERROR: Esys_NV_DefineSpace(0x9A2) - tpm:session(1):authorizatio=
n failure without DA implications ERROR: Failed to create NV index 0x100000=
0.<br>
<br>
</code></p>
<p dir=3D"auto" class=3D"ContentPasted1">need help regarding above error an=
d how to create nv index in platform hierarchy<br class=3D"ContentPasted1">
if I create nv index in owner hierarchy tmp2_clear will remove the NV index=
 which i don't want to happen so I am trying to create in platform hierarch=
y.<br>
<br>
are there any ways to store a symmetric key in TPM for external use other t=
han nv index?<br>
<br>
Thanks,<br>
Vamsee Krishna.<br>
</p>
<br>
</div>
</body>
</html>

--_000_BYAPR15MB285529F9E51DA6DBE54728B7F530ABYAPR15MB2855namp_--
