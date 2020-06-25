Content-Type: multipart/mixed; boundary="===============8759067961121309371=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] [ANNOUNCE] Command TCTI
Date: Thu, 25 Jun 2020 18:29:05 +0000
Message-ID: <SN6PR11MB3437F846EA96C8F2FD3FA884B8920@SN6PR11MB3437.namprd11.prod.outlook.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8759067961121309371==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I'd like to highlight the command tcti's inclusion into the TSS:
  - https://github.com/tpm2-software/tpm2-tss/pull/1734

What's really cool, if you have tpm2_send on master post PR 2094:
  - https://github.com/tpm2-software/tpm2-tools/pull/2094

You can use it to run commands on remote machine. For instance, you can
Run a tpm command over an SSH tunnel on a remote machine to get the
quote. There will be no endianness issues in anything and no worries of
how to transmit the data.

Another great perk, is that if your device node has a too old version
of tpm2-tools, you can just issue a partial update to tpm2_send, or provide
some other command suitable. For most devices, something that
can read and write a file might be useful, not really sure offhand what
that would look like in entirety.

Example invocation:
tpm2_getrandom -T "cmd:ssh localhost tpm2_send" --hex 4

Thanks,
Bill
--===============8759067961121309371==--

