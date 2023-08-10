Return-Path: <boostermohan@gmail.com>
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AF1A41909
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0CEC418EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691667199; x=1692271999;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=QHK8QuBA12IYnGGAlgWApI3d1wgBHFBxAoUQ/pq6Dfc=;
 b=AQ8X0On5h+m6eceGSj80nQdQkxPYhSXj24OxI/Faz1SSvKhuAxfe5lO1mneH/hgqHC
 S68FaK62pqVaS1iV3Ima70C2dePviYbbfuEXmpssLtYH3U5juVLyFxl/CJsqEPO3E8Uh
 i8NpUHaCrI5fXYzhFAVowWSsUqlidy4P0kdwSdEimHeZ3n8yc4H07K15O6JUxsyOnDZL
 SdlH6k8CXqyc2+9/RVovjBMaA6wvg2n9HCRcsx6HhFxOVtN41vkJwerrs9r2YV6ny7CZ
 UCGTtwWcEuMi7r/hojDE+xNwLcOC14IFCgstxdN0lB+6qpBKhFZCzDREn3D53zl5XEk9
 +ZGQ==
MIME-Version: 1.0
From: Mohan M <boostermohan@gmail.com>
Date: Thu, 10 Aug 2023 17:03:07 +0530
Message-ID: <CAHHFLs7X4oj47Ua123wc5Nhg0EeaOWNdiThF-Dnu3DFC6Y1EBA@mail.gmail.com>
Content-Type: multipart/alternative; boundary="00000000000074f72106028ff666"
Subject: [Tpm2] Rootfs encryption using TPM2
List-Id: The tpm2 userspace mailing list <tpm2.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/tpm2/>
List-Post: <mailto:tpm2@lists.linuxfoundation.org>
List-Help: <mailto:tpm2-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=subscribe>
To: tpm2@lists.linuxfoundation.org

--00000000000074f72106028ff666
Content-Type: text/plain; charset="UTF-8"

Hi,

I want to create encrypted rootfs using TPM2 as key storage.

I am building my linux image using Yocto.

Could you please suggest to me the available info on this. I am new to this
area.

Thanks
Mohan M

--00000000000074f72106028ff666
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I want to create encrypted rootfs u=
sing TPM2 as key storage.</div><div><br></div><div>I am building my linux i=
mage using Yocto.</div><div><br></div><div>Could you please suggest to me t=
he available=C2=A0info on this. I am new to this area.</div><div><br></div>=
<div>Thanks</div><div>Mohan M</div></div>

--00000000000074f72106028ff666--
