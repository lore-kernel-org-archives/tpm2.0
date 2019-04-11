Content-Type: multipart/mixed; boundary="===============1766849504597746814=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] tpm2-tss-engine
Date: Thu, 11 Apr 2019 20:10:58 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0162EA1A5D@EXCH2010B.sit.fraunhofer.de>
In-Reply-To: e92ac69b79ca83157dd2f70c80e975d11c58b8c9.camel@infradead.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1766849504597746814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> The engine can be loaded simply by calling ENGINE_by_id("tpm2"). If
> it's installed properly you shouldn't need to mess with config files
> etc.
>
> (We did fix the engine name to be consistent with the other
> implementation, so that applications don't need to try both, didn't we?
> Otherwise, apps need to try both "tpm2" and "tpm2-tss" engine names.)

No we did not change the engine name. James never answered and I did
not want to just invade his namespace...
Thus we now have 2 names, tpm2-tss is the TCG-TSS one...
--===============1766849504597746814==--

