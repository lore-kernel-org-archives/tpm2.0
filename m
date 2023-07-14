Return-Path: <feplooptest@gmail.com>
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 172A9403E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B7C8400D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689366497; x=1691958497;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=h++o88KoKt1RqVLmNhZcwLlSzQlXNszlw7OPEOLg2nY=;
 b=nk0o1oH0HvYIvtxmP8PrBFBA1ee2hepA4ycMvGM+SDkGidgkjlVF1xPL5P0jRnNAMI
 /WIL+U357VbjvGgMPZ/RSCIDq2v3J4Q0jfw0ZATLKAjTFWwgWdSVot3aVNy4Z8Y7ZdCy
 A8/O69djPILNVLOvfH9jpQ4hpX3jnE0BJbCFRxxe1mYpjqUmUIbXPNHh9L2iaUVX0GlD
 zXCNXUA+2ONWyCjFB9dXFRAcBiGf2ftqEQMuIJBKbWSjdBW3AXG1UKEiEiacsWLGkLNu
 j5TrFlH+EhKU8asfcPPsRYDhxHgqs5e27wpx+5N8h431DtASOWcMtJ9borG3WI0RLIXf
 L69g==
MIME-Version: 1.0
From: Lee <feplooptest@gmail.com>
Date: Fri, 14 Jul 2023 15:27:36 -0500
Message-ID: <CAPQXZP8FaHzb1-0VXqj-J6_5GXUoXTjfwNmta0fQuDxVV5675g@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000ed0b2a0600784913"
Subject: [Tpm2] How to wrap/unwrap with TPM2 endorsement key?
List-Id: The tpm2 userspace mailing list <tpm2.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/tpm2/>
List-Post: <mailto:tpm2@lists.linuxfoundation.org>
List-Help: <mailto:tpm2-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=subscribe>
To: tpm2@lists.linuxfoundation.org

--000000000000ed0b2a0600784913
Content-Type: text/plain; charset="UTF-8"

Hi

I have a remote client A which wants to communicate securely with a server
B having a discrete TPM. My understanding is that each TPM normally comes
with an endorsement key from a manufacturer like Infineon. Therefore,
client A can validate client B's unique identity indirectly through a TPM
endorsement certificate by checking it against the manufacturer's CA
certificate. This can be easily achieved by retrieving ek certificate from
TPM NV index (below) or tpm2_getekcertifcate command, then sending it to
client A.

tpm2_nvread 0x1C00002 > rsa_cert

Since the endorsement key is a storage root key, it should not be used as
an encryption key according to information I found online. However, it
can(I think) be used to wrap/unwrap a symmetric encryption key to be used
in the subsequent operation. This means the client can extract the public
from the EK certificate and wrap an encryption key with it and send it back
to server B, but the problem is I could not figure out how to unwrap a file
with the private part of the endorsement key using tpm2-tools. Could
someone give me some guidance on this?

Thanks

Yu-Chieh

