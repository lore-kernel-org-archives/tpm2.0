Content-Type: multipart/mixed; boundary="===============5886862601760962159=="
MIME-Version: 1.0
From: David Woodhouse <dwmw2 at infradead.org>
Subject: [tpm2] Re: tpm2-pkcs11 update
Date: Mon, 09 Dec 2019 20:42:29 +0000
Message-ID: <F05FE6C4-748A-4364-9B04-B719CE506781@infradead.org>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E58275@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5886862601760962159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 9 December 2019 19:34:41 GMT, "Roberts, William C" <william.c.roberts(a)=
intel.com> wrote:
>> -----Original Message-----
>> From: David Woodhouse [mailto:dwmw2(a)infradead.org]
>> Sent: Monday, December 9, 2019 10:12 AM
>> To: Roberts, William C <william.c.roberts(a)intel.com>; tpm2
><tpm2(a)lists.01.org>
>> Subject: Re: [tpm2] tpm2-pkcs11 update
>> =

>> On Mon, 2019-12-09 at 15:56 +0000, Roberts, William C wrote:
>> > All,
>> >
>> > I just wanted to update everyone on the status of tpm2-pkcs11
>> > project. I just did a major push to refactor some of the internals
>to
>> > make DB schema changes less likely
>> > and make the internal handling of attributes far less clunky. This
>> > week I am going to focus on documentation, testing and bugs and am
>> > planning the release candidate for next week.
>> =

>> Can it import/export the keys in a form that is interchangeable with
>> the ENGINE now? That would be really useful.
>
>Not yet, but it should be possible.

As long as your parent key generation is compatible with the standard used =
by the engines, yes. If not, it can't work.
-- =

Sent from my Android device with K-9 Mail. Please excuse my brevity.
--===============5886862601760962159==--

