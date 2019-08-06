Content-Type: multipart/mixed; boundary="===============7079333453394104090=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: [tpm2] tpm2-tss 2.3.0_rc1
Date: Tue, 06 Aug 2019 15:12:25 -0700
Message-ID: <e2f7759e-6e2c-ed8d-d7f1-f40bc7805d92@intel.com>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D0163AF794A@exch2010c.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7079333453394104090==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,
A new release candidate for tpm2-tss 2.3.0 is out. It can be found here:

https://github.com/tpm2-software/tpm2-tss/releases/tag/2.3.0_rc1

Changes since rc0:
 - tctildr: downgrade missing TCTI library error to debug message
 - tcti: fix issues found by coverity scan
 - build: add install-exec-hook that creates a symbolic link tcti-default
   pointing to tcti-device
 - build: uninstall Tss2_TctiLdr_Initialize_Ex.3 on make uninstall

Please give it some testing. Any feedback is appreciated.

Thanks,
-- =

Tadeusz

--===============7079333453394104090==--

