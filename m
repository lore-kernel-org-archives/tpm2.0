Return-Path: <william.c.roberts@intel.com>
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D6518200F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F67D81EEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689085615; x=1720621615;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=17HVoPdIvRoumxn3Vs7XCF8Y4QFi1ahHRdMxzgxWVZk=;
 b=ionkim50DLG4+lKiWRdojjjBGLJc66adKV7Svp0E59g9UC4p/UZN9cf8
 1d4ID1HpRmRkOOtGYR0/M9seIghv3NTu446QpBOeyBYH5rkdWbpiKRZti
 fN8BtPqNEoCzT8qoSygpWHDU+bAKOlK0we5zWUxHbzFJktMFx5HH2Y2Ed
 AXhxzbFPLFbAGsJJg3o8H/XykZOJfC7H4lGG9FItmvnG/EljOU4e4s1rq
 b1r75w+CM80YcQ0vBAaDoztAisKHU5cilzDreQc5WeHXjprxIdQGqgL5X
 eMv8/QGvus00C+0J0Bdn0UdRh5NFfAv9/mig4aWkrzbNOerMhRPTldqsp w==;
From: "Roberts, William C" <william.c.roberts@intel.com>
Date: Tue, 11 Jul 2023 14:26:50 +0000
Message-ID: <SN6PR11MB343780BFD56FE3EDFE29E872B831A@SN6PR11MB3437.namprd11.prod.outlook.com>
References: <BYAPR15MB285529F9E51DA6DBE54728B7F530A@BYAPR15MB2855.namprd15.prod.outlook.com>
 <SN6PR11MB34377364275DAA59EBA70C34B830A@SN6PR11MB3437.namprd11.prod.outlook.com>
 <BYAPR15MB2855474C5F9836B62E5DA2E6F531A@BYAPR15MB2855.namprd15.prod.outlook.com>
In-Reply-To: <BYAPR15MB2855474C5F9836B62E5DA2E6F531A@BYAPR15MB2855.namprd15.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_SN6PR11MB343780BFD56FE3EDFE29E872B831ASN6PR11MB3437namp_"
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
To: SAI VAMSEE KRISHNA Lankisetti <SAI.VAMSEE.KRISHNA.Lankisetti@ibm.com>, "tpm2@lists.linuxfoundation.org" <tpm2@lists.linuxfoundation.org>
Cc: Ravindra Sure <ravisure@in.ibm.com>

--_000_SN6PR11MB343780BFD56FE3EDFE29E872B831ASN6PR11MB3437namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Let me provide some context on the behavior of the TPM before I answer your=
 questions.

Generally speaking, the platform hierarchy is unavailable except for early =
boot firmware. Typically, the way
folks store and retrieve data, like a symmetric key, is to use tpm2_create =
to create a sealing key and then
use tpm2_unseal to unseal it. This is how your disk encryption keys are sto=
red.

The other thing to understand is how the TPM organizes objects. The TPM has=
 four hierarchies, they are
owner, platform, endorsement and null.
owner - TPM owner, this is where most user data is stored
platform - OS and below usage typically
endorsement - privacy admin
null - ephemeral usages

Each one of these hierarchies has a seed which is used to generate primary =
objects, tpm2_createprimary. Given the same
seed and the same inputs to tpm2_createprimary, and you get the same key. T=
he primary keys are stable, until the seed is changed.
Below a primary object can be other objects in an arbitrarily deep key hier=
archy shaped like a tree. tpm2_create, will create objects under an existin=
g object in this hierarchy and any of these objects can be loading into the=
 TPM using tpm2_load. This is the typical and preferred model to using keys=
. There is typically a persistent primary key in the owner hierarchy at add=
ress 0x81010001 which is referred to as the Storage Root Key or SRK. This S=
RK is a scratch space for folks to store keys as there is no need for any p=
asswords like the owner hierarchy password. Consider that a user making a k=
ey in the TPM may not have access to hierarchy passwords.
You can move keys into NV space an either the owner or platform hierarchies=
 using tpm2_evictcontrol. This requires that hierarchies authorization and =
NV space is scarce, so it's frowned upon. It's better to use tpm2_load and =
load the key when you want to use it, this is also called a transient objec=
t. The metadata that is loaded is safe to store on disk with appropriate pe=
rmissions defined for the threat model.


  1.  Question: is there way to access randomly set platform hierarchy auth=
