Return-Path: <SAI.VAMSEE.KRISHNA.Lankisetti@ibm.com>
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F3A681ED2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1097081EB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=pp1; bh=NRqUU1KZyMCfkL5DSC2Xtt+fOfEyWyatWI2hau7TY6c=;
 b=Tx12mezpSW5Ib4IzxxI1ST1RAJjMbGhcsAeErrhhV8kycVXq0V2NUrEyQADADIlnyhVl
 ZmrPbH6jC1PIf5VYMlZ8qYLhu9yvCFo9cYZj2qeKyVmDK4uze/qSbHTULGEV1pmjmjp+
 VY3P7J/vXbJDSGUhiQjmihHS/C+VX7gUgOR8Xb5DhvGQCeI0onDoTnc6fnjY/tcQWpPx
 m4EIYFPVGUwi+GG5Gx+YP1SDrB6LF/6UwtYc7sd3CO6vm5RyX4+mLqa1AFXYYOmDe3hm
 iubXz6LNWBgxkh+eyrtrMAMbrHnkS5bYsWHwhP/EsuIILM3wwg3tpGZSdyfEpaLr+cmi 4Q== 
From: SAI VAMSEE KRISHNA Lankisetti <SAI.VAMSEE.KRISHNA.Lankisetti@ibm.com>
Date: Tue, 11 Jul 2023 13:39:12 +0000
Message-ID: <BYAPR15MB2855474C5F9836B62E5DA2E6F531A@BYAPR15MB2855.namprd15.prod.outlook.com>
References: <BYAPR15MB285529F9E51DA6DBE54728B7F530A@BYAPR15MB2855.namprd15.prod.outlook.com>
 <SN6PR11MB34377364275DAA59EBA70C34B830A@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: <SN6PR11MB34377364275DAA59EBA70C34B830A@SN6PR11MB3437.namprd11.prod.outlook.com>
Content-Language: en-IN
Content-Type: multipart/alternative;
 boundary="_000_BYAPR15MB2855474C5F9836B62E5DA2E6F531ABYAPR15MB2855namp_"
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
To: "Roberts, William C" <william.c.roberts@intel.com>, "tpm2@lists.linuxfoundation.org" <tpm2@lists.linuxfoundation.org>
Cc: Ravindra Sure <ravisure@in.ibm.com>

--_000_BYAPR15MB2855474C5F9836B62E5DA2E6F531ABYAPR15MB2855namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi ,
   I am trying to use TPM to store symmetric keys and retrieve them from TP=
M whenever needed. First, I created a symmetric in TPM and tried to use it,=
 but I came to know that private key which is the symmetric key doesn't com=
e out of TPM. Then I thought NV index will be good to store the keys with s=
ome authentication. But NV Index defined in owner hierarchy is not persiste=
nt with TPM clear and reset. I have read in below link that NV index can't =
be cleared using tpm2_clear when defined in platform hierarchy . But unable=
 to create it .
https://github.com/Infineon/optiga-tpm-cheatsheet#nv-storage

I have few questions

  1.  is there way to access randomly set platform hierarchy authentication=
 through TPM software stack ?
  2.  does NV index defined through platform hierarchy is persistent unless=
 we undefine it manually ?
  3.  I tried to use tpm2_clearcontrol to disable tpm2_clear but it also re=
quires
platform authentication . can we disable clear from owner hierarchy ?
  4.  I came across other solution to store keys using seal and unseal from=
 below links
https://github.com/tpm2-software/tpm2-tools/issues/3246

https://github.com/tpm2-software/tpm2-tools/issues/3180#issuecomment-135499=
6963

  *
can you let me know what sealing and unsealing the key means here?
  *
where will the sealed data reside in TPM ?
  *
can we get a sealed data object so that after TPM clear or reset it can be =
loaded into TPM again and used for unsealing ?


Thanks,
Vamsee Krishna.

________________________________
From: Roberts, William C <william.c.roberts@intel.com>
Sent: 10 July 2023 20:17
To: tpm2@lists.linuxfoundation.org <tpm2@lists.linuxfoundation.org>; SAI VA=
MSEE KRISHNA Lankisetti <SAI.VAMSEE.KRISHNA.Lankisetti@ibm.com>
Cc: Ravindra Sure <ravisure@in.ibm.com>
Subject: [EXTERNAL] Re: [Tpm2] help regarding how to create NV under platfo=
rm hierarchy

