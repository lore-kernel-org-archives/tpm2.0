Content-Type: multipart/mixed; boundary="===============2492764812216321508=="
MIME-Version: 1.0
From: Andersen, John <john.s.andersen at intel.com>
Subject: Re: [tpm2] Running tests
Date: Thu, 12 Jul 2018 12:07:38 -0700
Message-ID: <20180712190738.t5oeyaq52fppnwy7@johnsa1>
In-Reply-To: B445B76DF3794A499C4EDCFBEE7A3455198E1658@CINMBCNA04.e2k.ad.ge.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2492764812216321508==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 12, 2018 at 06:27:25PM +0000, Ahmed, Safayet (GE Global Researc=
h, US) wrote:
>    Hello all,
> =

> =

>    I'm interested in running the integration tests and unit tests for the
>    tpm2 software stack (tss, abrm, and the tools).
> =

> =

>    Is there any documentation on the switches to use with configure and
>    make to run those tests? Unfortunately, I couldn't find it.
> =

> =

>    Also, are those tests hard coded to use the IBM tpm2 simulator? I
>    noticed that tpm2-abrmd allows you to test against the hardware tpm. Is
>    it possible to configure these tests to use the mssim tcti with
>    non-default configs?
> =

> =

>    thank you,
> =

> =

>    Safayet



> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2

For running integration tests on tss the Dockerfile is a good starting poin=
t.
https://github.com/tpm2-software/tpm2-tss/blob/master/Dockerfile#L51

--- a/Dockerfile
+++ b/Dockerfile
@@ -48,7 +48,7 @@ RUN apt-get install -y \
 COPY . /tmp/tpm2-tss/
 WORKDIR /tmp/tpm2-tss
 RUN ./bootstrap
-RUN ./configure --enable-unit
+RUN ./configure --enable-unit --enable-integration
 RUN make -j$(nproc) check
 RUN make install
 RUN ldconfig

John

--===============2492764812216321508==--

