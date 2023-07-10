Return-Path: <william.c.roberts@intel.com>
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDBA1409BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19D7C400E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689000491; x=1720536491;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=+Md+iVXSqUWMjOs7LxMMHjUuqJ+W0BVlKegM4Uq1pHM=;
 b=QUAdfgFx5mxYkJxU11tc3Jaq7Y3pSw+tOupoU3AgGL/hSxMs+d4sNo2a
 jLgNQKbnXaQUUdngvJuL7aMx4xmMmaxlnLyYyzhTca/COpwlgBX8HzI67
 alJ+xTbmpxEg3dxUk2ynaDyH+Ovx+q76kR8ko9CSLGNR+LheMzGuXRHC4
 LpnIuTrZW+4GjdCc8r4FOD7vNZr2dcYJ/kQ6GWeizha3za3940fPXzTT4
 TWeSOn+h+KGTK1D0gXfhMye9JnEECHUSB1g7WYbIzhjDtdDm1r23vFd1a
 SCj8rRPVnZUbYKvj9K01Uz+3ADbBl5irYKe6CVcfXki6WTVPCr5CLpz1z Q==;
From: "Roberts, William C" <william.c.roberts@intel.com>
Date: Mon, 10 Jul 2023 14:47:24 +0000
Message-ID: <SN6PR11MB34377364275DAA59EBA70C34B830A@SN6PR11MB3437.namprd11.prod.outlook.com>
References: <BYAPR15MB285529F9E51DA6DBE54728B7F530A@BYAPR15MB2855.namprd15.prod.outlook.com>
In-Reply-To: <BYAPR15MB285529F9E51DA6DBE54728B7F530A@BYAPR15MB2855.namprd15.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_SN6PR11MB34377364275DAA59EBA70C34B830ASN6PR11MB3437namp_"
MIME-Version: 1.0
Subject: Re: [Tpm2] help regarding how to create NV under platform hierarchy
List-Id: The tpm2 userspace mailing list <tpm2.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/tpm2/>
List-Post: <mailto:tpm2@lists.linuxfoundation.org>
List-Help: <mailto:tpm2-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=subscribe>
To: "tpm2@lists.linuxfoundation.org" <tpm2@lists.linuxfoundation.org>, SAI
 VAMSEE KRISHNA Lankisetti <SAI.VAMSEE.KRISHNA.Lankisetti@ibm.com>
Cc: Ravindra Sure <ravisure@in.ibm.com>

--_000_SN6PR11MB34377364275DAA59EBA70C34B830ASN6PR11MB3437namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

You're trying to define the NV index in the platform hierarchy which is usu=
ally locked out with a password. This is what the -Cp option is doing. Any =
particular reason for that? If you leave off -Cp option or do -Co it will u=
se the owner hierarchy which is usually what normal users use to create NV =
indices but you still need the owner password if it is set.

You can query if the owner password is set by:
tpm2_getcap properties-variable
TPM2_PT_PERMANENT:
  ownerAuthSet:              0
  endorsementAuthSet:        0
  lockoutAuthSet:            0
  reserved1:                 0
  disableClear:              0
  inLockout:                 0
  tpmGeneratedEPS:           1
  reserved2:                 0

<snip>
Note the ownerAuthSet bit under TPM2_PT_PERMANENT. You can pass the passwor=
d for the owner hiearchy if it's set by using the -P (capital P) option.
________________________________
From: Tpm2 <tpm2-bounces@lists.linuxfoundation.org> on behalf of SAI VAMSEE=
 KRISHNA Lankisetti via Tpm2 <tpm2@lists.linuxfoundation.org>
Sent: Monday, July 10, 2023 1:48 AM
To: tpm2@lists.linuxfoundation.org <tpm2@lists.linuxfoundation.org>
Cc: Ravindra Sure <ravisure@in.ibm.com>
Subject: [Tpm2] help regarding how to create NV under platform hierarchy

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


