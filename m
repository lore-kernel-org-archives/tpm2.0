Content-Type: multipart/mixed; boundary="===============5196870399758231201=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Question: TPM2.0 auditing services/programs for S/W
 solutions using TPM chips.
Date: Mon, 16 Nov 2020 18:31:21 +0000
Message-ID: <SN6PR11MB34373BFA52649F701CE3072FB8E30@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: 20201116171636.2865.49328@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5196870399758231201==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Matthew Giassa <matthew(a)giassa.net>
> Sent: Monday, November 16, 2020 11:17 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Question: TPM2.0 auditing services/programs for S/W solut=
ions
> using TPM chips.
> =

> Good day,
> =

> I'm trying to find a specific type of guideline and/or certification rela=
ting to TPM-
> based (software) product, and wasn't able to find what I'm looking for he=
re (so
> far), or at other sites I was advised to check out (i.e. [1], [2]), so I'=
m reaching out
> here for guidance/advice.
> =

> Are there companies or programs (i.e. formally recognized or recommended =
by
> TCG or a similar authority) that pen-test/assess the quality of a softwar=
e-based
> solution that depends on a TPM (i.e. 2.0) chip? Or, failing that, are the=
re
> guidelines or certification/assessment programs for qualifying software s=
olutions
> (i.e. Linux-based) that make use of a TPM device?
> =

> I'm putting together some proof-of-concept examples, and while the design
> seems sound, it's my opinion that the person implementing the solution
> shouldn't be the same person assessing it for weaknesses. It's effectivel=
y a
> measured-boot-based solution to support full disk encryption via LUKS, an=
d later,
> remote attestation. I started considering the topic after coming across a=
 post [3],
> which strikes me as a bit of a "gotcha" (i.e. secret can be unsealed due =
to
> accidentally leaving a blank/default password enabled; "oops").
> =

> Any documentation/guides/resources that can help with assessing the quali=
ty of
> a s/w-based solution and "keeping it on the rails" is appreciated.
> =

> Thank you.
> =

> =

> 1. "TPMDeveloper - Topics", <https://developers.tpm.dev/topics>, last acc=
essed
> 2020-11-16.
> 2. "Trusted Computing Group - Resources",
> <https://trustedcomputinggroup.org/resources?>, last accessed 2020-11-16.
> 3. "Unsealing data despite PCR policy", <https://github.com/tpm2-
> software/tpm2-tools/issues/1123>, last accessed 2020-11-16.

I don't know of anything formal provided by TCG as far as evaluating things.

But various companies and communities send bug reports to the various compo=
nents tpm2-software builds,
like tpm2-tools, and we file CVE's, track them and keep regression tests, e=
tc.

The tpm2-software currently produces some very generic software, so ultimat=
ely the finished product built
by end consumers should also be tested. It's possible to use the tooling an=
d libraries to build insecure things.
So you really want to test end-to-end.

The TCG does have documentations around best practices such as what a TPM s=
hould support and remote attestation
In various documentations. Some of the "Architects Guide" and other resourc=
es may be of help:
https://trustedcomputinggroup.org/resources/?

There are third party security companies that may be worth pursuing to vet =
your PoC's. I can't really recommend any
as I have never used one.

Bill

--===============5196870399758231201==--

