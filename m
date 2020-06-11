Content-Type: multipart/mixed; boundary="===============5821238573769748575=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] tpm2-tools next release version 5.0
Date: Thu, 11 Jun 2020 16:11:36 +0000
Message-ID: <SN6PR11MB34377F07CC8E7478D0959C54B8800@SN6PR11MB3437.namprd11.prod.outlook.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5821238573769748575==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

As you likely already know, we follow semver.org versioning guidelines. For=
 tpm2-tools next release from master, we are labelling it 5.0. I want to ma=
ke
sure that everyone understands the changes around this. Unlike major versio=
n bumps 1, 2,3 and 4 command line options are staying the same in a
backwards compatible fashion (hooray). But there are some small changes com=
ing, that I will highlight in the Changelog:
  - https://github.com/tpm2-software/tpm2-tools/blob/master/doc/CHANGELOG.md

The big takeaways are that the default algorithm for hashing is SHA256. Bef=
ore, the man pages claimed SHA1, but this wasn't the case. The tools, hopef=
ully
are all on SHA256 now as the default. Selecting SHA1 for the default wasn't=
 optimal, as TPM2's whole purpose was algorithm agility to move away from S=
HA1.
Additionally the documentation did not match the code. SHA256 seems like a =
good choice, as all TPM's support it. The best bet, is to **always** specif=
y the
hash algorithm, so you will never be surprised. If you do that, you wont ha=
ve any backwards compat issues between 4.X and 5.X.

The other change is the busybox style commandlet. This will help reduce ove=
rall size and make some environments more convenient. To maintain
Backwards compat, make install provides symlinks to the new commandlet tpm2=
 from the old tool names. So something like tpm2_getrandom will be
symlinked to tpm2, and the commandlet will use argv[0] to figure it out. Th=
us, if you make install, or use a distro package, nothing should change. If=
 you
run from a local build without installing, you can make install and set DES=
TDIR and just update your PATH entry if you need backwards compat.

I urge folks to start running master occasionally and let me know if someth=
ing breaks between versions that isn't hightlighted in the CHANGELOG as
this could be a bug. I'd like to stomp these out sooner than later.

Thanks,
Bill





--===============5821238573769748575==--