--_000_SN6PR11MB34377364275DAA59EBA70C34B830ASN6PR11MB3437namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
You're trying to define the NV index in the platform hierarchy which is usu=
ally locked out with a password. This is what the -Cp option is doing. Any =
particular reason for that? If you leave off -Cp option or do -Co it will u=
se the owner hierarchy which is
 usually what normal users use to create NV indices but you still need the =
owner password if it is set.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
You can query if the owner password is set by:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
</div>
tpm2_getcap properties-variable
<div>TPM2_PT_PERMANENT:</div>
<div>&nbsp; ownerAuthSet: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0=
</div>
<div>&nbsp; endorsementAuthSet: &nbsp; &nbsp; &nbsp; &nbsp;0</div>
<div>&nbsp; lockoutAuthSet: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0</div=
>
<div>&nbsp; reserved1: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; 0</div>
<div>&nbsp; disableClear: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0=
</div>
<div>&nbsp; inLockout: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; 0</div>
<div>&nbsp; tpmGeneratedEPS: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1</div>
<div>&nbsp; reserved2: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; 0</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
&lt;snip&gt;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Note the ownerAuthSet bit under TPM2_PT_PERMANENT. You can pass the passwor=
d for the owner hiearchy if it's set by using the -P (capital P) option.</d=
iv>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Tpm2 &lt;tpm2-bounces=
@lists.linuxfoundation.org&gt; on behalf of SAI VAMSEE KRISHNA Lankisetti v=
ia Tpm2 &lt;tpm2@lists.linuxfoundation.org&gt;<br>
<b>Sent:</b> Monday, July 10, 2023 1:48 AM<br>
<b>To:</b> tpm2@lists.linuxfoundation.org &lt;tpm2@lists.linuxfoundation.or=
g&gt;<br>
<b>Cc:</b> Ravindra Sure &lt;ravisure@in.ibm.com&gt;<br>
<b>Subject:</b> [Tpm2] help regarding how to create NV under platform hiera=
rchy</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div class=3D"x_elementToProof x_ContentPasted0" style=3D"font-family:Calib=
ri,Arial,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
Hi Folks,</div>
<div class=3D"x_elementToProof x_ContentPasted0" style=3D"font-family:Calib=
ri,Arial,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
I am new to tpm2.</div>
<div class=3D"x_elementToProof x_ContentPasted0" style=3D"font-family:Calib=
ri,Arial,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof x_ContentPasted0" style=3D"font-family:Calib=
ri,Arial,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<p dir=3D"auto" class=3D"x_ContentPasted1">I am trying to create NV index u=
nder platform hierarchy using tpm2-tools but getting below error.<br class=
=3D"x_ContentPasted1">
</p>
<p dir=3D"auto" class=3D"x_ContentPasted1"><code class=3D"x_notranslate x_C=
ontentPasted1">tpm2_nvdefine 0x01000000 -C p -s 32 -a &quot;ppwrite|ppread|=
platformcreate&quot; WARNING:esys:src/tss2-esys/api/Esys_NV_DefineSpace.c:3=
37:Esys_NV_DefineSpace_Finish() Received TPM Error
 ERROR:esys:src/tss2-esys/api/Esys_NV_DefineSpace.c:122:Esys_NV_DefineSpace=
() Esys Finish ErrorCode (0x000009a2) ERROR: Failed to define NV area at in=
dex 0x1000000 ERROR: Esys_NV_DefineSpace(0x9A2) - tpm:session(1):authorizat=
ion failure without DA implications
 ERROR: Failed to create NV index 0x1000000.<br>
<br>
</code></p>
<p dir=3D"auto" class=3D"x_ContentPasted1">need help regarding above error =
and how to create nv index in platform hierarchy<br class=3D"x_ContentPaste=
d1">
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
</div>
</body>
</html>

--_000_SN6PR11MB34377364275DAA59EBA70C34B830ASN6PR11MB3437namp_--
