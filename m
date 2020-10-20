Content-Type: multipart/mixed; boundary="===============4133203346209049044=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: QUEMU and TPM2 device emulation
Date: Tue, 20 Oct 2020 15:02:19 +0000
Message-ID: <SN6PR11MB3437A618A992A0FE74022BD4B81F0@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: 20201019161035.2812.82050@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4133203346209049044==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Could you share your kickstart file and this?

This would be nice to add to a tutorial in our github.io page...

> -----Original Message-----
> From: nicolasoliver03(a)gmail.com <nicolasoliver03(a)gmail.com>
> Sent: Monday, October 19, 2020 11:11 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Re: QUEMU and TPM2 device emulation
> =

> This is how I do it on Fedora with virt-install
> =

> dnf install -y @virtualization
> dnf install -y swtpm swtpm-tools
> =

> virt-install --name FedoraServer32 \
>   --description 'Fedora Server 32' \
>   --ram 4096 \
>   --vcpus 2 \
>   --disk size=3D20 \
>   --os-type linux \
>   --os-variant fedora32 \
>   --network bridge=3Dvirbr0 \
>   --graphics vnc,listen=3D127.0.0.1,port=3D5901 \
>   --location /var/lib/libvirt/images/Fedora-Server-dvd-x86_64-32-1.6.iso \
>   --initrd-inject=3D/root/ks.cfg \
>   --extra-args "ks=3Dfile:/ks.cfg" \
>   --boot
> loader=3D/usr/share/OVMF/OVMF_CODE.secboot.fd,loader.readonly=3Dyes,loade=
r.t
> ype=3Dpflash,nvram.template=3D/usr/share/OVMF/OVMF_VARS.secboot.fd,loader_
> secure=3Dyes \
>   --features smm.state=3Don \
>   --noautoconsole \
>   --tpm emulator,model=3Dtpm-tis,backend.version=3D2.0
> =

> That command creates a Fedora Server VM with the specified resources, inj=
ects a
> kickstart configuration file for automatic installation (e.g. to install =
tpm2-tools ),
> set up UEFI boot (so I get TPM measurements), and add the TPM 2.0 emulato=
r. I
> believe it uses qemu under the hood.
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============4133203346209049044==--

