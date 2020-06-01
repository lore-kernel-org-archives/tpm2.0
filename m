Content-Type: multipart/mixed; boundary="===============1224979381960890568=="
MIME-Version: 1.0
From: Chenxi Z <cxzhang1981 at hotmail.com>
Subject: [tpm2] Re: Error: "Could not initialize TCTI file" when calling
 tpm2_nvreadpublic
Date: Mon, 01 Jun 2020 21:32:06 +0000
Message-ID: <20200601213206.2851.5435@ml01.vlan13.01.org>
In-Reply-To: 6c4d9e03-a80e-532e-c12e-ddf7cbc56a54@gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1224979381960890568==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks Tadeusz for helping me look into this issue.
Below is the log i got.

$ service tpm2-abrmd status
Redirecting to /bin/systemctl status tpm2-abrmd.service
=E2=97=8F tpm2-abrmd.service - TPM2 Access Broker and Resource Management D=
aemon
     Loaded: loaded (/etc/systemd/system/tpm2-abrmd.service; enabled; vendo=
r preset: disabled)
     Active: active (running) since Mon 2020-06-01 01:05:27 PDT; 13h ago
   Main PID: 3544664 (tpm2-abrmd)
         IO: 0B read, 0B written
      Tasks: 6
     Memory: 2.0M
        CPU: 4.194s
     CGroup: /system.slice/tpm2-abrmd.service
             =E2=94=94=E2=94=803544664 /usr/sbin/tpm2-abrmd

Warning: Journal has been rotated since unit was started. Log output is inc=
omplete or unavailable.
--===============1224979381960890568==--