entication through TPM software stack ?
Answer: Yes, the code allows it, but you need that hierarchy auth, so in pr=
actice it's not feasable
  2.  Question: does NV index defined through platform hierarchy is persist=
ent unless we undefine it manually ?
Answer: Yes
  3.  Question: I tried to use tpm2_clearcontrol to disable tpm2_clear but =
it also requires
platform authentication . can we disable clear from owner hierarchy ?
Answer: No, but lockout authorization can be used here as well, same for tp=
m2_clear
  4.
Question: I came across other solution to store keys using seal and unseal =
from below links
    <snip>
     *
Question: can you let me know what sealing and unsealing the key means here=
?
Answer: Sealing means creating an object with arbitrary data that can be un=
sealed later. It's created with tpm2_create with the -i option. You can ret=
rieve the data with tpm2_unseal.
     *
Question: where will the sealed data reside in TPM ?
Answer: Under the parent object in the aforementioned key hierachy. The par=
ent key,/object aka a storage key, is used to protect the child object/key =
data following the object protectiosn disucuseed in part 1 of the TPM libra=
ry architecture specification. See link below. See section 22.
     *
Question: can we get a sealed data object so that after TPM clear or reset =
it can be loaded into TPM again and used for unsealing ?
Answer: If the parent object(s) are destroyed the seal object is unloadable=
. Ie if the primary seed for the hierarchy changes, it cannot be loaded. Re=
member, primary keys are stable, so deleting a primary key won't make the o=
bject unloadable.

Typically, folks use the SRK for the parent and define everything in that h=
ierarchy if you're not firmware vendor. This is usually not a problem. I gu=
ess we would need to understand exactly what you're trying to do to advise =
another solution. If it's not consumable for the general public mailing lis=
t, we could do a direct talk off list.

Bill

Part 1 of the TPM Spec:
https://trustedcomputinggroup.org/wp-content/uploads/TCG_TPM2_r1p59_Part1_A=
rchitecture_pub.pdf



________________________________
From: SAI VAMSEE KRISHNA Lankisetti <SAI.VAMSEE.KRISHNA.Lankisetti@ibm.com>
Sent: Tuesday, July 11, 2023 8:39 AM
To: Roberts, William C <william.c.roberts@intel.com>; tpm2@lists.linuxfound=
ation.org <tpm2@lists.linuxfoundation.org>
Cc: Ravindra Sure <ravisure@in.ibm.com>
Subject: Re: [Tpm2] help regarding how to create NV under platform hierarch=
y

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


--_000_SN6PR11MB343780BFD56FE3EDFE29E872B831ASN6PR11MB3437namp_
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
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Let me provide some context on the behavior of the TPM before I answer your=
 questions.</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Generally speaking, the platform hierarchy is unavailable except for early =
boot firmware. Typically, the way</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
folks store and retrieve data, like a symmetric key, is to use tpm2_create =
to create a sealing key and then</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
use tpm2_unseal to unseal it. This is how your disk encryption keys are sto=
red.</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
The other thing to understand is how the TPM organizes objects. The TPM has=
 four hierarchies, they are</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
owner, platform, endorsement and null.&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
owner - TPM owner, this is where most user data is stored</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
platform - OS and below usage typically</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
endorsement - privacy admin</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
null - ephemeral usages</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Each one of these hierarchies has a seed which is used to generate primary =
objects, tpm2_createprimary. Given the same</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
seed and the same inputs to tpm2_createprimary, and you get the same key. T=
he primary keys are stable, until the seed is changed.</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Below a primary object can be other objects in an arbitrarily deep key hier=
archy shaped like a tree. tpm2_create, will create objects under an existin=
g object in this hierarchy and any of these objects can&nbsp;<span class=3D=
"ContentPasted0" style=3D"font-family: Calibri, Arial, Helvetica, sans-seri=
f; font-size: 12pt; color: rgb(0, 0, 0);">be
 loading into the TPM using tpm2_load. This is the typical and preferred mo=
del to using keys. There is typically a persistent primary key in the owner=
 hierarchy at address&nbsp;0x81010001 which is referred to as the Storage R=
oot Key or SRK. This SRK is a scratch
 space for folks to store keys as there is no need for any passwords like t=
