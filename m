Content-Type: multipart/mixed; boundary="===============3564724522734149402=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] ESYS_TR to TPM2_HANDLE
Date: Mon, 28 Oct 2019 16:40:29 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E2BFC8@ORSMSX101.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3564724522734149402==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

In tpm2_evictcontrol, I can load a serialized ESYS_TR object. The tool outp=
ut, which I must keep stable, uses a TPM2_HANDLE in the output and whether =
or not that handle
was persisted or evicted. In the case of persisted, that is simple, I know =
it. In the case of evicted, I cannot know it. Is there a way to get the TPM=
2_HANDLE for that =

ESYS_TR? I see ESAPI knows it... The other option I have considered is just=
 to print out a 0 or some other dummy value for the handle on evict, but I =
am not super
fond of that.

Bill
--===============3564724522734149402==--

