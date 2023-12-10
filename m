Return-Path: <armin.simma@fhv.at>
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C39A0400FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B58E0400D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=FHVorarlberg.onmicrosoft.com; s=selector2-FHVorarlberg-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6uRE3cnBa0dtfr/B/YaS1ZqlbTzZc9FDiuPQyk4xDQ=;
 b=hEx0BcmiQb4mArxDKHfPbbrJLEjnD6znI7BVGwstVTgxTKJfAnNpV9SUYPAE8Apz0fGX2mOE5JSZ49Pmp0JfRBT+Wy/pMhBHvwlEYxPcPT1zvS45gec3/xruXj7yxBZZc/exfQWYHO/A5XpUtso0sF/2yUuMGTXOeL5rc0lxswY=
From: SIMMA Armin <armin.simma@fhv.at>
Date: Sun, 10 Dec 2023 06:56:55 +0000
Message-ID: <VI1PR09MB37923FDBD28623C5FE3F61529588A@VI1PR09MB3792.eurprd09.prod.outlook.com>
References: <VI1PR09MB379294040DD4CE76F927F8D99588A@VI1PR09MB3792.eurprd09.prod.outlook.com>
In-Reply-To: <VI1PR09MB379294040DD4CE76F927F8D99588A@VI1PR09MB3792.eurprd09.prod.outlook.com>
Content-Language: en-GB
Content-Type: multipart/alternative;
 boundary="_000_VI1PR09MB37923FDBD28623C5FE3F61529588AVI1PR09MB3792eurp_"
MIME-Version: 1.0
Subject: [Tpm2] tpm2_policyauthorize applied directly on tpm-based key
 instead of file
List-Id: The tpm2 userspace mailing list <tpm2.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/tpm2/>
List-Post: <mailto:tpm2@lists.linuxfoundation.org>
List-Help: <mailto:tpm2-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=subscribe>
To: "tpm2@lists.linuxfoundation.org" <tpm2@lists.linuxfoundation.org>

--_000_VI1PR09MB37923FDBD28623C5FE3F61529588AVI1PR09MB3792eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi TPM-users and experts!

I tried to use the code from Nicolas Oliver to create a tpm-based key which=
 has a =93Wildcard Policy=94 i.e. an Authorized Policiy to allow using the =
key only with specified PCR values; and still being able to change those PC=
R values later on using a signature.  Support for this is provided thorough=
 the tpm2_policyauthorizecommand.
I just adapted the code from https://github.com/latchset/clevis/issues/121