he owner hierarchy password. Consider that a user making a key in the TPM m=
ay not have access to hierarchy passwords.</span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">You can move keys into&nbsp;</span><span sty=
le=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; =
color: rgb(0, 0, 0);">NV space an either
 the owner or platform hierarchies using tpm2_evictcontrol. This requires t=
hat hierarchies authorization and NV space is scarce, so it's frowned upon.=
 It's better to use tpm2_load and load the key when you want to use it, thi=
s is also called a transient object.
 The metadata that is loaded is safe to store on disk with appropriate perm=
issions defined for the threat model.</span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<ol data-editing-info=3D"{&quot;orderedStyleType&quot;:1,&quot;unorderedSty=
leType&quot;:1}" style=3D"background-color: rgb(255, 255, 255);" data-listc=
hain=3D"__List_Chain_737">
<li class=3D"x_ContentPasted1 ContentPasted1" style=3D"list-style-type: &qu=
ot;1. &quot;; margin: 0in 0in 0in -0.25in;">
Question: is there way to access randomly set platform hierarchy authentica=
tion through TPM software stack ?<br>
Answer: Yes, the code allows it, but you need that hierarchy auth, so in pr=
actice it's not feasable</li><li class=3D"x_ContentPasted1 ContentPasted1" =
style=3D"list-style-type: &quot;2. &quot;; margin: 0in 0in 0in -0.25in;">
Question: does NV index defined through platform hierarchy is persistent un=
less we undefine it manually ?<br>
Answer: Yes</li><li class=3D"x_ContentPasted1 ContentPasted1 ContentPasted2=
" style=3D"list-style-type: &quot;3. &quot;; margin: 0in 0in 0in -0.25in;">
Question:&nbsp;I tried to use<span class=3D"ContentPasted2">&nbsp;</span><s=
pan class=3D"x_ContentPasted2 ContentPasted2" lang=3D"en-US" style=3D"margi=
n:0px">tpm2_clearcontrol</span><span class=3D"ContentPasted2">&nbsp;</span>=
to disable tpm2_clear but it also requires<br class=3D"ContentPasted2">
platform authentication . can we disable clear from owner hierarchy ?<br>
Answer: No, but lockout authorization can be used here as well, same for tp=
m2_clear</li><li class=3D"x_ContentPasted1 ContentPasted1 ContentPasted2" s=
tyle=3D"list-style-type: &quot;4. &quot;; margin: 0in 0in 0in -0.25in;">
<div>Question:&nbsp;<span style=3D"display: inline !important; background-c=
olor: rgb(255, 255, 255);" class=3D"ContentPasted3">I came across other sol=
ution to store keys using seal and unseal from below links<br>
</span></div>
<div><span style=3D"display: inline !important; background-color: rgb(255, =
255, 255);" class=3D"ContentPasted3">&nbsp; &nbsp; &lt;snip&gt;</span></div=
>
</li><ol style=3D"list-style-type: lower-alpha;">
<li class=3D"x_ContentPasted1 ContentPasted1 ContentPasted2" style=3D"margi=
n: 0in 0in 0in -0.25in;">
<div><span style=3D"display: inline !important; background-color: rgb(255, =
255, 255);" class=3D"ContentPasted3"><span style=3D"margin:0px" class=3D"Co=
ntentPasted4">Question: can you let me know what sealing and unsealing the =
key means here?<br>
</span></span></div>
<div>Answer: Sealing means creating an object with arbitrary data that can =
be unsealed later. It's created with tpm2_create with the -i option. You ca=
n retrieve the data with tpm2_unseal.</div>
</li><li class=3D"x_ContentPasted1 ContentPasted1 ContentPasted2" style=3D"=
margin: 0in 0in 0in -0.25in;">
<div><span style=3D"display: inline !important; background-color: rgb(255, =
255, 255);" class=3D"ContentPasted3"><span style=3D"margin:0px" class=3D"Co=
ntentPasted4"><span class=3D"x_ContentPasted5 ContentPasted5" style=3D"marg=
in:0px">Question: where will the sealed data
 reside in TPM ?<br>
</span>Answer: Under the parent object in the aforementioned key hierachy. =
The parent key,/object aka a storage key, is used to protect the child obje=
ct/key data following the object protectiosn disucuseed in part 1 of the TP=
M library architecture specification.
 See link below. See section 22.</span></span></div>