You're trying to define the NV index in the platform hierarchy which is usu=
ally locked out with a password. This is what the -Cp option is doing. Any =
particular reason for that? If you leave off -Cp option or do -Co it will u=
se the owner hierarchy
ZjQcmQRYFpfptBannerStart
This Message Is From an External Sender
This message came from outside your organization.
<https://us-phishalarm-ewt.proofpoint.com/EWT/v1/PjiDSg!1e-trX6zRvm6lYv7uAE=
lbjDV-N1WPgO-Z4rd5Cvb-R7oRVgpFx77CzoyPG6-k0ArvQdtiFKelJJQC_MYkaTD0hOPIiXdee=
NnWjy7rvV08EgKHEOlpNl6WqVbTe9uPO-7HENoanchZZr0XCkxSNdK6wWs$>
Report Suspicious

ZjQcmQRYFpfptBannerEnd
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


--_000_BYAPR15MB2855474C5F9836B62E5DA2E6F531ABYAPR15MB2855namp_
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
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi ,<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
&nbsp;&nbsp; I am trying to use TPM to store symmetric keys and retrieve th=
em from TPM whenever needed. First, I created a symmetric in TPM and tried =
to use it, but I came to know that private key which is the symmetric key d=
oesn't come out of TPM. Then I thought NV
 index will be good to store the keys with some authentication. But NV Inde=
x defined in owner hierarchy is not persistent with TPM clear and reset. I =
have read in below link that NV index can't be cleared using tpm2_clear whe=
n defined in platform hierarchy
 . But unable to create it .<br>
<a href=3D"https://github.com/Infineon/optiga-tpm-cheatsheet#nv-storage" id=
=3D"LPNoLPOWALinkPreview">https://github.com/Infineon/optiga-tpm-cheatsheet=
#nv-storage</a><br>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview_3 _EReadonl=
y_1"></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
I have few questions<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<ol data-editing-info=3D"{&quot;orderedStyleType&quot;:1,&quot;unorderedSty=
leType&quot;:1}">
<li style=3D"list-style-type: &quot;1. &quot;;" class=3D"ContentPasted1">is=
 there way to access randomly set platform hierarchy authentication through=
 TPM software stack ?</li><li style=3D"list-style-type: &quot;2. &quot;;">d=
oes NV index defined through platform hierarchy is persistent unless we und=
efine it manually ?</li><li style=3D"list-style-type: &quot;3. &quot;;">I t=
ried to use <span class=3D"ContentPasted2" lang=3D"en-US">
tpm2_clearcontrol</span> to disable tpm2_clear but it also requires<br>
platform authentication . can we disable clear from owner hierarchy ?</li><=
li style=3D"list-style-type: &quot;4. &quot;;" class=3D"ContentPasted3 Cont=
entPasted4">I came across other solution to store keys using seal and unsea=
l from below links<br>
<div><a href=3D"https://github.com/tpm2-software/tpm2-tools/issues/3246" id=
=3D"LPNoLPOWALinkPreview_1">https://github.com/tpm2-software/tpm2-tools/iss=
ues/3246</a><br>
</div>
<br>
<div><a href=3D"https://github.com/tpm2-software/tpm2-tools/issues/3180#iss=
uecomment-1354996963" id=3D"LPNoLPOWALinkPreview_2">https://github.com/tpm2=
-software/tpm2-tools/issues/3180#issuecomment-1354996963</a></div>
</li></ol>
<ul data-editing-info=3D"{&quot;orderedStyleType&quot;:1,&quot;unorderedSty=
leType&quot;:1}">
<li style=3D"list-style-type: disc;" class=3D"ContentPasted3 ContentPasted4=
">
<div>can you let me know what sealing and unsealing the key means here?</di=
v>
</li><li style=3D"list-style-type: disc;" class=3D"ContentPasted3 ContentPa=
sted4">
<div class=3D"ContentPasted5">where will the sealed data reside in TPM ?</d=
iv>
</li><li style=3D"list-style-type: disc;" class=3D"ContentPasted3 ContentPa=
sted4">
<div class=3D"ContentPasted5">can we get a sealed data object so that after=
 TPM clear or reset it can be loaded into TPM again and used for unsealing =
?<br>
</div>
<br>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview_4 _EReadonl=
y_1"></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview_5 _EReadonl=
y_1"></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,<br>
Vamsee Krishna.<br>
</div>
</li></ul>
</div>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size: 11pt; color=
: rgb(0, 0, 0);" face=3D"Calibri, sans-serif"><b>From:</b> Roberts, William=
 C &lt;william.c.roberts@intel.com&gt;<br>
<b>Sent:</b> 10 July 2023 20:17<br>
<b>To:</b> tpm2@lists.linuxfoundation.org &lt;tpm2@lists.linuxfoundation.or=
g&gt;; SAI VAMSEE KRISHNA Lankisetti &lt;SAI.VAMSEE.KRISHNA.Lankisetti@ibm.=
com&gt;<br>
<b>Cc:</b> Ravindra Sure &lt;ravisure@in.ibm.com&gt;<br>
<b>Subject:</b> [EXTERNAL] Re: [Tpm2] help regarding how to create NV under=
 platform hierarchy</font>
