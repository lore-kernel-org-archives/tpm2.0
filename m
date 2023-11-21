Return-Path: <who+lfl@cnackers.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EC14400D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4645E40363
Message-ID: <b161e5e8eb5d572ac4a6eb4eee0ba9da78313bd6.camel@cnackers.org>
From: Erik <who+lfl@cnackers.org>
Date: Tue, 21 Nov 2023 23:39:49 +0100
In-Reply-To: <cec7540a0ac32948aa29a2c49fff797e21e328bd.camel@cnackers.org>
References: <cec7540a0ac32948aa29a2c49fff797e21e328bd.camel@cnackers.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: [Tpm2]  [RELEASE CANDIDATE] tpm2-pytss 2.2.0-rc1
List-Id: The tpm2 userspace mailing list <tpm2.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/tpm2/>
List-Post: <mailto:tpm2@lists.linuxfoundation.org>
List-Help: <mailto:tpm2-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=subscribe>
To: tpm2@lists.linuxfoundation.org

Hi,

2.2.0-rc1 has been released with some small fixes.

Changelog:

Fixed:
- Fix readthedocs builds.
- Fix hardcoded sizes in the policy module.

Added:
- Add support for python 3.12.

/Erik

On Tue, 2023-09-12 at 00:05 +0200, Erik wrote:
> Hi,
>=20
> A release candidate for tpm2-pytss 2.2.0-rc0 have been released at
> https://github.com/tpm2-software/tpm2-pytss/releases/tag/2.2.0-rc0
>=20
> It can be installed with pip install tpm2-pytss=3D=3D2.2.0rc0 =20
>=20
> Changelog:
>=20
> Fixed =20
> Fix pycparse error for __float128. =20
> Fix check on ESYS_TR in policy_secret.
>=20
> Added =20
> Add routine for making ESYS_TR from parts. =20
> Support unmarshal and marshal routines for constants. =20
> Provide a better error message for missing symbols.
>=20
> Removed =20
> Drop support for python 3.7. =20
> Remove references to TPMS_ALGORITHM_DESCRIPTION.
>=20
> /Erik
>=20
>=20
>=20
> _______________________________________________
> Tpm2 mailing list
> Tpm2@lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/tpm2

