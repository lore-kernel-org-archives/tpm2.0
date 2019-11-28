Content-Type: multipart/mixed; boundary="===============3170598081329583842=="
MIME-Version: 1.0
From: Ignacio Jaureguiberry <ignaciox.jaureguiberry at intel.com>
Subject: [tpm2] Re: wpa_supplicant fails to use tpm2_pkcs11 key
Date: Thu, 28 Nov 2019 17:43:11 +0000
Message-ID: <20191128174311.2967.28496@new-ml01.vlan13.01.org>
In-Reply-To: 6e330c9e2caf8b5f08edf37ba0c370f2be9b472c.camel@infradead.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3170598081329583842==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I've tried your suggestion of using private_key=3D"pkcs11:...." and it work=
ed. thanks! This is how the wpa.conf looks now:
```
network=3D{
        ssid=3D"TPMAP"
        key_mgmt=3DWPA-EAP
        eap=3DTLS
        identity=3D"testing"

        # set the PIN code; leave this out to configure the PIN to be reque=
sted interactively.
        pin=3D"myuserpin"

        private_key=3D"pkcs11:model=3DIntel;manufacturer=3DIntel;serial=3D0=
000000000000000;token=3Dlabel;id=3D%62%35%64%61%33%38%63%31%39%35%37%33%61%=
31%37%63;object=3D1;type=3Dprivate"
        # CA certificate and client signed certificate paths
        ca_cert=3D"/root/wpa_supplicant/ca.pem"
        client_cert=3D"/root/wpa_supplicant/client_tpm.pem"
}
```

I tried using the tpm2-tss-engine instead of pkcs#11 but I couldn't make it=
 work. I will try harder on it, but I believe I may be very close using pkc=
s#11.
--===============3170598081329583842==--

