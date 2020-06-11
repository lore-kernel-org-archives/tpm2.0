Content-Type: multipart/mixed; boundary="===============2049284181499189702=="
MIME-Version: 1.0
From: ted.h.kim at oracle.com
Subject: [tpm2] Re: tpm2-tools next release version 5.0
Date: Thu, 11 Jun 2020 13:37:15 -0700
Message-ID: <5da823c5-f4fb-2a10-f289-b9ad95303eb9@oracle.com>
In-Reply-To: SN6PR11MB34377F07CC8E7478D0959C54B8800@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2049284181499189702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

William,

w.r.t. RSA I think the default is 2048 bits

But I think recent RHEL releases have ssh-keygen defaulting now to 3072 =

bits.
So I am thinking perhaps 2048 is or will soon be too weak.

Any chance that could be bumped up to 3072 bits?

Thanks,
-ted

On 6/11/20 9:11 AM, Roberts, William C wrote:
> Hello,
>
> As you likely already know, we follow semver.org versioning guidelines. F=
or tpm2-tools next release from master, we are labelling it 5.0. I want to =
make
> sure that everyone understands the changes around this. Unlike major vers=
ion bumps 1, 2,3 and 4 command line options are staying the same in a
> backwards compatible fashion (hooray). But there are some small changes c=
oming, that I will highlight in the Changelog:
>    - https://urldefense.com/v3/__https://github.com/tpm2-software/tpm2-to=
ols/blob/master/doc/CHANGELOG.md__;!!GqivPVa7Brio!MAEkAxKtVEge4_pZuFEF63r7m=
zwUX-wx7Fc8lDSnfslQFoad-SZnE0cENxUttTs$
>
> The big takeaways are that the default algorithm for hashing is SHA256. B=
efore, the man pages claimed SHA1, but this wasn't the case. The tools, hop=
efully
> are all on SHA256 now as the default. Selecting SHA1 for the default wasn=
't optimal, as TPM2's whole purpose was algorithm agility to move away from=
 SHA1.
> Additionally the documentation did not match the code. SHA256 seems like =
a good choice, as all TPM's support it. The best bet, is to **always** spec=
ify the
> hash algorithm, so you will never be surprised. If you do that, you wont =
have any backwards compat issues between 4.X and 5.X.
>
> The other change is the busybox style commandlet. This will help reduce o=
verall size and make some environments more convenient. To maintain
> Backwards compat, make install provides symlinks to the new commandlet tp=
m2 from the old tool names. So something like tpm2_getrandom will be
> symlinked to tpm2, and the commandlet will use argv[0] to figure it out. =
Thus, if you make install, or use a distro package, nothing should change. =
If you
> run from a local build without installing, you can make install and set D=
ESTDIR and just update your PATH entry if you need backwards compat.
>
> I urge folks to start running master occasionally and let me know if some=
thing breaks between versions that isn't hightlighted in the CHANGELOG as
> this could be a bug. I'd like to stomp these out sooner than later.
>
> Thanks,
> Bill
>
>
>
>
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

-- =

Ted H. Kim, PhD
ted.h.kim(a)oracle.com
+1 310-258-7515


--===============2049284181499189702==--

