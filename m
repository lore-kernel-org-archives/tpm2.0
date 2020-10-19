Content-Type: multipart/mixed; boundary="===============6191940279386963348=="
MIME-Version: 1.0
From: nicolasoliver03 at gmail.com
Subject: [tpm2] Re: QUEMU and TPM2 device emulation
Date: Mon, 19 Oct 2020 16:10:35 +0000
Message-ID: <20201019161035.2812.82050@ml01.vlan13.01.org>
In-Reply-To: SN6PR11MB34376F61682669164004284EB8050@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6191940279386963348==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This is how I do it on Fedora with virt-install

dnf install -y @virtualization
dnf install -y swtpm swtpm-tools

virt-install --name FedoraServer32 \
  --description 'Fedora Server 32' \
  --ram 4096 \
  --vcpus 2 \
  --disk size=3D20 \
  --os-type linux \
  --os-variant fedora32 \
  --network bridge=3Dvirbr0 \
  --graphics vnc,listen=3D127.0.0.1,port=3D5901 \
  --location /var/lib/libvirt/images/Fedora-Server-dvd-x86_64-32-1.6.iso \
  --initrd-inject=3D/root/ks.cfg \
  --extra-args "ks=3Dfile:/ks.cfg" \
  --boot loader=3D/usr/share/OVMF/OVMF_CODE.secboot.fd,loader.readonly=3Dye=
s,loader.type=3Dpflash,nvram.template=3D/usr/share/OVMF/OVMF_VARS.secboot.f=
d,loader_secure=3Dyes \
  --features smm.state=3Don \
  --noautoconsole \
  --tpm emulator,model=3Dtpm-tis,backend.version=3D2.0

That command creates a Fedora Server VM with the specified resources, injec=
ts a kickstart configuration file for automatic installation (e.g. to insta=
ll tpm2-tools ), set up UEFI boot (so I get TPM measurements), and add the =
TPM 2.0 emulator. I believe it uses qemu under the hood.
--===============6191940279386963348==--

