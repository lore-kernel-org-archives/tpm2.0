Content-Type: multipart/mixed; boundary="===============1544138468169758837=="
MIME-Version: 1.0
From: nicolasoliver03 at gmail.com
Subject: [tpm2] Re: QUEMU and TPM2 device emulation
Date: Tue, 20 Oct 2020 16:54:48 +0000
Message-ID: <20201020165448.2812.39560@ml01.vlan13.01.org>
In-Reply-To: SN6PR11MB34372A59356E8390604E9872B81F0@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1544138468169758837==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This is the Kickstart I use:

#version=3DDEVEL
# Use graphical install
graphical
# Use CDROM installation media
cdrom


%packages
@^server-product-environment

%end

# Keyboard layouts
keyboard --xlayouts=3D'us'
# System language
lang en_US

# Network information
network --hostname=3Dfedora-server.mshome.net

# Run the Setup Agent on first boot
firstboot --enable
# System services
services --enabled=3D"chronyd" =


ignoredisk --only-use=3Dsda
autopart
# Partition clearing information
clearpart --drives=3Dsda --all

# System timezone
timezone America/Los_Angeles --utc

# Root password
rootpw --iscrypted <Encrypted Password>
user --groups=3Dwheel --name=3Dtest --password=3D<Encrypted Password> --isc=
rypted --gecos=3D"test"

%addon com_redhat_kdump --disable --reserve-mb=3D'128'

%end

%anaconda
pwpolicy root --minlen=3D6 --minquality=3D1 --notstrict --nochanges --notem=
pty
pwpolicy user --minlen=3D6 --minquality=3D1 --notstrict --nochanges --empty=
ok
pwpolicy luks --minlen=3D6 --minquality=3D1 --notstrict --nochanges --notem=
pty
%end

%post --erroronfail --log=3D/root/post-install.log
echo "test ALL=3D(ALL) NOPASSWD:ALL" >> /etc/sudoers
%end

%post --erroronfail --log=3D/root/additional-packages.log
dnf -y install tpm2-tss tpm2-tools tpm2-tss-engine tpm2-pkcs11 tpm2-pkcs11-=
tools gnutls-utils tmux nano
%end

That works in HyperV and actual devices with "sda" as the disk name.
For KVM/QEMU/LibVirt, changing the drive name to "vda" works (never figured=
 out how to make the disk name be "sda" by default in LibVirt)
--===============1544138468169758837==--

