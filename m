Content-Type: multipart/mixed; boundary="===============0256238876980791420=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: [tpm2] Re: Persisted primary key not usable, tpm2-tools 4.0.0
Date: Fri, 18 Oct 2019 10:52:11 -0700
Message-ID: <ab0095c1-bf1b-61c0-0601-d531d8d1fe5f@intel.com>
In-Reply-To: CAOCvsSmFvwnigBXB3zHBpX9eD8HoNEPhuxB+CKUxy552J5Abkg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0256238876980791420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/15/19 3:06 PM, Steven Clark wrote:
> root(a)localhost:~# tpm2_evictcontrol -C o -c prim.ctx 0x81000001
> persistent-handle: 0x81000001
> action: persisted
> =

> root(a)localhost:~# tpm2_readpublic -c 0x81000001
> WARNING:esys:../tpm2-tss/src/tss2-esys/api/Esys_ReadPublic.c:320:Esys_Rea=
dPublic_Finish()
> Received TPM Error
> ERROR:esys:../tpm2-tss/src/tss2-esys/api/Esys_ReadPublic.c:104:Esys_ReadP=
ublic()
> Esys Finish ErrorCode (0x0000018b)
> ERROR: Esys_ReadPublic(0x18B) - tpm:handle(1):the handle is not correct
> for the use
> ERROR: Unable to run tpm2_readpublic

That looks quite strange. Could you try to list the handles with
tpm2_getcap handles-persistent and tpm2_getcap handles-transient
after evictcontrol command to see if it really worked.

--
Tadeusz
--===============0256238876980791420==--

