Content-Type: multipart/mixed; boundary="===============1776144194924431907=="
MIME-Version: 1.0
From: Joshua Lock <joshua.g.lock at linux.intel.com>
Subject: Re: [tpm2] tpm2-tools man pages not installing?
Date: Fri, 06 Jul 2018 14:48:31 +0100
Message-ID: <f22d1663-c1af-f20e-b4d8-4985074bf2f2@linux.intel.com>
In-Reply-To: 54a96f1978da464a98e1c4b04420451e@AZDC-MMB02.GD-MS.US
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1776144194924431907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

No need to apologise, we do have plans to review and try to improve the =

quality of all of the manual pages. In the interim a Github pull request =

would be most welcome.

Joshua

On 05/07/2018 21:44, Scheie, Peter M wrote:
> BTW, there's a grammatical error in the man page for tpm2_unseal.  What's=
 the best way to get that fixed?  (Sorry, my mother was an English major).
> =

> Peter
> =

> -----Original Message-----
> From: Joshua Lock [mailto:joshua.g.lock(a)linux.intel.com]
> Sent: Wednesday, July 04, 2018 5:10 AM
> To: Matthias Gerstner; Scheie, Peter M
> Cc: tpm2(a)lists.01.org
> Subject: Re: [tpm2] tpm2-tools man pages not installing?
> =

> =

> =

> On 03/07/2018 15:53, Matthias Gerstner wrote:
>> Hello,
>>
>> On Tue, Jul 03, 2018 at 01:46:14PM +0000, Scheie, Peter M wrote:
>>> When I build & install tpm2-tools, the man pages don't seem to get
>>> installed.  I'm just using the default './configure; make; sudo make
>>> install' routine, so everything is going into /usr/local/; therefore,
>>> I'd expect the man pages to end up in /usr/local/share/man, but they
>>> don't.  Do I need add an argument to configure to make that happen?
>>
>> that is actually a bug and I addressed it via commit
>> 72a28f36151db9bfa59a460ae0114dcece218862, however that commit didn't
>> make it into the current release.
>>
>> So you either have to install them manually or, as a workaround, if you
>> have pandoc installed on the system, then the build system tries to
>> generate the man pages and alongside that also installs them.
> =

> Thanks for the report Peter and for pointing to the fix Matthias. I've
> backported the change to the 3.X branch and tagged a release candidate
> for 3.1.1 which includes the fix:
> =

> https://github.com/tpm2-software/tpm2-tools/releases/tag/3.1.1-rc0
> =

> Regards,
> Joshua
>=20

--===============1776144194924431907==--

