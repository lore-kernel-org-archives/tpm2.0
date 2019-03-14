Content-Type: multipart/mixed; boundary="===============5651504226291860130=="
MIME-Version: 1.0
From: Andersen, John <john.s.andersen at intel.com>
Subject: Re: [tpm2] Support for EAP-TLS with openssl TPM2 engine
Date: Thu, 14 Mar 2019 09:19:58 -0700
Message-ID: <20190314161958.GB28769@johnsa1-desk.jf.intel.com>
In-Reply-To: 81ab32db49bb3586d0fea02ca02aa6723009ef1d.camel@infradead.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5651504226291860130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2019 at 04:56:17PM -0700, David Woodhouse wrote:
> On Sat, 2019-01-12 at 12:59 +0100, huger(a)web.de wrote:
> > Hi
> > =

> > I am working on a plan to operate mobile Linux computers and would like =

> > them to use corporate wifi with EAP TLS. Security requires us to safely =

> > store the client key. Easiest solution would be in the computer's TPM =

> > 2.0 device.
> > =

> > So far we were not successful trying to set this up with wpa_supplicant =

> > and pkcs11 engine. Even if successful a solution with these multiple =

> > layers of abstraction is quite complex and therefore might be prone to =

> > updates of any of the components.
> > =

> > So I wonder if there are plans to directly support openssl tpm2 engine?
> =

> Here's a quick hack to make it work by abusing the OpenSC engine
> config, as a proof of concept. Making it work cleanly so that it can be
> merged is left as an exercise for the reader, or perhaps an interested
> party in one of the mailing lists I've added to Cc.
> =

> I have no idea why wpa_supplicant doesn't call ENGINE_load_dynamic()
> for current versions of OpenSSL. That seems to be a bug, which is why
> I've removed the #ifdefs around it.
> =

> Signed-off-by: David Woodhouse <dwmw2(a)infradead.org> (not that you'd
> want to apply it as-is).
> =

> diff --git a/src/crypto/tls_openssl.c b/src/crypto/tls_openssl.c
> index 705fa29a3..546d3a598 100644
> --- a/src/crypto/tls_openssl.c
> +++ b/src/crypto/tls_openssl.c
> @@ -864,7 +864,7 @@ static int tls_engine_load_dynamic_pkcs11(const char =
*pkcs11_so_path,
>   */
>  static int tls_engine_load_dynamic_opensc(const char *opensc_so_path)
>  {
> -	char *engine_id =3D "opensc";
> +	char *engine_id =3D "tpm2";
>  	const char *pre_cmd[] =3D {
>  		"SO_PATH", NULL /* opensc_so_path */,
>  		"ID", NULL /* engine_id */,
> @@ -1034,10 +1034,8 @@ void * tls_init(const struct tls_config *conf)
>  =

>  #ifndef OPENSSL_NO_ENGINE
>  	wpa_printf(MSG_DEBUG, "ENGINE: Loading dynamic engine");
> -#if OPENSSL_VERSION_NUMBER < 0x10100000L
>  	ERR_load_ENGINE_strings();
>  	ENGINE_load_dynamic();
> -#endif /* OPENSSL_VERSION_NUMBER */
>  =

>  	if (conf &&
>  	    (conf->opensc_engine_path || conf->pkcs11_engine_path ||
> diff --git a/wpa_supplicant/wpa_supplicant.conf b/wpa_supplicant/wpa_supp=
licant.conf
> index 1bd43b226..b3045fb3d 100644
> --- a/wpa_supplicant/wpa_supplicant.conf
> +++ b/wpa_supplicant/wpa_supplicant.conf
> @@ -174,7 +174,7 @@ fast_reauth=3D1
>  # private_key option appear to be a PKCS#11 URI, and these options
>  # should not need to be used explicitly.
>  # make the opensc engine available
> -#opensc_engine_path=3D/usr/lib/opensc/engine_opensc.so
> +opensc_engine_path=3D/home/dwmw/git/openssl_tpm2_engine/.libs/libtpm2.so
>  # make the pkcs11 engine available
>  #pkcs11_engine_path=3D/usr/lib/opensc/engine_pkcs11.so
>  # configure the path to the pkcs11 module required by the pkcs11 engine
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2

Sweet! I'd been working on this too, I just got the hostapd / wpa_supplicant
test stuff working and was going to try setting
pkcs11_engine_path=3D/usr/lib/opensc/engine_pkcs11.so

To the tpm2-software/tpm2-pcks11 library.

From the amount of changes it took you, it seems like your approach is cle=
aner,
so, out of curiousity, what was your ratoinal for going with this approach?=
 I
was going to try the pcks11 way because I came across

https://w1.fi/cgit/hostap/plain/wpa_supplicant/examples/openCryptoki.conf

But, I haven't gotten to it yet as I got sidetracked right after I got the =
tests
up and running.

Thanks,
John

--===============5651504226291860130==--

