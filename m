Content-Type: multipart/mixed; boundary="===============4300809643228113800=="
MIME-Version: 1.0
From: Matthew Giassa <matthew at giassa.net>
Subject: [tpm2] Re: TPM within Containers
Date: Mon, 16 Nov 2020 17:06:27 +0000
Message-ID: <20201116170627.2865.60915@ml01.vlan13.01.org>
In-Reply-To: 20201112013022.2865.84931@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4300809643228113800==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I've setup a docker-in-docker debug environment for secure and/or measured =
boot. The idea is pretty straightforward:

- Top-level docker container (dind-top).
  - 2nd level docker container running TPM simulator. Uses volume mount to =
expose the Unix domain socket it uses for IPC to "dind-top". Container name=
d "dind-tpm".
  - 2nd level docker container running an ubuntu VM via QEMU/KVM. the Unix =
domain socket visible in "dind-top" and "dind-tpm" is exposed via volume mo=
unt to this container (i.e. "dind-qemu"), and the path to the socket (withi=
n "dind-qemu") is passed to qemu as a CLi arg.

Net result is a completely virtualized dev env for secure and/or measured b=
oot. Had to put a fair bit of work into the other pieces (i.e. custom kerne=
l, tying all the docker + VM logic together, creating baseline VM with debo=
otstrap, etc.).
--===============4300809643228113800==--

