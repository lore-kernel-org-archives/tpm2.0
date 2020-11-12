Content-Type: multipart/mixed; boundary="===============4145032212404661465=="
MIME-Version: 1.0
From: nicolasoliver03 at gmail.com
Subject: [tpm2] Re: TPM within Containers
Date: Thu, 12 Nov 2020 18:03:11 +0000
Message-ID: <20201112180311.2865.22974@ml01.vlan13.01.org>
In-Reply-To: 20201112013022.2865.84931@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4145032212404661465==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I got a gist for that :)

It is using the TPM2 PKCS#11 module inside the container, and accessing the=
 TPM resource manager with the --device option

https://gist.github.com/dnoliver/388303c94639b763e9f120e2cbcccf8f

[test(a)fedora-server ~]$ docker run --rm  -ti --device /dev/tpmrm0 ubuntu =
bash
 =

As today (the last time I checked), IMA does not play well with containers.=
 For example, lets say that you have a binary in your container "/usr/bin/t=
est". Once you pull the image, that binary will be stored in something like=
 "/var/lib/docker/images/overlayfs/..../<layer hash>/usr/bin/test". When yo=
u start a container from that image, and call the binary, IMA will measure =
"/usr/bin/test" (the path in the container instead of the path in the host =
OS). This means that the remote verifier will not know if the digest report=
ed is related to a file loaded by the host OS or loaded by the container. =


So now, I have a policy to prevent measuring anything from a container base=
d on a SELinux label:

cat >> /etc/ima/ima-policy << EOF
dont_measure obj_type=3Dcontainer_share_t
dont_measure obj_type=3Dcontainer_var_lib_t
dont_measure obj_type=3Dcontainer_file_t
EOF

We more or less described how everything can play together here https://inf=
o.mirantis.com/whitepaper-intel-docker-enterprise-secure-containers. The id=
ea is not to make IMA measure the container, but to extend the hardware roo=
t of trust with other means:

1. IMA will measure (and appraise) the container engine and configuration (=
dockerd, daemon.json, etc)
2. dockerd verify signatures in the images and containers (Docker Content T=
rust)
3. Containers will only run if they have the correct signature.
--===============4145032212404661465==--