Instead of sealing a file (in the code Nicolas it is file secret.txt I trie=
d to use a tpm-stored key within the =93normal=94 owner hierarchy created w=
ith tpm2_create i.e. a subkey of the primary key.  When I try to unseal the=
 key with the correct policy at the end of the code I get the following err=
or:
/home/user# tpm2_unseal \
    --object-context 0x81000005 \
    --auth session:session1.ctx
WARNING:esys:src/tss2-esys/api/Esys_Unseal.c:295:Esys_Unseal_Finish() Recei=
ved TPM Error
ERROR:esys:src/tss2-esys/api/Esys_Unseal.c:98:Esys_Unseal() Esys Finish Err=
orCode (0x0000018a)

ERROR: Esys_Unseal(0x18A) - tpm:handle(1):the type of the value is not appr=
opriate for the use

Can=92t we use tpm2_policyauthorize directly on tpm-keys in tpm2-tools? (or=
 maybe it is written in the spec where I haven=92t read all the details.)
Here is part of my code; the complete code can be seen in  https://github.c=
om/latchset/clevis/issues/121 :

 # Create a PCR policy |

tpm2_startauthsession --session session.ctx

tpm2_policypcr \

    --session session.ctx \

    --pcr-list sha256:0,1 \

    --policy pcr.policy

tpm2_flushcontext session.ctx

rm -f session.ctx



# Generate public/private key pair for signing


Rest of the code see github/ latchset (link above)=85

I removed the following option from tpm2_create (compared to github:

 --sealing-input secret.txt \






tpm2_create \

    --parent-context primary.ctx \

    --hash-algorithm sha256 \

    --public key.obj.pub \

    --private key.obj.priv \

    --policy authorized.policy



tpm2_load \

    --parent-context primary.ctx \

    --public key.obj.pub \

    --private key.obj.priv \

    --name key.obj.name \

    --key-context key.obj.ctx



# Persist the TPM Object

tpm2_evictcontrol \

    --hierarchy o \

    --object-context key.obj.ctx \

    0x81000005



 # Sign the PCR policy



=85



# Unseal the TPM object using the Authorized PCR Policy

=85





tpm2_unseal \

    --object-context 0x81000005 \

    --auth session:session1.ctx

If you have any idea why this does not work or =96 even better - a solution=
 to my problem I would be very happy hearing it.
Armin



--_000_VI1PR09MB37923FDBD28623C5FE3F61529588AVI1PR09MB3792eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Helvetica;
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
code
	{mso-style-priority:99;
	font-family:"Courier New";}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Consolas",serif;
	mso-ligatures:none;
	mso-fareast-language:EN-GB;}
p.code, li.code, div.code
	{mso-style-name:code;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
span.apple-converted-space
	{mso-style-name:apple-converted-space;}
span.pl-c
	{mso-style-name:pl-c;}
span.EmailStyle26
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"en-AT" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<div id=3D"mail-editor-reference-message-container">
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:#212121">Hi TPM-users and experts!</span><span style=3D"font-size:11.0pt">=
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"font-variant-caps:normal;orphans:auto;text-=
align:start;widows:auto;word-spacing:0px">
<span lang=3D"EN-US" style=3D"font-size:12.0pt;color:#212121">&nbsp;</span>=
<span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"font-variant-caps:normal;orphans:auto;text-=
align:start;widows:auto;word-spacing:0px">
<span lang=3D"EN-US" style=3D"font-size:12.0pt;color:#212121">I tried to us=
e the code from Nicolas Oliver to create a tpm-based key which has a =93Wil=
dcard Policy=94 i.e. an<span class=3D"apple-converted-space">&nbsp;</span><=
/span><span style=3D"font-size:12.0pt;color:#212121">Authorized
 Polici</span><span lang=3D"EN-US" style=3D"font-size:12.0pt;color:#212121"=
>y to allow using the key only with specified PCR values; and still being a=
ble to change those PCR values later on using a signature.&nbsp; S</span><s=
pan style=3D"font-size:12.0pt;color:#212121">upport<span class=3D"apple-con=
verted-space">&nbsp;</span></span><span lang=3D"EN-US" style=3D"font-size:1=
2.0pt;color:#212121">for
 this<span class=3D"apple-converted-space">&nbsp;</span></span><span style=
=3D"font-size:12.0pt;color:#212121">is provided thorough the<span class=3D"=
apple-converted-space">&nbsp;</span></span><code><span style=3D"color:#2121=
21">tpm2_policyauthorize</span></code><span style=3D"font-size:12.0pt;color=
:#212121">command</span><span lang=3D"EN-US" style=3D"font-size:12.0pt;colo=
r:#212121">.</span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"font-variant-caps:normal;orphans:auto;text-=
align:start;widows:auto;word-spacing:0px">
<span lang=3D"EN-US" style=3D"font-size:12.0pt;color:#212121">I just adapte=
d the code from<span class=3D"apple-converted-space">&nbsp;</span><a href=
=3D"https://github.com/latchset/clevis/issues/121" title=3D"https://github.=
com/latchset/clevis/issues/121"><span style=3D"color:#0078D7">https://githu=
b.com/latchset/clevis/issues/121</span></a></span><span style=3D"font-size:=
11.0pt"><o:p></o:p></span></p>
<pre style=3D"white-space:pre-wrap;font-variant-caps:normal;orphans:auto;te=
xt-align:start;widows:auto;word-spacing:0px"><span lang=3D"EN-US" style=3D"=
font-size:12.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#212121">=
Instead of sealing a file (in the code Nicolas it is file </span><code><spa=
n style=3D"color:#212121">secret</span></code><span lang=3D"EN-US" style=3D=
"font-size:12.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#212121"=
>.</span><code><span style=3D"color:#212121">txt</span></code><span style=
=3D"font-size:12.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#2121=
21"> <span lang=3D"EN-US">I tried to use a tpm-stored key within the =93nor=
mal=94 owner hierarchy created with tpm2_create i.e. a subkey of the primar=
y key.&nbsp; When I try to unseal the key with the correct policy at the en=
d of the code I get the following error:</span></span><o:p></o:p></pre>
<p class=3D"MsoNormal" style=3D"font-variant-caps:normal;orphans:auto;text-=
align:start;widows:auto;word-spacing:0px">
<span lang=3D"EN-GB" style=3D"font-size:12.0pt;font-family:Helvetica;color:=
#212121">/home/user# tpm2_unseal \</span><span style=3D"font-size:11.0pt"><=
o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"font-variant-caps:normal;orphans:auto;text-=
align:start;widows:auto;word-spacing:0px">
<span lang=3D"EN-GB" style=3D"font-size:12.0pt;font-family:Helvetica;color:=
#212121">&nbsp;&nbsp;&nbsp; --object-context 0x81000005 \</span><span style=
=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"font-variant-caps:normal;orphans:auto;text-=
align:start;widows:auto;word-spacing:0px">
<span lang=3D"EN-GB" style=3D"font-size:12.0pt;font-family:Helvetica;color:=
#212121">&nbsp;&nbsp;&nbsp; --auth session:session1.ctx</span><span style=
=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"font-variant-caps:normal;orphans:auto;text-=
align:start;widows:auto;word-spacing:0px">
<b><span lang=3D"EN-GB" style=3D"font-size:11.0pt;font-family:Helvetica;col=
or:#212121">WARNING:esys:src/tss2-esys/api/Esys_Unseal.c:295:Esys_Unseal_Fi=
nish() Received TPM Error<span class=3D"apple-converted-space">&nbsp;</span=
></span></b><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"font-variant-caps:normal;orphans:auto;text-=
align:start;widows:auto;word-spacing:0px">
<b><span lang=3D"EN-GB" style=3D"font-size:11.0pt;font-family:Helvetica;col=
or:#212121">ERROR:esys:src/tss2-esys/api/Esys_Unseal.c:98:Esys_Unseal() Esy=
s Finish ErrorCode (0x0000018a)<span class=3D"apple-converted-space">&nbsp;=
</span></span></b><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<pre style=3D"white-space:pre-wrap;font-variant-caps:normal;orphans:auto;te=
xt-align:start;widows:auto;word-spacing:0px"><b><span lang=3D"EN-GB" style=
=3D"font-size:11.0pt;font-family:Helvetica;color:#212121">ERROR: Esys_Unsea=
l(0x18A) - tpm:handle(1):the type of the value is not appropriate for the u=
se</span></b><o:p></o:p></pre>
<p class=3D"MsoNormal" style=3D"font-variant-caps:normal;orphans:auto;text-=
align:start;widows:auto;word-spacing:0px">
<span lang=3D"EN-US" style=3D"font-size:12.0pt;color:#212121">&nbsp;</span>=
<span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"font-variant-caps:normal;orphans:auto;text-=
align:start;widows:auto;word-spacing:0px">
<span lang=3D"EN-US" style=3D"font-size:12.0pt;color:#212121">Can=92t we us=
e<span class=3D"apple-converted-space">&nbsp;</span></span><code><span styl=
e=3D"color:#212121">tpm2_policyauthorize</span></code><span class=3D"apple-=
converted-space"><span style=3D"font-family:&quot;Courier New&quot;;color:#=
212121">&nbsp;</span></span><span lang=3D"EN-US" style=3D"font-size:12.0pt;=
color:#212121">directly
 on tpm-</span><span style=3D"font-size:12.0pt;color:#212121">keys</span><s=
pan class=3D"apple-converted-space"><span lang=3D"EN-US" style=3D"font-size=
:12.0pt;color:#212121">&nbsp;</span></span><span lang=3D"EN-US" style=3D"fo=
nt-size:12.0pt;color:#212121">in tpm2-tools? (or
 maybe it is written in the spec where I haven=92t read all the details.)</=
span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"font-variant-caps:normal;orphans:auto;text-=
align:start;widows:auto;word-spacing:0px">
<span lang=3D"EN-US" style=3D"font-size:12.0pt;color:#212121">Here is </spa=
n><span lang=3D"EN-US" style=3D"font-size:12.0pt">part of my code;
<span style=3D"color:#212121">the complete code</span> can be seen in <span=
 class=3D"apple-converted-space">
<span style=3D"color:#212121">&nbsp;</span></span><span style=3D"color:#212=
121"><a href=3D"https://github.com/latchset/clevis/issues/121" title=3D"htt=
ps://github.com/latchset/clevis/issues/121"><span style=3D"color:#0078D7">h=
ttps://github.com/latchset/clevis/issues/121</span></a></span>
<span style=3D"color:#212121">:</span></span><span style=3D"font-size:11.0p=
t"><o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><span style=3D"font-family:&quot;Courier New&quot;;col=
or:#212121">&nbsp;</span></span><span class=3D"pl-c"><span style=3D"font-fa=
mily:&quot;Courier New&quot;;color:black"># Create a PCR policy |</span></s=
pan><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB"><span class=3D"pl=
-c"><span style=3D"font-family:&quot;Courier New&quot;;color:black">tpm2_st=
artauthsession --session session.ctx</span></span><span style=3D"font-size:=
11.0pt"><o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><span style=3D"font-family:&quot;Courier New&quot;;col=
or:black">tpm2_policypcr \</span></span><span style=3D"font-size:11.0pt"><o=
:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><span style=3D"font-family:&quot;Courier New&quot;;col=
or:black">&nbsp;&nbsp;&nbsp; --session session.ctx \</span></span><span sty=
le=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><span style=3D"font-family:&quot;Courier New&quot;;col=
or:black">&nbsp;&nbsp;&nbsp; --pcr-list sha256:0,1 \</span></span><span sty=
le=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><span style=3D"font-family:&quot;Courier New&quot;;col=
or:black">&nbsp;&nbsp;&nbsp; --policy pcr.policy</span></span><span style=
=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><span style=3D"font-family:&quot;Courier New&quot;;col=
or:black">tpm2_flushcontext session.ctx</span></span><span style=3D"font-si=
ze:11.0pt"><o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><span style=3D"font-family:&quot;Courier New&quot;;col=
or:black">rm -f session.ctx</span></span><span style=3D"font-size:11.0pt"><=
o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><span style=3D"font-family:&quot;Courier New&quot;;col=
or:#212121">&nbsp;</span></span><span style=3D"font-size:11.0pt"><o:p></o:p=
></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><span style=3D"font-family:&quot;Courier New&quot;;col=
or:black"># Generate public/private key pair for signing</span></span><span=
 style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><span style=3D"font-family:&quot;Courier New&quot;;col=
or:#212121">&nbsp;</span></span><span style=3D"font-size:11.0pt"><o:p></o:p=
></span></p>
<p class=3D"MsoNormal" style=3D"font-variant-caps:normal;orphans:auto;text-=
align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><span lang=3D"EN-US">Rest of the code see github/ latc=
hset (link above)=85<o:p></o:p></span></span></p>
<pre><span class=3D"pl-c"><span lang=3D"EN-US" style=3D"font-family:&quot;C=
alibri&quot;,sans-serif">I removed the following option from tpm2_create (c=
ompared to github:<o:p></o:p></span></span></pre>
<pre><span class=3D"pl-c"><span lang=3D"EN-US" style=3D"font-family:&quot;C=
alibri&quot;,sans-serif"> </span></span><span style=3D"font-family:&quot;Ca=
libri&quot;,sans-serif">--sealing-input secret.txt \<o:p></o:p></span></pre=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></span></p=
>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><span style=3D"font-family:&quot;Courier New&quot;;col=
or:#212121">&nbsp;</span></span><span style=3D"font-size:11.0pt"><o:p></o:p=
></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><b><span style=3D"font-family:&quot;Courier New&quot;;=
color:black">tpm2_create \</span></b></span><span style=3D"font-size:11.0pt=
"><o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><b><span style=3D"font-family:&quot;Courier New&quot;;=
color:black">&nbsp;&nbsp;&nbsp; --parent-context primary.ctx \</span></b></=
span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><b><span style=3D"font-family:&quot;Courier New&quot;;=
color:black">&nbsp;&nbsp;&nbsp; --hash-algorithm sha256 \</span></b></span>=
<span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><b><span style=3D"font-family:&quot;Courier New&quot;;=
color:black">&nbsp;&nbsp;&nbsp; --public</span></b></span><span class=3D"ap=
ple-converted-space"><b><span style=3D"font-family:&quot;Courier New&quot;;=
color:black">&nbsp;</span></b></span><span class=3D"pl-c"><b><span style=3D=
"font-family:&quot;Courier New&quot;;color:black">key.obj.pub</span></b></s=
pan><span class=3D"apple-converted-space"><b><span style=3D"font-family:&qu=
ot;Courier New&quot;;color:black">&nbsp;</span></b></span><span class=3D"pl=
-c"><b><span style=3D"font-family:&quot;Courier New&quot;;color:black">\</s=
pan></b></span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><b><span style=3D"font-family:&quot;Courier New&quot;;=
color:black">&nbsp;&nbsp;&nbsp; --private key.obj.priv \</span></b></span><=
span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><b><span style=3D"font-family:&quot;Courier New&quot;;=
color:black">&nbsp;&nbsp;&nbsp; --policy authorized.policy</span></b></span=
><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><b><span style=3D"font-family:&quot;Courier New&quot;;=
color:#212121">&nbsp;</span></b></span><span style=3D"font-size:11.0pt"><o:=
p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><b><span style=3D"font-family:&quot;Courier New&quot;;=
color:black">tpm2_load \</span></b></span><span style=3D"font-size:11.0pt">=
<o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><b><span style=3D"font-family:&quot;Courier New&quot;;=
color:black">&nbsp;&nbsp;&nbsp; --parent-context primary.ctx \</span></b></=
span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><b><span style=3D"font-family:&quot;Courier New&quot;;=
color:black">&nbsp;&nbsp;&nbsp; --public</span></b></span><span class=3D"ap=
ple-converted-space"><b><span style=3D"font-family:&quot;Courier New&quot;;=
color:black">&nbsp;</span></b></span><span class=3D"pl-c"><b><span style=3D=
"font-family:&quot;Courier New&quot;;color:black">key.obj.pub</span></b></s=
pan><span class=3D"apple-converted-space"><b><span style=3D"font-family:&qu=
ot;Courier New&quot;;color:black">&nbsp;</span></b></span><span class=3D"pl=
-c"><b><span style=3D"font-family:&quot;Courier New&quot;;color:black">\</s=
pan></b></span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><b><span style=3D"font-family:&quot;Courier New&quot;;=
color:black">&nbsp;&nbsp;&nbsp; --private key.obj.priv \</span></b></span><=
span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><b><span style=3D"font-family:&quot;Courier New&quot;;=
color:black">&nbsp;&nbsp;&nbsp; --name</span></b></span><span class=3D"appl=
e-converted-space"><b><span style=3D"font-family:&quot;Courier New&quot;;co=
lor:black">&nbsp;</span></b></span><span class=3D"pl-c"><b><span style=3D"f=
ont-family:&quot;Courier New&quot;;color:black">key.obj.name</span></b></sp=
an><span class=3D"apple-converted-space"><b><span style=3D"font-family:&quo=
t;Courier New&quot;;color:black">&nbsp;</span></b></span><span class=3D"pl-=
c"><b><span style=3D"font-family:&quot;Courier New&quot;;color:black">\</sp=
an></b></span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><b><span style=3D"font-family:&quot;Courier New&quot;;=
color:black">&nbsp;&nbsp;&nbsp; --key-context key.obj.ctx</span></b></span>=
<span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><b><span style=3D"font-family:&quot;Courier New&quot;;=
color:#212121">&nbsp;</span></b></span><span style=3D"font-size:11.0pt"><o:=
p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><b><span style=3D"font-family:&quot;Courier New&quot;;=
color:black"># Persist the TPM Object</span></b></span><span style=3D"font-=
size:11.0pt"><o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><b><span style=3D"font-family:&quot;Courier New&quot;;=
color:black">tpm2_evictcontrol \</span></b></span><span style=3D"font-size:=
11.0pt"><o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><b><span style=3D"font-family:&quot;Courier New&quot;;=
color:black">&nbsp;&nbsp;&nbsp; --hierarchy o \</span></b></span><span styl=
e=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><b><span style=3D"font-family:&quot;Courier New&quot;;=
color:black">&nbsp;&nbsp;&nbsp; --object-context key.obj.ctx \</span></b></=
span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><b><span style=3D"font-family:&quot;Courier New&quot;;=
color:black">&nbsp;&nbsp;&nbsp; 0x810</span></b></span><span class=3D"pl-c"=
><b><span lang=3D"EN-US" style=3D"font-family:&quot;Courier New&quot;;color=
:black">0</span></b></span><span class=3D"pl-c"><b><span style=3D"font-fami=
ly:&quot;Courier New&quot;;color:black">000</span></b></span><span class=3D=
"pl-c"><b><span lang=3D"EN-US" style=3D"font-family:&quot;Courier New&quot;=
;color:black">5</span></b></span><span style=3D"font-size:11.0pt"><o:p></o:=
p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><span style=3D"font-family:&quot;Courier New&quot;;col=
or:#212121">&nbsp;</span></span><span style=3D"font-size:11.0pt"><o:p></o:p=
></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><span style=3D"font-family:&quot;Courier New&quot;;col=
or:#212121">&nbsp;</span></span><span class=3D"pl-c"><span style=3D"font-fa=
mily:&quot;Courier New&quot;;color:black"># Sign the PCR policy</span></spa=
n><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB"><span class=3D"pl=
-c"><span style=3D"font-family:&quot;Courier New&quot;;color:#212121">&nbsp=
;</span></span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><span lang=3D"DE-AT" style=3D"font-family:&quot;Courie=
r New&quot;;color:black">=85</span></span><span lang=3D"DE-AT" style=3D"fon=
t-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><span style=3D"font-family:&quot;Courier New&quot;;col=
or:#212121">&nbsp;</span></span><span style=3D"font-size:11.0pt"><o:p></o:p=
></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><span style=3D"font-family:&quot;Courier New&quot;;col=
or:black"># Unseal the TPM</span></span><span class=3D"apple-converted-spac=
e"><span style=3D"font-family:&quot;Courier New&quot;;color:black">&nbsp;</=
span></span><span class=3D"pl-c"><span lang=3D"EN-US" style=3D"font-family:=
&quot;Courier New&quot;;color:black">object</span></span><span class=3D"app=
le-converted-space"><span lang=3D"EN-US" style=3D"font-family:&quot;Courier=
 New&quot;;color:black">&nbsp;</span></span><span class=3D"pl-c"><span styl=
e=3D"font-family:&quot;Courier New&quot;;color:black">using
 the Authorized PCR Policy</span></span><span style=3D"font-size:11.0pt"><o=
:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><span lang=3D"DE-AT" style=3D"font-family:&quot;Courie=
r New&quot;;color:black">=85</span></span><span lang=3D"DE-AT" style=3D"fon=
t-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><span style=3D"font-family:&quot;Courier New&quot;;col=
or:#212121">&nbsp;</span></span><span style=3D"font-size:11.0pt"><o:p></o:p=
></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><span style=3D"font-family:&quot;Courier New&quot;;col=
or:#212121">&nbsp;</span></span><span style=3D"font-size:11.0pt"><o:p></o:p=
></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><b><span style=3D"font-family:&quot;Courier New&quot;;=
color:black">tpm2_unseal \</span></b></span><span style=3D"font-size:11.0pt=
"><o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><b><span style=3D"font-family:&quot;Courier New&quot;;=
color:black">&nbsp;&nbsp;&nbsp; --object-context 0x810</span></b></span><sp=
an class=3D"pl-c"><b><span lang=3D"EN-US" style=3D"font-family:&quot;Courie=
r New&quot;;color:black">0</span></b></span><span class=3D"pl-c"><b><span s=
tyle=3D"font-family:&quot;Courier New&quot;;color:black">000</span></b></sp=
an><span class=3D"pl-c"><b><span lang=3D"EN-US" style=3D"font-family:&quot;=
Courier New&quot;;color:black">5</span></b></span><span class=3D"apple-conv=
erted-space"><b><span style=3D"font-family:&quot;Courier New&quot;;color:bl=
ack">&nbsp;</span></b></span><span class=3D"pl-c"><b><span style=3D"font-fa=
mily:&quot;Courier New&quot;;color:black">\</span></b></span><span style=3D=
"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"code" style=3D"margin:0cm;background:#E8EBEB;font-variant-caps:=
normal;orphans:auto;text-align:start;widows:auto;word-spacing:0px">
<span class=3D"pl-c"><b><span style=3D"font-family:&quot;Courier New&quot;;=
color:black">&nbsp;&nbsp;&nbsp; --auth session:session1.ctx</span></b></spa=
n><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"font-variant-caps:normal;orphans:auto;text-=
align:start;widows:auto;word-spacing:0px">
<span style=3D"font-size:12.0pt;color:#212121">&nbsp;</span><span style=3D"=
font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"font-variant-caps:normal;orphans:auto;text-=
align:start;widows:auto;word-spacing:0px">
<span lang=3D"EN-US" style=3D"font-size:12.0pt;color:#212121">If you have a=
ny idea why this does not work or =96 even better - a solution to my proble=
m I would be very happy hearing it.</span><span style=3D"font-size:11.0pt">=
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"font-variant-caps:normal;orphans:auto;text-=
align:start;widows:auto;word-spacing:0px">
<span lang=3D"EN-US" style=3D"font-size:12.0pt;color:#212121">Armin</span><=
span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;<o:p></o:p></=
span></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_VI1PR09MB37923FDBD28623C5FE3F61529588AVI1PR09MB3792eurp_--