<div>&nbsp;</div>
</div>
<div>
<div style=3D"display: none !important; visibility: hidden; font-size: 1px;=
 line-height: 1px; height: 0px; max-height: 0px; opacity: 0; overflow: hidd=
en; color: rgb(255, 255, 255);">
You're trying to define the NV index in the platform hierarchy which is usu=
ally locked out with a password. This is what the -Cp option is doing. Any =
particular reason for that? If you leave off -Cp option or do -Co it will u=
se the owner hierarchy
</div>
<div style=3D"display: none !important; visibility: hidden; font-size: 1px;=
 line-height: 1px; height: 0px; max-height: 0px; opacity: 0; overflow: hidd=
en; color: rgb(255, 255, 255);">
ZjQcmQRYFpfptBannerStart</div>
<div dir=3D"ltr" id=3D"x_pfptBanner5ee1flv" style=3D"visibility: visible !i=
mportant; opacity: 1 !important; max-width: none !important; max-height: no=
ne !important; display: block !important; text-align: left !important; marg=
in: 16px 0px !important; padding: 8px 16px !important; border-radius: 4px !=
important; min-width: 200px !important; border-top: 4px solid rgb(144, 164,=
 174) !important; background-color: rgb(208, 216, 220);" lang=3D"en">
<div id=3D"x_pfptBanner5ee1flv" style=3D"visibility: visible !important; op=
acity: 1 !important; max-height: none !important; float: left !important; d=
isplay: block !important; margin: 0px 0px 1px !important; max-width: 600px =
!important; background-color: rgb(208, 216, 220);">
<div id=3D"x_pfptBanner5ee1flv" style=3D"opacity: 1 !important; max-width: =
none !important; max-height: none !important; display: block !important; vi=
sibility: visible !important; font-family: &quot;Arial&quot;, sans-serif !i=
mportant; font-weight: bold !important; font-size: 14px !important; line-he=
ight: 18px !important; color: rgb(0, 0, 0); background-color: rgb(208, 216,=
 220);">
This Message Is From an External Sender </div>
<div id=3D"x_pfptBanner5ee1flv" style=3D"opacity: 1 !important; max-width: =
none !important; max-height: none !important; display: block !important; vi=
sibility: visible !important; font-weight: normal; font-family: &quot;Arial=
&quot;, sans-serif !important; font-size: 12px !important; line-height: 18p=
x !important; margin-top: 2px !important; color: rgb(0, 0, 0); background-c=
olor: rgb(208, 216, 220);">
This message came from outside your organization. </div>
</div>
<div id=3D"x_pfptBanner5ee1flv" style=3D"visibility: visible !important; op=
acity: 1 !important; max-width: none !important; max-height: none !importan=
t; float: right !important; display: block !important; margin: 0px 0px 0px =
16px !important; text-align: right !important; width: fit-content !importan=
t; background-color: rgb(208, 216, 220);">
<a href=3D"https://us-phishalarm-ewt.proofpoint.com/EWT/v1/PjiDSg!1e-trX6zR=
vm6lYv7uAElbjDV-N1WPgO-Z4rd5Cvb-R7oRVgpFx77CzoyPG6-k0ArvQdtiFKelJJQC_MYkaTD=
0hOPIiXdeeNnWjy7rvV08EgKHEOlpNl6WqVbTe9uPO-7HENoanchZZr0XCkxSNdK6wWs$" data=
-auth=3D"NotApplicable" id=3D"x_pfptBanner5ee1flv" style=3D"visibility: vis=
ible !important; opacity: 1 !important; max-width: none !important; max-hei=
ght: none !important; display: inline-block !important; text-decoration: no=
ne; background-color: rgb(208, 216, 220);">
<div class=3D"x_pfptPrimaryButton5ee1flv" style=3D"display: inline-block !i=
mportant; visibility: visible !important; opacity: 1 !important; font-famil=
y: &quot;Arial&quot;, sans-serif !important; font-size: 14px !important; fo=
nt-weight: normal !important; text-decoration: none !important; border-radi=
us: 2px !important; padding: 7.5px 16px !important; margin: 3px 0px 3px 16p=
x !important; white-space: nowrap !important; width: fit-content !important=
; border: 1px solid rgb(102, 102, 102); color: rgb(0, 0, 0);">
Report&nbsp;Suspicious </div>
</a></div>
<div style=3D"clear:both!important; display:block!important; visibility:hid=
den!important; line-height:0!important; font-size:0.01px!important; height:=
0px">
&nbsp;</div>
</div>
<div style=3D"display: none !important; visibility: hidden; font-size: 1px;=
 line-height: 1px; height: 0px; max-height: 0px; opacity: 0; overflow: hidd=
