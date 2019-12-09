Content-Type: multipart/mixed; boundary="===============3727665205486930447=="
MIME-Version: 1.0
From: David Woodhouse <dwmw2 at infradead.org>
Subject: [tpm2] Re: tpm2-pkcs11 update
Date: Mon, 09 Dec 2019 22:06:39 +0000
Message-ID: <76308CFE-208A-4B0F-9011-192F1DDC7DE2@infradead.org>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E58308@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3727665205486930447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 9 December 2019 22:01:36 GMT, "Roberts, William C" <william.c.roberts(a)=
intel.com> wrote:
>
>
>> -----Original Message-----
>> From: David Woodhouse [mailto:dwmw2(a)infradead.org]
>> Sent: Monday, December 9, 2019 2:42 PM
>> To: Roberts, William C <william.c.roberts(a)intel.com>; tpm2
><tpm2(a)lists.01.org>
>> Subject: RE: [tpm2] tpm2-pkcs11 update
>> =

>> =

>> =

>> On 9 December 2019 19:34:41 GMT, "Roberts, William C"
>> <william.c.roberts(a)intel.com> wrote:
>> >> -----Original Message-----
>> >> From: David Woodhouse [mailto:dwmw2(a)infradead.org]
>> >> Sent: Monday, December 9, 2019 10:12 AM
>> >> To: Roberts, William C <william.c.roberts(a)intel.com>; tpm2
>> ><tpm2(a)lists.01.org>
>> >> Subject: Re: [tpm2] tpm2-pkcs11 update
>> >>
>> >> On Mon, 2019-12-09 at 15:56 +0000, Roberts, William C wrote:
>> >> > All,
>> >> >
>> >> > I just wanted to update everyone on the status of tpm2-pkcs11
>> >> > project. I just did a major push to refactor some of the
>internals
>> >to
>> >> > make DB schema changes less likely
>> >> > and make the internal handling of attributes far less clunky.
>This
>> >> > week I am going to focus on documentation, testing and bugs and
>am
>> >> > planning the release candidate for next week.
>> >>
>> >> Can it import/export the keys in a form that is interchangeable
>with
>> >> the ENGINE now? That would be really useful.
>> >
>> >Not yet, but it should be possible.
>> =

>> As long as your parent key generation is compatible with the standard
>used by
>> the engines, yes. If not, it can't work.
>
>That's why I said it's possible. Our parent key is completely
>configurable at token
>Initialization time and can be an existing persistent key as defined in
>the PC Client
>Guide which is what the engine is hardcoded to.

The engine generates a transient EC key as its parent by default.

But yes, if the token generates a persistent key it can export a PEM key fo=
r the engine which identifies that same persistent key as its parent.

So it's just a matter of making sure the token can use other parent keys th=
an the one it made for itself, including the auto-generated transient ones?

-- =

Sent from my Android device with K-9 Mail. Please excuse my brevity.
--===============3727665205486930447==--