</li><li class=3D"x_ContentPasted1 ContentPasted1 ContentPasted2" style=3D"=
margin: 0in 0in 0in -0.25in;">
<div><span style=3D"display: inline !important; background-color: rgb(255, =
255, 255);" class=3D"ContentPasted3"><span style=3D"margin:0px" class=3D"Co=
ntentPasted4"><span class=3D"x_ContentPasted5 ContentPasted5" style=3D"marg=
in:0px"><span style=3D"display: inline !important; background-color: rgb(25=
5, 255, 255);" class=3D"ContentPasted7">Question:
 can we get a sealed data object so that after TPM clear or reset it can be=
 loaded into TPM again and used for unsealing ?<br>
</span>Answer: If the parent object(s) are destroyed the seal object is unl=
oadable. Ie if the primary seed for the hierarchy changes, it cannot be loa=
ded. Remember, primary keys are stable, so deleting a primary key won't mak=
e the object unloadable.</span></span></span></div>
</li></ol>
</ol>
<div>Typically, folks use the SRK for the parent and define everything in t=
hat hierarchy if you're not firmware vendor. This is usually not a problem.=
 I guess we would need to understand exactly what you're trying to do to ad=
vise another solution. If it's not
 consumable for the general public mailing list, we could do a direct talk =
off list.</div>
<div><span style=3D"display: inline !important; background-color: rgb(255, =
255, 255);" class=3D"ContentPasted3"><span style=3D"margin:0px" class=3D"Co=
ntentPasted4"><span class=3D"x_ContentPasted5 ContentPasted5" style=3D"marg=
in:0px"><br>
</span></span></span></div>
<div><span style=3D"display: inline !important; background-color: rgb(255, =
255, 255);" class=3D"ContentPasted3"><span style=3D"margin:0px" class=3D"Co=
ntentPasted4"><span class=3D"x_ContentPasted5 ContentPasted5" style=3D"marg=
in:0px">Bill</span></span></span></div>
<div><br>
</div>
<div>Part 1 of the TPM Spec:</div>
<div class=3D"ContentPasted6"><a href=3D"https://trustedcomputinggroup.org/=
wp-content/uploads/TCG_TPM2_r1p59_Part1_Architecture_pub.pdf" id=3D"LPlnk90=
1072">https://trustedcomputinggroup.org/wp-content/uploads/TCG_TPM2_r1p59_P=
art1_Architecture_pub.pdf</a><br>
</div>
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b> SAI VAMSEE KRISH=
NA Lankisetti &lt;SAI.VAMSEE.KRISHNA.Lankisetti@ibm.com&gt;<br>
<b>Sent:</b> Tuesday, July 11, 2023 8:39 AM<br>
<b>To:</b> Roberts, William C &lt;william.c.roberts@intel.com&gt;; tpm2@lis=
ts.linuxfoundation.org &lt;tpm2@lists.linuxfoundation.org&gt;<br>
<b>Cc:</b> Ravindra Sure &lt;ravisure@in.ibm.com&gt;<br>
<b>Subject:</b> Re: [Tpm2] help regarding how to create NV under platform h=
ierarchy</font>
<div>&nbsp;</div>
</div>
<div dir=3D"ltr">
<div class=3D"x_elementToProof" style=3D"font-family: Calibri, Arial, Helve=
tica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi ,<br>
</div>
<div class=3D"x_elementToProof x_ContentPasted0" style=3D"font-family: Cali=
bri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp;&nbsp; I am trying to use TPM to store symmetric keys and retrieve th=
em from TPM whenever needed. First, I created a symmetric in TPM and tried =
to use it, but I came to know that private key which is the symmetric key d=
oesn't come out of TPM. Then I thought NV
 index will be good to store the keys with some authentication. But NV Inde=
x defined in owner hierarchy is not persistent with TPM clear and reset. I =
have read in below link that NV index can't be cleared using tpm2_clear whe=
n defined in platform hierarchy
 . But unable to create it .<br>
