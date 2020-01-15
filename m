Content-Type: multipart/mixed; boundary="===============3231599372407260021=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: [tpm2] Re: Device Identity Attestation with tpm2-tools
Date: Wed, 15 Jan 2020 11:03:28 -0800
Message-ID: <9785df44-2ac5-c398-1d96-fd9a56f210d1@intel.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E66B7A@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3231599372407260021==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 1/15/20 6:08 AM, Roberts, William C wrote:
> <snip>
>> working even after the device disk and tpm is cleared.
>> The tpm will always derive the same EK if one provides the same paramete=
rs.
> This is true 99+% of the time. However, the spec allows TPMs to to implem=
ent the CHANGEEPS
> Command that will cause the endorsement hierarchy seed to change. When th=
is occurs, calls
> to createprimary  with the same templates to produce different keys. Whil=
e this is rare, I've never
> seen one in the wild, you may wish to check the command interface for cha=
ngeeps so you know
> what's possible with that TPM. Similar commands exist for other hierarchi=
es as well.

Also keep in mind that tpm2_clear command changes the SPS so any keys in
the storage hierarchy will be invalid.

-- =

Tadeusz
--===============3231599372407260021==--