en; color: rgb(255, 255, 255);">
ZjQcmQRYFpfptBannerEnd</div>
<div class=3D"x_elementToProof" style=3D"font-family: Calibri, Arial, Helve=
tica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
You're trying to define the NV index in the platform hierarchy which is usu=
ally locked out with a password. This is what the -Cp option is doing. Any =
particular reason for that? If you leave off -Cp option or do -Co it will u=
se the owner hierarchy which is
 usually what normal users use to create NV indices but you still need the =
owner password if it is set.</div>
<div class=3D"x_elementToProof" style=3D"font-family: Calibri, Arial, Helve=
tica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family: Calibri, Arial, Helve=
tica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
You can query if the owner password is set by:</div>
<div class=3D"x_elementToProof x_ContentPasted0" style=3D"font-family: Cali=
bri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
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
<div class=3D"x_elementToProof x_ContentPasted0" style=3D"font-family: Cali=
bri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"x_elementToProof x_ContentPasted0" style=3D"font-family: Cali=
bri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&lt;snip&gt;</div>
<div class=3D"x_elementToProof x_ContentPasted0" style=3D"font-family: Cali=
bri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Note the ownerAuthSet bit under TPM2_PT_PERMANENT. You can pass the passwor=
d for the owner hiearchy if it's set by using the -P (capital P) option.</d=
iv>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size: 11pt; col=
or: rgb(0, 0, 0);" face=3D"Calibri, sans-serif"><b>From:</b> Tpm2 &lt;tpm2-=
bounces@lists.linuxfoundation.org&gt; on behalf of SAI VAMSEE KRISHNA Lanki=
setti via Tpm2 &lt;tpm2@lists.linuxfoundation.org&gt;<br>
<b>Sent:</b> Monday, July 10, 2023 1:48 AM<br>
<b>To:</b> tpm2@lists.linuxfoundation.org &lt;tpm2@lists.linuxfoundation.or=
g&gt;<br>
<b>Cc:</b> Ravindra Sure &lt;ravisure@in.ibm.com&gt;<br>
<b>Subject:</b> [Tpm2] help regarding how to create NV under platform hiera=
rchy</font>
<div>&nbsp;</div>
</div>
<div dir=3D"ltr">
<div class=3D"x_x_elementToProof x_x_ContentPasted0" style=3D"font-family: =
Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;">
Hi Folks,</div>
<div class=3D"x_x_elementToProof x_x_ContentPasted0" style=3D"font-family: =
Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;">
I am new to tpm2.</div>
<div class=3D"x_x_elementToProof x_x_ContentPasted0" style=3D"font-family: =
Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;">
<br>
</div>
<div class=3D"x_x_elementToProof x_x_ContentPasted0" style=3D"font-family: =
Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;">
<p dir=3D"auto" class=3D"x_x_ContentPasted1" style=3D"margin-top: 0px; marg=
in-bottom: 0px;margin-top: 0px; margin-bottom: 0px;">
I am trying to create NV index under platform hierarchy using tpm2-tools bu=
t getting below error.<br class=3D"x_x_ContentPasted1">
</p>
<p dir=3D"auto" class=3D"x_x_ContentPasted1" style=3D"margin-top: 0px; marg=
in-bottom: 0px;margin-top: 0px; margin-bottom: 0px;">
<code class=3D"x_x_notranslate x_x_ContentPasted1">tpm2_nvdefine 0x01000000=
 -C p -s 32 -a &quot;ppwrite|ppread|platformcreate&quot; WARNING:esys:src/t=
ss2-esys/api/Esys_NV_DefineSpace.c:337:Esys_NV_DefineSpace_Finish() Receive=
d TPM Error ERROR:esys:src/tss2-esys/api/Esys_NV_DefineSpace.c:122:Esys_NV_=
DefineSpace()
 Esys Finish ErrorCode (0x000009a2) ERROR: Failed to define NV area at inde=
x 0x1000000 ERROR: Esys_NV_DefineSpace(0x9A2) - tpm:session(1):authorizatio=
n failure without DA implications ERROR: Failed to create NV index 0x100000=
0.<br>
<br>
</code></p>
<p dir=3D"auto" class=3D"x_x_ContentPasted1" style=3D"margin-top: 0px; marg=
in-bottom: 0px;margin-top: 0px; margin-bottom: 0px;">
need help regarding above error and how to create nv index in platform hier=
archy<br class=3D"x_x_ContentPasted1">
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
</div>
</body>
</html>

--_000_BYAPR15MB2855474C5F9836B62E5DA2E6F531ABYAPR15MB2855namp_--
