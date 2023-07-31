Return-Path: <ahmad7bashir@gmail.com>
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1A1881EEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D68BF81EE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690824078; x=1691428878;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=2k9McxsAv5QSM5Ne5mdefo63Hf6iNVAGhWUuLUHcXOc=;
 b=Ka0qGY+OHAQGP9HtyYy6gIrz3booropp73/3SatFrkPTNKgxU1G2LwRxd7W3HuS5Zm
 nPGyzTS1b57biEN9gqZ3Y+3HkJRDogALWtcuCN2OydvOMni6ewX2CpM/VfRJJigDRn+N
 s/TRgDjKsAoMfDGrhymRz3Xl7TVJWwuD61MEHlwFMeAQxDpGrGWGOW/MuLkscDzmEDrS
 H8PJ3IHSFfIbKfjhBCoqXarP5l1fRjo3uwqxOu9+Y8kMh2hXMotNdCSNk3uMUSfA880s
 QdcF2CMf5rlpN+0CU0pLfuIEDk7rh8YhFljhQdfJgLSTuJ8PPoPXnrG1RV3h4ZLPZCx7
 tjkg==
MIME-Version: 1.0
From: "Ahmad B. Usman" <ahmad7bashir@gmail.com>
Date: Mon, 31 Jul 2023 19:21:06 +0200
Message-ID: <CA+K1d5u1k+xe+K655Axn_+qjt3+WP+OOT45LRAhBX3t-GDfvUA@mail.gmail.com>
Content-Type: multipart/alternative; boundary="0000000000008464310601cba82a"
Subject: [Tpm2] TPM2_ACT_SetTimeout command usage
List-Id: The tpm2 userspace mailing list <tpm2.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/tpm2/>
List-Post: <mailto:tpm2@lists.linuxfoundation.org>
List-Help: <mailto:tpm2-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=subscribe>
To: tpm2@lists.linuxfoundation.org

--0000000000008464310601cba82a
Content-Type: text/plain; charset="UTF-8"

I am writing this email to ask for your help on how to construct valid TPM
commands and parse some results for TPM2_ACT_SetTimeout from
https://sourceforge.net/projects/ibmtpm20tss/ and also
https://github.com/kgoldman/ibmswtpm2 and also as specified in
https://trustedcomputinggroup.org/wp-content/uploads/TCG_TPM_ACTCommand_v1r3_pubrev.pdf
so
as to set a timer which countdown from +x second to zero periodically.


I have built and run the ibm simulator: (
https://sourceforge.net/projects/ibmswtpm2/) and was able to send command
and get result using tpm2-tools (https://github.com/tpm2-software/tpm2-tools
)


I tried compiling like a C file (gcc myprog.c -o myprog; ./myprog) but
getting errors even if i use the -ltss2-esys option

Best regards,
/Ahmad

--0000000000008464310601cba82a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto" style=3D"font-size:1rem;font-family:-app=
le-system,&quot;Helvetica Neue&quot;;word-spacing:1px;color:rgb(49,49,49)">=
I am writing this email to ask for your help on how to construct valid TPM =
commands and parse some results for TPM2_ACT_SetTimeout from=C2=A0=C2=A0<a =
href=3D"https://sourceforge.net/projects/ibmtpm20tss/" target=3D"_blank" st=
yle=3D"font-size:1rem">https://sourceforge.net/projects/ibmtpm20tss/</a>=C2=
=A0and also=C2=A0<a href=3D"https://github.com/kgoldman/ibmswtpm2" rel=3D"n=
ofollow" target=3D"_blank" style=3D"font-size:1rem">https://github.com/kgol=
dman/ibmswtpm2</a>=C2=A0and also as specified in=C2=A0=C2=A0<a href=3D"http=
s://trustedcomputinggroup.org/wp-content/uploads/TCG_TPM_ACTCommand_v1r3_pu=
brev.pdf" rel=3D"nofollow" target=3D"_blank" style=3D"font-size:1rem">https=
://trustedcomputinggroup.org/wp-content/uploads/TCG_TPM_ACTCommand_v1r3_pub=
rev.pdf</a>=C2=A0so as to set a timer which countdown from +x second to zer=
o periodically.<br></div><div dir=3D"auto" style=3D"font-family:-apple-syst=
em,&quot;Helvetica Neue&quot;;word-spacing:1px;color:rgb(49,49,49)"><br></d=
iv><div dir=3D"auto" style=3D"font-family:-apple-system,&quot;Helvetica Neu=
e&quot;;word-spacing:1px;color:rgb(49,49,49)"><br></div><div dir=3D"auto" s=
tyle=3D"font-size:1rem;font-family:-apple-system,&quot;Helvetica Neue&quot;=
;word-spacing:1px;color:rgb(49,49,49)">I have built and run the ibm simulat=
or: (<a href=3D"https://sourceforge.net/projects/ibmswtpm2/" target=3D"_bla=
nk" style=3D"font-size:1rem">https://sourceforge.net/projects/ibmswtpm2/</a=
>) and was able to send command and get result using tpm2-tools (<a href=3D=
"https://github.com/tpm2-software/tpm2-tools" target=3D"_blank" style=3D"fo=
nt-size:1rem">https://github.com/tpm2-software/tpm2-tools</a>)</div><div di=
r=3D"auto" style=3D"font-family:-apple-system,&quot;Helvetica Neue&quot;;wo=
rd-spacing:1px;color:rgb(49,49,49)"><br></div><div dir=3D"auto" style=3D"fo=
nt-size:1rem;font-family:-apple-system,&quot;Helvetica Neue&quot;;word-spac=
ing:1px;color:rgb(49,49,49)"><br></div><div dir=3D"auto" style=3D"font-size=
:1rem;font-family:-apple-system,&quot;Helvetica Neue&quot;;word-spacing:1px=
;color:rgb(49,49,49)">I tried compiling like a C file (gcc myprog.c -o mypr=
og; ./myprog) but getting errors even if i use the -ltss2-esys option=C2=A0=
<br></div><div dir=3D"auto" style=3D"font-family:-apple-system,&quot;Helvet=
ica Neue&quot;;word-spacing:1px;color:rgb(49,49,49)"><br></div><div dir=3D"=
auto" style=3D"font-size:1rem;font-family:-apple-system,&quot;Helvetica Neu=
e&quot;;word-spacing:1px;color:rgb(49,49,49)"><p style=3D"font-size:1rem">B=
est regards,<br>/Ahmad</p><p style=3D"font-size:1rem"></p></div></div>

--0000000000008464310601cba82a--