--000000000000ed0b2a0600784913
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0<div><br></div><div><p style=3D"margin:0px 0px 1.1=
em;padding:0px;border:0px;font-stretch:inherit;line-height:inherit;font-fam=
ily:-apple-system,BlinkMacSystemFont,&quot;Segoe UI Adjusted&quot;,&quot;Se=
goe UI&quot;,&quot;Liberation Sans&quot;,sans-serif;font-size-adjust:inheri=
t;font-kerning:inherit;font-variant-alternates:inherit;font-variant-ligatur=
es:inherit;font-variant-numeric:inherit;font-variant-east-asian:inherit;fon=
t-feature-settings:inherit;font-size:15px;vertical-align:baseline;box-sizin=
g:inherit;clear:both;color:rgb(35,38,41)">I have a remote client A which wa=
nts to communicate securely with a server B having a discrete TPM. My under=
standing is that each TPM normally comes with an endorsement key from a man=
ufacturer like Infineon. Therefore, client A can validate client B&#39;s un=
ique identity indirectly through a TPM endorsement certificate by checking =
it against the manufacturer&#39;s CA certificate. This can be easily achiev=
ed by retrieving ek certificate from TPM NV index (below) or tpm2_getekcert=
ifcate command, then sending it to client A.</p><pre style=3D"margin-top:0p=
x;border:0px;font-stretch:inherit;font-size-adjust:inherit;font-kerning:inh=
erit;font-variant-alternates:inherit;font-variant-ligatures:inherit;font-va=
riant-numeric:inherit;font-variant-east-asian:inherit;font-feature-settings=
:inherit;vertical-align:baseline;box-sizing:inherit;width:auto;max-height:6=
00px;overflow:auto"><code style=3D"margin:0px;padding:0px;border:0px;font-s=
tyle:inherit;font-variant-caps:inherit;font-stretch:inherit;line-height:inh=
erit;font-size-adjust:inherit;font-kerning:inherit;font-variant-alternates:=
inherit;font-variant-ligatures:inherit;font-variant-numeric:inherit;font-va=
riant-east-asian:inherit;font-feature-settings:inherit;vertical-align:basel=
ine;box-sizing:inherit;white-space:inherit;border-radius:0px">tpm2_nvread 0=
x1C00002 &gt; rsa_cert=20
</code></pre><p style=3D"margin:0px 0px 1.1em;padding:0px;border:0px;font-s=
tretch:inherit;line-height:inherit;font-family:-apple-system,BlinkMacSystem=
Font,&quot;Segoe UI Adjusted&quot;,&quot;Segoe UI&quot;,&quot;Liberation Sa=
ns&quot;,sans-serif;font-size-adjust:inherit;font-kerning:inherit;font-vari=
ant-alternates:inherit;font-variant-ligatures:inherit;font-variant-numeric:=
inherit;font-variant-east-asian:inherit;font-feature-settings:inherit;font-=
size:15px;vertical-align:baseline;box-sizing:inherit;clear:both;color:rgb(3=
5,38,41)">Since the endorsement key is a storage root key, it should not be=
 used as an encryption key according to information I found online. However=
, it can(I think) be used to wrap/unwrap a symmetric encryption key to be u=
sed in the subsequent operation. This means the client can extract the publ=
ic from the EK certificate and wrap an encryption key with it and send it b=
ack to server B, but the problem is I could not figure out how to unwrap a =
file with the private part of the endorsement key using tpm2-tools. Could s=
omeone give me some guidance on this?</p><p style=3D"margin:0px;padding:0px=
;border:0px;font-stretch:inherit;line-height:inherit;font-family:-apple-sys=
tem,BlinkMacSystemFont,&quot;Segoe UI Adjusted&quot;,&quot;Segoe UI&quot;,&=
quot;Liberation Sans&quot;,sans-serif;font-size-adjust:inherit;font-kerning=
:inherit;font-variant-alternates:inherit;font-variant-ligatures:inherit;fon=
t-variant-numeric:inherit;font-variant-east-asian:inherit;font-feature-sett=
ings:inherit;font-size:15px;vertical-align:baseline;box-sizing:inherit;clea=
r:both;color:rgb(35,38,41)">Thanks</p><p style=3D"margin:0px;padding:0px;bo=
rder:0px;font-stretch:inherit;line-height:inherit;font-family:-apple-system=
,BlinkMacSystemFont,&quot;Segoe UI Adjusted&quot;,&quot;Segoe UI&quot;,&quo=
t;Liberation Sans&quot;,sans-serif;font-size-adjust:inherit;font-kerning:in=
herit;font-variant-alternates:inherit;font-variant-ligatures:inherit;font-v=
ariant-numeric:inherit;font-variant-east-asian:inherit;font-feature-setting=
s:inherit;font-size:15px;vertical-align:baseline;box-sizing:inherit;clear:b=
oth;color:rgb(35,38,41)">Yu-Chieh</p></div></div>

--000000000000ed0b2a0600784913--
