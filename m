Return-Path: <who+lfl@cnackers.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EEA760AEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F5FD60AE8
Message-ID: <cec7540a0ac32948aa29a2c49fff797e21e328bd.camel@cnackers.org>
From: Erik <who+lfl@cnackers.org>
Date: Tue, 12 Sep 2023 00:05:33 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: [Tpm2] [RELEASE CANDIDATE] tpm2-pytss 2.2.0-rc0
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

A release candidate for tpm2-pytss 2.2.0-rc0 have been released at
https://github.com/tpm2-software/tpm2-pytss/releases/tag/2.2.0-rc0

It can be installed with pip install tpm2-pytss=3D=3D2.2.0rc0 =20

Changelog:

Fixed =20
Fix pycparse error for __float128. =20
Fix check on ESYS_TR in policy_secret.

Added =20
Add routine for making ESYS_TR from parts. =20
Support unmarshal and marshal routines for constants. =20
Provide a better error message for missing symbols.

Removed =20
Drop support for python 3.7. =20
Remove references to TPMS_ALGORITHM_DESCRIPTION.

/Erik