<a href=3D"https://github.com/Infineon/optiga-tpm-cheatsheet#nv-storage" da=
ta-auth=3D"NotApplicable" id=3D"LPNoLPOWALinkPreview">https://github.com/In=
fineon/optiga-tpm-cheatsheet#nv-storage</a><br>
<div class=3D"x__Entity x__EType_OWALinkPreview x__EId_OWALinkPreview_3 x__=
EReadonly_1">
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
I have few questions<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<ol data-editing-info=3D"{&quot;orderedStyleType&quot;:1,&quot;unorderedSty=
leType&quot;:1}" data-listchain=3D"__List_Chain_738">
<li class=3D"x_ContentPasted1 elementToProof" style=3D"list-style-type:&quo=
t;1. &quot;">is there way to access randomly set platform hierarchy authent=
ication through TPM software stack ?</li><li style=3D"list-style-type:&quot=
;2. &quot;">does NV index defined through platform hierarchy is persistent =
unless we undefine it manually ?</li><li style=3D"list-style-type:&quot;3. =
&quot;">I tried to use <span class=3D"x_ContentPasted2" lang=3D"en-US">
tpm2_clearcontrol</span> to disable tpm2_clear but it also requires<br>
platform authentication . can we disable clear from owner hierarchy ?</li><=
li class=3D"x_ContentPasted3 x_ContentPasted4" style=3D"list-style-type:&qu=
ot;4. &quot;">I came across other solution to store keys using seal and uns=
eal from below links<br>
<div><a href=3D"https://github.com/tpm2-software/tpm2-tools/issues/3246" da=
ta-auth=3D"NotApplicable" id=3D"LPNoLPOWALinkPreview_1">https://github.com/=
tpm2-software/tpm2-tools/issues/3246</a><br>
</div>
<br>
<div><a href=3D"https://github.com/tpm2-software/tpm2-tools/issues/3180#iss=
uecomment-1354996963" data-auth=3D"NotApplicable" id=3D"LPNoLPOWALinkPrevie=
w_2">https://github.com/tpm2-software/tpm2-tools/issues/3180#issuecomment-1=
354996963</a></div>
</li></ol>
<ul data-editing-info=3D"{&quot;orderedStyleType&quot;:1,&quot;unorderedSty=
leType&quot;:1}">
<li class=3D"x_ContentPasted3 x_ContentPasted4" style=3D"list-style-type:di=
sc">
<div>can you let me know what sealing and unsealing the key means here?</di=
v>
</li><li class=3D"x_ContentPasted3 x_ContentPasted4" style=3D"list-style-ty=
pe:disc">
<div class=3D"x_ContentPasted5">where will the sealed data reside in TPM ?<=
/div>
</li><li class=3D"x_ContentPasted3 x_ContentPasted4" style=3D"list-style-ty=
pe:disc">
<div class=3D"x_ContentPasted5">can we get a sealed data object so that aft=
er TPM clear or reset it can be loaded into TPM again and used for unsealin=
g ?<br>
</div>
<br>
<div class=3D"x__Entity x__EType_OWALinkPreview x__EId_OWALinkPreview_4 x__=
EReadonly_1">
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"x__Entity x__EType_OWALinkPreview x__EId_OWALinkPreview_5 x__=
EReadonly_1">
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,<br>
Vamsee Krishna.<br>
</div>
</li></ul>
</div>
</div>
<div id=3D"x_appendonsend"></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
style=3D"font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b> Roberts, Willi=
am C &lt;william.c.roberts@intel.com&gt;<br>
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
<div style=3D"visibility: hidden; font-size: 1px; line-height: 1px; height:=
 0px; max-height: 0px; opacity: 0; overflow: hidden; display: none !importa=
nt; color: rgb(255, 255, 255);">
You're trying to define the NV index in the platform hierarchy which is usu=
ally locked out with a password. This is what the -Cp option is doing. Any =
particular reason for that? If you leave off -Cp option or do -Co it will u=
se the owner hierarchy
</div>
<div style=3D"visibility: hidden; font-size: 1px; line-height: 1px; height:=
 0px; max-height: 0px; opacity: 0; overflow: hidden; display: none !importa=
nt; color: rgb(255, 255, 255);">
ZjQcmQRYFpfptBannerStart</div>
<div dir=3D"ltr" id=3D"x_x_pfptBanner5ee1flv" lang=3D"en" style=3D"visibili=
ty: visible !important; opacity: 1 !important; max-width: none !important; =
max-height: none !important; display: block !important; text-align: left !i=
mportant; margin: 16px 0px !important; padding: 8px 16px !important; border=
-radius: 4px !important; min-width: 200px !important; border-top: 4px solid=
 rgb(144, 164, 174) !important; background-color: rgb(208, 216, 220);">
