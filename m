Content-Type: multipart/mixed; boundary="===============4511217717365596048=="
MIME-Version: 1.0
From: Anderson, Daniel <daniel.anderson at intel.com>
Subject: [tpm2]  TCTI initialization fails with error 0xc000b
Date: Tue, 20 Feb 2018 19:40:51 +0000
Message-ID: <207C810BE4BA2440832668E0F208BFD3AF4D6A@ORSMSX108.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4511217717365596048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I have been getting the same error and cannot start the tpm2-service:

$ sudo systemctl start tpm2-abrmd.service
Job for tpm2-abrmd.service failed because the control process exited with e=
rror code. See "systemctl status tpm2-abrmd.service" and "journalctl -xe" f=
or details.

$ systemctl status tpm2-abrmd.service
tpm2-abrmd.service: Main process exited, code=3Dexited, status=3D1/FA
Failed to start TPM2 Access Broker and Resource Management Daemon
Unit entered failed state.
Failed with result 'exit-code'.

# Start manually:
$ /usr/local/sbin/tpm2-abrmd&
** (tpm2-abrmd:1596): WARNING **: failed to initialize device TCTI context:=
 0xa000a
** (tpm2-abrmd:1596): CRITICAL **: TCTI Initializaiton: 0xa000a

$ tpm2_rc_decode 0xa000a
tcti:IO failure

So it seems that this is a known bug:
https://github.com/tpm2-software/tpm2-abrmd/issues/321
https://github.com/tpm2-software/tpm2-abrmd/pull/330

Is there a workaround?  The discussion is too cryptic for me. For example, =
 I can't find a tpm2_listpcrs command in  tpm2-tools (or -abrmd or -tss). I=
 am running on Ubuntu Linux with a simulator.

Dan

-----Original Message-----
From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of tpm2-request(a=
)lists.01.org
Sent: Friday, February 16, 2018 8:47 AM
To: tpm2(a)lists.01.org
Subject: tpm2 Digest, Vol 8, Issue 14

Send tpm2 mailing list submissions to
	tpm2(a)lists.01.org

To subscribe or unsubscribe via the World Wide Web, visit
	https://lists.01.org/mailman/listinfo/tpm2
or, via email, send a message with subject or body 'help' to
	tpm2-request(a)lists.01.org

You can reach the person managing the list at
	tpm2-owner(a)lists.01.org

When replying, please edit your Subject line so it is more specific than "R=
e: Contents of tpm2 digest..."


Today's Topics:

   1. Re: TCTI initialization fails with error 0xc000b
      (Roberts, William C)




--===============4511217717365596048==--

