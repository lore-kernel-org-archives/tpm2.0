Content-Type: multipart/mixed; boundary="===============5008915040400184133=="
MIME-Version: 1.0
From: Joshua Lock <joshua.g.lock at linux.intel.com>
Subject: Re: [tpm2] tpm2-tools man pages not installing?
Date: Wed, 04 Jul 2018 11:09:33 +0100
Message-ID: <52f0d057-27f5-d0a5-9685-dbb18b78995f@linux.intel.com>
In-Reply-To: 20180703145323.GA16483@f195.suse.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5008915040400184133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 03/07/2018 15:53, Matthias Gerstner wrote:
> Hello,
> =

> On Tue, Jul 03, 2018 at 01:46:14PM +0000, Scheie, Peter M wrote:
>> When I build & install tpm2-tools, the man pages don't seem to get
>> installed.  I'm just using the default './configure; make; sudo make
>> install' routine, so everything is going into /usr/local/; therefore,
>> I'd expect the man pages to end up in /usr/local/share/man, but they
>> don't.  Do I need add an argument to configure to make that happen?
> =

> that is actually a bug and I addressed it via commit
> 72a28f36151db9bfa59a460ae0114dcece218862, however that commit didn't
> make it into the current release.
> =

> So you either have to install them manually or, as a workaround, if you
> have pandoc installed on the system, then the build system tries to
> generate the man pages and alongside that also installs them.

Thanks for the report Peter and for pointing to the fix Matthias. I've =

backported the change to the 3.X branch and tagged a release candidate =

for 3.1.1 which includes the fix:

https://github.com/tpm2-software/tpm2-tools/releases/tag/3.1.1-rc0

Regards,
Joshua

--===============5008915040400184133==--