<div id=3D"x_x_pfptBanner5ee1flv" style=3D"visibility: visible !important; =
opacity: 1 !important; max-height: none !important; float: left !important;=
 display: block !important; margin: 0px 0px 1px !important; max-width: 600p=
x !important; background-color: rgb(208, 216, 220);">
<div id=3D"x_x_pfptBanner5ee1flv" style=3D"opacity: 1 !important; max-width=
: none !important; max-height: none !important; display: block !important; =
visibility: visible !important; font-family: Arial, sans-serif !important; =
font-weight: bold !important; font-size: 14px !important; line-height: 18px=
 !important; color: rgb(0, 0, 0); background-color: rgb(208, 216, 220);">
This Message Is From an External Sender </div>
<div id=3D"x_x_pfptBanner5ee1flv" style=3D"font-weight: normal; opacity: 1 =
!important; max-width: none !important; max-height: none !important; displa=
y: block !important; visibility: visible !important; font-family: Arial, sa=
ns-serif !important; font-size: 12px !important; line-height: 18px !importa=
nt; margin-top: 2px !important; color: rgb(0, 0, 0); background-color: rgb(=
208, 216, 220);">
This message came from outside your organization. </div>
</div>
<div id=3D"x_x_pfptBanner5ee1flv" style=3D"visibility: visible !important; =
opacity: 1 !important; max-width: none !important; max-height: none !import=
ant; float: right !important; display: block !important; margin: 0px 0px 0p=
x 16px !important; text-align: right !important; width: fit-content !import=
ant; background-color: rgb(208, 216, 220);">
<a href=3D"https://us-phishalarm-ewt.proofpoint.com/EWT/v1/PjiDSg!1e-trX6zR=
vm6lYv7uAElbjDV-N1WPgO-Z4rd5Cvb-R7oRVgpFx77CzoyPG6-k0ArvQdtiFKelJJQC_MYkaTD=
0hOPIiXdeeNnWjy7rvV08EgKHEOlpNl6WqVbTe9uPO-7HENoanchZZr0XCkxSNdK6wWs$" data=
-auth=3D"NotApplicable" id=3D"x_x_pfptBanner5ee1flv" style=3D"text-decorati=
on: none; visibility: visible !important; opacity: 1 !important; max-width:=
 none !important; max-height: none !important; display: inline-block !impor=
tant; background-color: rgb(208, 216, 220);" data-loopstyle=3D"linkonly">
<div class=3D"x_x_pfptPrimaryButton5ee1flv" style=3D"border: 1px solid rgb(=
102, 102, 102); display: inline-block !important; visibility: visible !impo=
rtant; opacity: 1 !important; font-family: Arial, sans-serif !important; fo=
nt-size: 14px !important; font-weight: normal !important; text-decoration: =
none !important; border-radius: 2px !important; padding: 7.5px 16px !import=
ant; margin: 3px 0px 3px 16px !important; white-space: nowrap !important; w=
idth: fit-content !important; color: rgb(0, 0, 0);">
Report&nbsp;Suspicious </div>
</a></div>
<div style=3D"clear:both!important; display:block!important; visibility:hid=
den!important; line-height:0!important; font-size:0.01px!important; height:=
0px">
&nbsp;</div>
</div>
<div style=3D"visibility: hidden; font-size: 1px; line-height: 1px; height:=
 0px; max-height: 0px; opacity: 0; overflow: hidden; display: none !importa=
nt; color: rgb(255, 255, 255);">
ZjQcmQRYFpfptBannerEnd</div>
<div class=3D"x_x_elementToProof" style=3D"font-family: Calibri, Arial, Hel=
vetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
You're trying to define the NV index in the platform hierarchy which is usu=
ally locked out with a password. This is what the -Cp option is doing. Any =
particular reason for that? If you leave off -Cp option or do -Co it will u=
se the owner hierarchy which is
 usually what normal users use to create NV indices but you still need the =
