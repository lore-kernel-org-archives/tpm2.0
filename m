Content-Type: multipart/mixed; boundary="===============3804069823433192669=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [tpm2-software/tpm2-tools] ea9f94: tools: Fix typos in
 tpm2_send and tpm2_tool
Date: Mon, 26 Feb 2018 13:49:46 -0800
Message-ID: <5a9480fa7919f_1e532ab4824bbc1426214@hookshot-fe-32b5f5b.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3804069823433192669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/tpm2-software/tpm2-tools
  Commit: ea9f944051daa4c0ee61e52f0624361b24527ec1
      https://github.com/tpm2-software/tpm2-tools/commit/ea9f944051daa4c0ee=
61e52f0624361b24527ec1
  Author: Manolis Ragkousis <manolis837(a)gmail.com>
  Date:   2018-02-26 (Mon, 26 Feb 2018)

  Changed paths:
    M tools/tpm2_send.c
    M tools/tpm2_tool.c

  Log Message:
  -----------
  tools: Fix typos in tpm2_send and tpm2_tool

Without this patch build fails with 'implicit declaration of function'.

* tools/tpm2_send.c (tpm2_tool_onrun): Replace tss2_tcti_transmit with
  Tss2_Tcti_Transmit.  Replace tss2_tcti_receive with Tss2_Tcti_Receive.
* tools/tpm2_tool.c (tcti_teardown): Replace tss2_tcti_finalize with
  Tss2_Tcti_Finalize.

Signed-off-by: Manolis Ragkousis <manolis837(a)gmail.com>



--===============3804069823433192669==--

