Content-Type: multipart/mixed; boundary="===============7478927179553873987=="
MIME-Version: 1.0
From: nicolasoliver03 at gmail.com
Subject: [tpm2] tpm2_eventlog ERROR: SpecID eventType must be EV_NO_ACTION
Date: Wed, 07 Apr 2021 18:12:11 +0000
Message-ID: <20210407181211.2848.65584@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7478927179553873987==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello!

I was recently trying to inspect TPM Event Logs with the tpm2_eventlog comm=
and.
I am getting the following error:

---
ERROR on line: "235" in file: "lib/tpm2_eventlog.c": SpecID eventType must =
be EV_NO_ACTION
ERROR on line: "79" in file: "tools/misc/tpm2_eventlog.c": failed to parse =
tpm2 eventlog  =

ERROR on line: "146" in file: "tools/tpm2_tool.c": Unable to run tpm2_event=
log

I tried with tsseventextend as well, and I got a similar error message:

eventextend: failed, rc 0000009a
TPM_RC_INSUFFICIENT - the TPM was unable to unmarshal a value because there=
 were not enough octets in the input buffer Handle number unspecified

And then tried with fwupdtpmevlog command, and I got it parsed, but the rec=
onstructed PCR 4 does not match the state of the actual TPM PCR 4 state.

Is it accurate to say that the TPM Event Log I am parsing is corrupted? =

And potentially, the corrupted entry is related to the PCR 4 measurements, =
and that's why I get a mismatch in the reconstruction?

Thanks!
--===============7478927179553873987==--

