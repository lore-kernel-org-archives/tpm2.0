Content-Type: multipart/mixed; boundary="===============2815582690260106756=="
MIME-Version: 1.0
From: Stefan Berger <stefanb at linux.vnet.ibm.com>
Subject: [tpm2] Choosing PCR banks for swtpm's TPM 2
Date: Mon, 25 Jun 2018 11:05:55 -0400
Message-ID: <aa9ce054-f58c-097d-aee3-8fae769d0840@linux.vnet.ibm.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2815582690260106756==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi!

 =C2=A0I am sending this email to solicit input on the choice of the PCR =

banks to enable for swtpm's TPM 2. I have currently enabled 4 PCR banks =

for SHA{1,256,384,512}. The downside of this is that running the TPM 2 =

with so many PCR banks has a performance impact when the Linux integrity =

measurement architecture is used and has to extend measurements into all =

PCR banks, which Linux does already.

TPM 2 has the PCR_Allocate() command for a user to select the PCR banks =

to use. This command allows to make some PCR banks invisible. The change =

has to be done through the firmware and has the downside that the TPM2 =

does not support TPM2_Shutdown(SU_STATE) after this command was used. =

This prevents suspend/resume from working properly. So, it seems that =

one shouldn't have to use this command, which in turn means the number =

of PCR banks should be small.

Another complication with the swtpm is the upgrade path. Suspended VMs =

will expect that the PCR banks that were available before the suspend =

will be available after the resume and a possible swtpm upgrade. This in =

turn means that the PCR banks should be chosen now and we'll have to =

stick with them.

That said, my suggestion would be to enable only PCR banks for SHA256 =

for 'now' and SHA512 for the future. Having two PCR banks should enable =

decent performance. If someone wants to have better performance he will =

have to go through the firmware to select the PCR banks at the expense =

of loosing suspend/resume support.

The change of PCR banks for the current 4 PCR banks will break the state =

of all swtpms.

If you have suggestions, please let me know.

Regards,

 =C2=A0=C2=A0 Stefan



--===============2815582690260106756==--

