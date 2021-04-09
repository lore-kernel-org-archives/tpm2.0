Content-Type: multipart/mixed; boundary="===============2215458309753459307=="
MIME-Version: 1.0
From: nicolasoliver03 at gmail.com
Subject: [tpm2] Re: tpm2_eventlog ERROR: SpecID eventType must be EV_NO_ACTION
Date: Fri, 09 Apr 2021 16:47:23 +0000
Message-ID: <20210409164723.2848.7769@ml01.vlan13.01.org>
In-Reply-To: OF3D622C11.68F63C8B-ON002586B0.00725856-852586B0.0072BEBD@notes.na.collabserv.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2215458309753459307==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The output of tsseventextend -v is below.
I am getting this same error in 2 servers from different manufacturers.
I may need to cleanup a little before sharing the logs, please bear with me!

eventextend: line 0
TSS_EVENT_Line_Trace: PCR index 0
TSS_EVENT_EventType_Trace: 00000008 EV_S_CRTM_VERSION
 TSS_EVENT_Line_Trace: PCR length 20
 c4 2f ed ad 26 82 00 cb 1d 15 f9 78 41 c3 44 e7
 9d ae 33 20
 TSS_EVENT_Line_Trace: event length 16
 1e fb 6b 54 0c 1d 55 40 a4 ad 4e f4 bf 17 b8 3a
eventextend: failed, rc 0000009a
TPM_RC_INSUFFICIENT - the TPM was unable to unmarshal a value because there=
 were not enough octets in the input buffer Handle number unspecified
--===============2215458309753459307==--