owner password if it is set.</div>
<div class=3D"x_x_elementToProof" style=3D"font-family: Calibri, Arial, Hel=
vetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"x_x_elementToProof" style=3D"font-family: Calibri, Arial, Hel=
vetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
You can query if the owner password is set by:</div>
<div class=3D"x_x_elementToProof x_x_ContentPasted0" style=3D"font-family: =
Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;">
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
<div class=3D"x_x_elementToProof x_x_ContentPasted0" style=3D"font-family: =
Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;">
<br>
</div>
<div class=3D"x_x_elementToProof x_x_ContentPasted0" style=3D"font-family: =
Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;">
&lt;snip&gt;</div>
<div class=3D"x_x_elementToProof x_x_ContentPasted0" style=3D"font-family: =
Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;">
Note the ownerAuthSet bit under TPM2_PT_PERMANENT. You can pass the passwor=
d for the owner hiearchy if it's set by using the -P (capital P) option.</d=
iv>
<div id=3D"x_x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif=
" style=3D"font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b> Tpm2 &lt;tpm=
2-bounces@lists.linuxfoundation.org&gt; on behalf of SAI VAMSEE KRISHNA Lan=
kisetti via Tpm2 &lt;tpm2@lists.linuxfoundation.org&gt;<br>
<b>Sent:</b> Monday, July 10, 2023 1:48 AM<br>
<b>To:</b> tpm2@lists.linuxfoundation.org &lt;tpm2@lists.linuxfoundation.or=
g&gt;<br>
<b>Cc:</b> Ravindra Sure &lt;ravisure@in.ibm.com&gt;<br>
<b>Subject:</b> [Tpm2] help regarding how to create NV under platform hiera=
rchy</font>
<div>&nbsp;</div>
</div>
<div dir=3D"ltr">
<div class=3D"x_x_x_elementToProof x_x_x_ContentPasted0" style=3D"font-fami=
ly: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0=
, 0);">
Hi Folks,</div>
<div class=3D"x_x_x_elementToProof x_x_x_ContentPasted0" style=3D"font-fami=
ly: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0=
, 0);">
I am new to tpm2.</div>
<div class=3D"x_x_x_elementToProof x_x_x_ContentPasted0" style=3D"font-fami=
ly: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0=
, 0);">
<br>
</div>
<div class=3D"x_x_x_elementToProof x_x_x_ContentPasted0" style=3D"font-fami=
ly: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0=
, 0);">
<p dir=3D"auto" class=3D"x_x_x_ContentPasted1" style=3D"margin-top: 0px; ma=
rgin-bottom: 0px;margin-top: 0px; margin-bottom: 0px;margin-top:0px; margin=
-bottom:0px; margin-top:0px; margin-bottom:0px">
I am trying to create NV index under platform hierarchy using tpm2-tools bu=
t getting below error.<br class=3D"x_x_x_ContentPasted1">
</p>
<p dir=3D"auto" class=3D"x_x_x_ContentPasted1" style=3D"margin-top: 0px; ma=
rgin-bottom: 0px;margin-top: 0px; margin-bottom: 0px;margin-top:0px; margin=
-bottom:0px; margin-top:0px; margin-bottom:0px">
<code class=3D"x_x_x_notranslate x_x_x_ContentPasted1">tpm2_nvdefine 0x0100=
0000 -C p -s 32 -a &quot;ppwrite|ppread|platformcreate&quot; WARNING:esys:s=
rc/tss2-esys/api/Esys_NV_DefineSpace.c:337:Esys_NV_DefineSpace_Finish() Rec=
eived TPM Error ERROR:esys:src/tss2-esys/api/Esys_NV_DefineSpace.c:122:Esys=
_NV_DefineSpace()
 Esys Finish ErrorCode (0x000009a2) ERROR: Failed to define NV area at inde=
x 0x1000000 ERROR: Esys_NV_DefineSpace(0x9A2) - tpm:session(1):authorizatio=
n failure without DA implications ERROR: Failed to create NV index 0x100000=
0.<br>
<br>
</code></p>
<p dir=3D"auto" class=3D"x_x_x_ContentPasted1" style=3D"margin-top: 0px; ma=
rgin-bottom: 0px;margin-top: 0px; margin-bottom: 0px;margin-top:0px; margin=
-bottom:0px; margin-top:0px; margin-bottom:0px">
need help regarding above error and how to create nv index in platform hier=
archy<br class=3D"x_x_x_ContentPasted1">
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
</div>
</body>
</html>

--_000_SN6PR11MB343780BFD56FE3EDFE29E872B831ASN6PR11MB3437namp_--
