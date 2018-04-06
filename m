Content-Type: multipart/mixed; boundary="===============7409644786603546087=="
MIME-Version: 1.0
From: Tomasz Przybysz <tomaszp at mikronika.pl>
Subject: Re: [tpm2] SLB 9670 TPM 2.0 device,
 How many keys I can store inside TPM as persistent
Date: Fri, 06 Apr 2018 08:30:53 +0200
Message-ID: <7d78c3cb-bc46-d0d3-fd03-04da2012713f@mikronika.pl>
In-Reply-To: e6f127d2-576d-274f-817b-fe731304814e@mikronika.pl
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7409644786603546087==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I have done next tests and:

./tpm2_getcap -c properties-variable
TPM_PT_HR_PERSISTENT:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000012
TPM_PT_HR_PERSISTENT_AVAIL:=C2=A0 0x00000000

./tpm2_listpersistent
persistent-handle[0]:0x81010001 key-alg:rsa hash-alg:sha256
object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|restricte=
d|decrypt
persistent-handle[1]:0x81010002 key-alg:rsa hash-alg:sha256
object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt|s=
ign
persistent-handle[2]:0x81010003 key-alg:rsa hash-alg:sha256
object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|restricte=
d|decrypt
persistent-handle[3]:0x81010010 key-alg:rsa hash-alg:sha256
object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt|s=
ign
persistent-handle[4]:0x81010011 key-alg:rsa hash-alg:sha256
object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt|s=
ign
persistent-handle[5]:0x81010012 key-alg:rsa hash-alg:sha256
object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt|s=
ign
persistent-handle[6]:0x81010013 key-alg:rsa hash-alg:sha256
object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt|s=
ign
persistent-handle[7]:0x81010014 key-alg:rsa hash-alg:sha256
object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt|s=
ign
persistent-handle[8]:0x81010015 key-alg:rsa hash-alg:sha256
object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt|s=
ign
persistent-handle[9]:0x81010016 key-alg:rsa hash-alg:sha256
object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt|s=
ign
persistent-handle[10]:0x81010017 key-alg:rsa hash-alg:sha256
object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt|s=
ign
persistent-handle[11]:0x81010020 key-alg:rsa hash-alg:sha256
object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt|s=
ign
persistent-handle[12]:0x81010021 key-alg:rsa hash-alg:sha256
object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt|s=
ign
persistent-handle[13]:0x81010022 key-alg:rsa hash-alg:sha256
object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt|s=
ign
persistent-handle[14]:0x81010023 key-alg:rsa hash-alg:sha256
object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt|s=
ign
persistent-handle[15]:0x81010030 key-alg:rsa hash-alg:sha256
object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|restricte=
d|decrypt
persistent-handle[16]:0x81010060 key-alg:symcipher hash-alg:sha256
object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt|s=
ign
persistent-handle[17]:0x81010061 key-alg:symcipher hash-alg:sha256
object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt|s=
ign

So SLB 9670 has 18 slots for persistent object. Type of key doesn't
matter. Thare are always 18 slots.



W dniu 2018-04-06 o=C2=A007:49, Tomasz Przybysz pisze:
>
> 	=

> Ten=C2=A0nadawca=C2=A0nie=C2=A0przeszed=C5=82=C2=A0test=C3=B3w=C2=A0wykry=
waj=C4=85cych=C2=A0oszustwa=C2=A0i=C2=A0mo=C5=BCe=C2=A0nie=C2=A0by=C4=87=C2=
=A0osob=C4=85,=C2=A0kt=C3=B3r=C4=85=C2=A0wydaje=C2=A0si=C4=99=C2=A0by=C4=87=
.=C2=A0Dowiedz=C2=A0si=C4=99=C2=A0wi=C4=99cej=C2=A0o=C2=A0podszywaniu=C2=A0=
si=C4=99
> <http://aka.ms/LearnAboutSpoofing>
> 	Opinia <http://aka.ms/SafetyTipsFeedback>
>
> Hi,
>
> I want to store about 16 RSA 2048 bits keys used to TLS protocol.
> I have Infineon SLB 9670 TPM2.0 chip.
> I wonder if I can store them inside TPM device (as persistant) or I
> need to store keys outside chip and load them to the device when needed ?
> What is the real capacity of this device ?
>
>
> *SLB 9670 TCG Family 2 Level 00 Rev. 01.16 Data Sheet says:*
>
> =E2=80=A2 Up to 3 loaded sessions (TPM_PT_HR_LOADED_MIN)
> =E2=80=A2 Up to 64 active sessions (TPM_PT_ACTIVE_SESSIONS_MAX)
> =E2=80=A2 Up to 3 loaded transient Objects (TPM_PT_HR_TRANSIENT_MIN)
> *=E2=80=A2 Up to 7 loaded persistent Objects (TPM_PT_HR_PERSISTENT_MIN)*
> =E2=80=A2 Up to 8 NV counters
> =E2=80=A2 Up to 1 kByte for command parameters and response parameters
> =E2=80=A2 Up to 768 Byte for NV read or NV write
>
>
> *tpm2-tss-1.4.0\include\sapi\tss2_tpm2_types.h says:*
>
> #define=C2=A0=C2=A0=C2=A0 TPM_PT_HR_PERSISTENT_MIN=C2=A0=C2=A0=C2=A0 (PT_=
FIXED + 15 )=C2=A0=C2=A0=C2=A0 =C2=A0/* the
> minimum number of persistent objects that can be held in TPM NV
> memoryNOTE=C2=A0=C2=A0=C2=A0 This minimum shall be no less than the minim=
um value
> required by the platformspecific specification to which the TPM is
> built.=C2=A0 */
>
> I don't uderstand. So what is max capacity of this device ?
> *
> Up to 7 loaded persistent Objects***for my understandig it's max
> capacity. But why this parameter is called *TPM_PT_HR_PERSISTENT_MIN* ?
> vs
> "the minimum number of persistent objects that can be held in TPM NV
> memory"
>
> So is it min or max ?
>
> What does 'loaded persistent' mean=C2=A0 ? As I know persistent key is
> always loaded.
> When I want to use persistent key I don't need load it.
>
> from my TPM device:
> ./tpm2_getcap -c properties-fixed
> WARN: More data to be queried: capability: 0x6, property: 0x100
>
> TPM_PT_FAMILY_INDICATOR:
> =C2=A0 as UINT32:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x08322e3000
> =C2=A0 as string:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "2.0"
> TPM_PT_LEVEL:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0
> TPM_PT_REVISION:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 1.16
> TPM_PT_DAY_OF_YEAR:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x000=
0000f
> TPM_PT_YEAR:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x000007e0
> TPM_PT_MANUFACTURER:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x49465800
> TPM_PT_VENDOR_STRING_1:
> =C2=A0 as UINT32:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x534c4239
> =C2=A0 as string:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "SLB9"
> TPM_PT_VENDOR_STRING_2:
> =C2=A0 as UINT32:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x36373000
> =C2=A0 as string:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "670"
> TPM_PT_VENDOR_STRING_3:
> =C2=A0 as UINT32:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000000
> =C2=A0 as string:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ""
> TPM_PT_VENDOR_STRING_4:
> =C2=A0 as UINT32:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000000
> =C2=A0 as string:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ""
> TPM_PT_VENDOR_TPM_TYPE:=C2=A0=C2=A0=C2=A0=C2=A0 0x00000000
> TPM_PT_FIRMWARE_VERSION_1:=C2=A0 0x0007003d
> TPM_PT_FIRMWARE_VERSION_2:=C2=A0 0x000ae100
> TPM_PT_INPUT_BUFFER:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000400
> TPM_PT_HR_TRANSIENT_MIN:=C2=A0=C2=A0=C2=A0 0x00000003
> *TPM_PT_HR_PERSISTENT_MIN:=C2=A0=C2=A0 0x00000007*
> TPM_PT_HR_LOADED_MIN:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000003
> TPM_PT_ACTIVE_SESSIONS_MAX: 0x00000040
> TPM_PT_PCR_COUNT:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x00000018
> TPM_PT_PCR_SELECT_MIN:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000003
> TPM_PT_CONTEXT_GAP_MAX:=C2=A0=C2=A0=C2=A0=C2=A0 0x0000ffff
> TPM_PT_NV_COUNTERS_MAX:=C2=A0=C2=A0=C2=A0=C2=A0 0x00000008
> TPM_PT_NV_INDEX_MAX:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000680
> TPM_PT_MEMORY:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0x00000006
> TPM_PT_CLOCK_UPDATE:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00080000
> TPM_PT_CONTEXT_HASH:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000000b
> TPM_PT_CONTEXT_SYM:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x000=
00006
> TPM_PT_CONTEXT_SYM_SIZE:=C2=A0=C2=A0=C2=A0 0x00000080
> TPM_PT_ORDERLY_COUNT:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x000000ff
> TPM_PT_MAX_COMMAND_SIZE:=C2=A0=C2=A0=C2=A0 0x00000500
> TPM_PT_MAX_RESPONSE_SIZE:=C2=A0=C2=A0 0x00000500
> TPM_PT_MAX_DIGEST:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0x00000020
> TPM_PT_MAX_OBJECT_CONTEXT:=C2=A0 0x000003b8
> TPM_PT_MAX_SESSION_CONTEXT: 0x000000eb
> TPM_PT_PS_FAMILY_INDICATOR: 0x00000001
> TPM_PT_PS_LEVEL:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x00000000
> TPM_PT_PS_REVISION:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x000=
00100
> TPM_PT_PS_DAY_OF_YEAR:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000000
> TPM_PT_PS_YEAR:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0x00000000
> TPM_PT_SPLIT_MAX:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x00000080
> TPM_PT_TOTAL_COMMANDS:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000005a
> TPM_PT_LIBRARY_COMMANDS:=C2=A0=C2=A0=C2=A0 0x00000059
> TPM_PT_VENDOR_COMMANDS:=C2=A0=C2=A0=C2=A0=C2=A0 0x00000001
> TPM_PT_NV_BUFFER_MAX:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000300
>
> At this moment I can store and use 18 RSA keys=C2=A0 inside TPM as
> persistent keys and I think I can store more.
>
> ./tpm2_listpersistent
> persistent-handle[0]:0x81010001 key-alg:rsa hash-alg:sha256
> object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|restric=
ted|decrypt
> persistent-handle[1]:0x81010002 key-alg:rsa hash-alg:sha256
> object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt=
|sign
> persistent-handle[2]:0x81010003 key-alg:rsa hash-alg:sha256
> object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|restric=
ted|decrypt
> persistent-handle[3]:0x81010010 key-alg:rsa hash-alg:sha256
> object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt=
|sign
> persistent-handle[4]:0x81010011 key-alg:rsa hash-alg:sha256
> object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt=
|sign
> persistent-handle[5]:0x81010012 key-alg:rsa hash-alg:sha256
> object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt=
|sign
> persistent-handle[6]:0x81010013 key-alg:rsa hash-alg:sha256
> object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt=
|sign
> persistent-handle[7]:0x81010014 key-alg:rsa hash-alg:sha256
> object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt=
|sign
> persistent-handle[8]:0x81010015 key-alg:rsa hash-alg:sha256
> object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt=
|sign
> persistent-handle[9]:0x81010016 key-alg:rsa hash-alg:sha256
> object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt=
|sign
> persistent-handle[10]:0x81010017 key-alg:rsa hash-alg:sha256
> object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt=
|sign
> persistent-handle[11]:0x81010020 key-alg:rsa hash-alg:sha256
> object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt=
|sign
> persistent-handle[12]:0x81010021 key-alg:rsa hash-alg:sha256
> object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt=
|sign
> persistent-handle[13]:0x81010022 key-alg:rsa hash-alg:sha256
> object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt=
|sign
> persistent-handle[14]:0x81010023 key-alg:rsa hash-alg:sha256
> object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|decrypt=
|sign
> persistent-handle[15]:0x81010030 key-alg:rsa hash-alg:sha256
> object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|restric=
ted|decrypt
> persistent-handle[16]:0x81010031 key-alg:rsa hash-alg:sha256
> object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|restric=
ted|decrypt
> persistent-handle[17]:0x81010032 key-alg:rsa hash-alg:sha256
> object-attr:fixedtpm|fixedparent|sensitivedataorigin|userwithauth|restric=
ted|decrypt
>
> I want to know the limits. Documented limits.
>
> Thanks,
> Tom
>
>
>
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2


--===============7409644786603546087==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD11dGYtOCI+CiAgPC9oZWFkPgogIDxib2R5IHRleHQ9IiMw
MDAwMDAiIGJnY29sb3I9IiNGRkZGRkYiPgogICAgSSBoYXZlIGRvbmUgbmV4dCB0ZXN0cyBhbmQ6
PGJyPgogICAgPGJyPgogICAgLi90cG0yX2dldGNhcCAtYyBwcm9wZXJ0aWVzLXZhcmlhYmxlPGJy
PgogICAgVFBNX1BUX0hSX1BFUlNJU1RFTlQ6wqDCoMKgwqDCoMKgwqAgMHgwMDAwMDAxMjxicj4K
ICAgIFRQTV9QVF9IUl9QRVJTSVNURU5UX0FWQUlMOsKgIDB4MDAwMDAwMDA8YnI+CiAgICA8YnI+
CiAgICAuL3RwbTJfbGlzdHBlcnNpc3RlbnQ8YnI+CiAgICBwZXJzaXN0ZW50LWhhbmRsZVswXTow
eDgxMDEwMDAxIGtleS1hbGc6cnNhIGhhc2gtYWxnOnNoYTI1NgpvYmplY3QtYXR0cjpmaXhlZHRw
bXxmaXhlZHBhcmVudHxzZW5zaXRpdmVkYXRhb3JpZ2lufHVzZXJ3aXRoYXV0aHxyZXN0cmljdGVk
fGRlY3J5cHQ8YnI+CiAgICBwZXJzaXN0ZW50LWhhbmRsZVsxXToweDgxMDEwMDAyIGtleS1hbGc6
cnNhIGhhc2gtYWxnOnNoYTI1NgpvYmplY3QtYXR0cjpmaXhlZHRwbXxmaXhlZHBhcmVudHxzZW5z
aXRpdmVkYXRhb3JpZ2lufHVzZXJ3aXRoYXV0aHxkZWNyeXB0fHNpZ248YnI+CiAgICBwZXJzaXN0
ZW50LWhhbmRsZVsyXToweDgxMDEwMDAzIGtleS1hbGc6cnNhIGhhc2gtYWxnOnNoYTI1NgpvYmpl
Y3QtYXR0cjpmaXhlZHRwbXxmaXhlZHBhcmVudHxzZW5zaXRpdmVkYXRhb3JpZ2lufHVzZXJ3aXRo
YXV0aHxyZXN0cmljdGVkfGRlY3J5cHQ8YnI+CiAgICBwZXJzaXN0ZW50LWhhbmRsZVszXToweDgx
MDEwMDEwIGtleS1hbGc6cnNhIGhhc2gtYWxnOnNoYTI1NgpvYmplY3QtYXR0cjpmaXhlZHRwbXxm
aXhlZHBhcmVudHxzZW5zaXRpdmVkYXRhb3JpZ2lufHVzZXJ3aXRoYXV0aHxkZWNyeXB0fHNpZ248
YnI+CiAgICBwZXJzaXN0ZW50LWhhbmRsZVs0XToweDgxMDEwMDExIGtleS1hbGc6cnNhIGhhc2gt
YWxnOnNoYTI1NgpvYmplY3QtYXR0cjpmaXhlZHRwbXxmaXhlZHBhcmVudHxzZW5zaXRpdmVkYXRh
b3JpZ2lufHVzZXJ3aXRoYXV0aHxkZWNyeXB0fHNpZ248YnI+CiAgICBwZXJzaXN0ZW50LWhhbmRs
ZVs1XToweDgxMDEwMDEyIGtleS1hbGc6cnNhIGhhc2gtYWxnOnNoYTI1NgpvYmplY3QtYXR0cjpm
aXhlZHRwbXxmaXhlZHBhcmVudHxzZW5zaXRpdmVkYXRhb3JpZ2lufHVzZXJ3aXRoYXV0aHxkZWNy
eXB0fHNpZ248YnI+CiAgICBwZXJzaXN0ZW50LWhhbmRsZVs2XToweDgxMDEwMDEzIGtleS1hbGc6
cnNhIGhhc2gtYWxnOnNoYTI1NgpvYmplY3QtYXR0cjpmaXhlZHRwbXxmaXhlZHBhcmVudHxzZW5z
aXRpdmVkYXRhb3JpZ2lufHVzZXJ3aXRoYXV0aHxkZWNyeXB0fHNpZ248YnI+CiAgICBwZXJzaXN0
ZW50LWhhbmRsZVs3XToweDgxMDEwMDE0IGtleS1hbGc6cnNhIGhhc2gtYWxnOnNoYTI1NgpvYmpl
Y3QtYXR0cjpmaXhlZHRwbXxmaXhlZHBhcmVudHxzZW5zaXRpdmVkYXRhb3JpZ2lufHVzZXJ3aXRo
YXV0aHxkZWNyeXB0fHNpZ248YnI+CiAgICBwZXJzaXN0ZW50LWhhbmRsZVs4XToweDgxMDEwMDE1
IGtleS1hbGc6cnNhIGhhc2gtYWxnOnNoYTI1NgpvYmplY3QtYXR0cjpmaXhlZHRwbXxmaXhlZHBh
cmVudHxzZW5zaXRpdmVkYXRhb3JpZ2lufHVzZXJ3aXRoYXV0aHxkZWNyeXB0fHNpZ248YnI+CiAg
ICBwZXJzaXN0ZW50LWhhbmRsZVs5XToweDgxMDEwMDE2IGtleS1hbGc6cnNhIGhhc2gtYWxnOnNo
YTI1NgpvYmplY3QtYXR0cjpmaXhlZHRwbXxmaXhlZHBhcmVudHxzZW5zaXRpdmVkYXRhb3JpZ2lu
fHVzZXJ3aXRoYXV0aHxkZWNyeXB0fHNpZ248YnI+CiAgICBwZXJzaXN0ZW50LWhhbmRsZVsxMF06
MHg4MTAxMDAxNyBrZXktYWxnOnJzYSBoYXNoLWFsZzpzaGEyNTYKb2JqZWN0LWF0dHI6Zml4ZWR0
cG18Zml4ZWRwYXJlbnR8c2Vuc2l0aXZlZGF0YW9yaWdpbnx1c2Vyd2l0aGF1dGh8ZGVjcnlwdHxz
aWduPGJyPgogICAgcGVyc2lzdGVudC1oYW5kbGVbMTFdOjB4ODEwMTAwMjAga2V5LWFsZzpyc2Eg
aGFzaC1hbGc6c2hhMjU2Cm9iamVjdC1hdHRyOmZpeGVkdHBtfGZpeGVkcGFyZW50fHNlbnNpdGl2
ZWRhdGFvcmlnaW58dXNlcndpdGhhdXRofGRlY3J5cHR8c2lnbjxicj4KICAgIHBlcnNpc3RlbnQt
aGFuZGxlWzEyXToweDgxMDEwMDIxIGtleS1hbGc6cnNhIGhhc2gtYWxnOnNoYTI1NgpvYmplY3Qt
YXR0cjpmaXhlZHRwbXxmaXhlZHBhcmVudHxzZW5zaXRpdmVkYXRhb3JpZ2lufHVzZXJ3aXRoYXV0
aHxkZWNyeXB0fHNpZ248YnI+CiAgICBwZXJzaXN0ZW50LWhhbmRsZVsxM106MHg4MTAxMDAyMiBr
ZXktYWxnOnJzYSBoYXNoLWFsZzpzaGEyNTYKb2JqZWN0LWF0dHI6Zml4ZWR0cG18Zml4ZWRwYXJl
bnR8c2Vuc2l0aXZlZGF0YW9yaWdpbnx1c2Vyd2l0aGF1dGh8ZGVjcnlwdHxzaWduPGJyPgogICAg
cGVyc2lzdGVudC1oYW5kbGVbMTRdOjB4ODEwMTAwMjMga2V5LWFsZzpyc2EgaGFzaC1hbGc6c2hh
MjU2Cm9iamVjdC1hdHRyOmZpeGVkdHBtfGZpeGVkcGFyZW50fHNlbnNpdGl2ZWRhdGFvcmlnaW58
dXNlcndpdGhhdXRofGRlY3J5cHR8c2lnbjxicj4KICAgIHBlcnNpc3RlbnQtaGFuZGxlWzE1XTow
eDgxMDEwMDMwIGtleS1hbGc6cnNhIGhhc2gtYWxnOnNoYTI1NgpvYmplY3QtYXR0cjpmaXhlZHRw
bXxmaXhlZHBhcmVudHxzZW5zaXRpdmVkYXRhb3JpZ2lufHVzZXJ3aXRoYXV0aHxyZXN0cmljdGVk
fGRlY3J5cHQ8YnI+CiAgICBwZXJzaXN0ZW50LWhhbmRsZVsxNl06MHg4MTAxMDA2MCBrZXktYWxn
OnN5bWNpcGhlciBoYXNoLWFsZzpzaGEyNTYKb2JqZWN0LWF0dHI6Zml4ZWR0cG18Zml4ZWRwYXJl
bnR8c2Vuc2l0aXZlZGF0YW9yaWdpbnx1c2Vyd2l0aGF1dGh8ZGVjcnlwdHxzaWduPGJyPgogICAg
cGVyc2lzdGVudC1oYW5kbGVbMTddOjB4ODEwMTAwNjEga2V5LWFsZzpzeW1jaXBoZXIgaGFzaC1h
bGc6c2hhMjU2Cm9iamVjdC1hdHRyOmZpeGVkdHBtfGZpeGVkcGFyZW50fHNlbnNpdGl2ZWRhdGFv
cmlnaW58dXNlcndpdGhhdXRofGRlY3J5cHR8c2lnbjxicj4KICAgIDxicj4KICAgIFNvIFNMQiA5
NjcwIGhhcyAxOCBzbG90cyBmb3IgcGVyc2lzdGVudCBvYmplY3QuIFR5cGUgb2Yga2V5IGRvZXNu
J3QKICAgIG1hdHRlci4gVGhhcmUgYXJlIGFsd2F5cyAxOCBzbG90cy48YnI+CiAgICA8YnI+CiAg
ICA8YnI+CiAgICA8YnI+CiAgICA8ZGl2IGNsYXNzPSJtb3otc2lnbmF0dXJlIj4KICAgICAgPG1l
dGEgaHR0cC1lcXVpdj0iY29udGVudC10eXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9
dXRmLTgiPgogICAgICA8dGl0bGU+PC90aXRsZT4KICAgIDwvZGl2PgogICAgPGRpdiBjbGFzcz0i
bW96LWNpdGUtcHJlZml4Ij5XIGRuaXUgMjAxOC0wNC0wNiBvwqAwNzo0OSwgVG9tYXN6CiAgICAg
IFByenlieXN6IHBpc3plOjxicj4KICAgIDwvZGl2PgogICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0
ZSIKICAgICAgY2l0ZT0ibWlkOmU2ZjEyN2QyLTU3NmQtMjc0Zi04MTdiLWZlNzMxMzA0ODE0ZUBt
aWtyb25pa2EucGwiPgogICAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD11dGYtOCI+CiAgICAgIDx0YWJsZQogICAgICAgIGlkPSJt
c2V4Y2hhbmdlc2FmZXR5dGlwczszMWUzYzkyZi1iM2YxLTRmMmQtMmJhMS0wOGQ1OWI4MjQwZWU7
UjpwbC1QTCIKc3R5bGU9ImNlbGxwYWRkaW5nOjA7Ym9yZGVyOjA7Y2VsbHNwYWNpbmc6MDtkaXNw
bGF5OnRhYmxlO3dpZHRoOjEwMCU7dGFibGUtbGF5b3V0OmZpeGVkO2JvcmRlci1jb2xsYXBzZTpz
ZXBlcmF0ZTtmbG9hdDpub25lOyIKICAgICAgICBjZWxsc3BhY2luZz0iMCIgY2VsbHBhZGRpbmc9
IjAiIGFsaWduPSJsZWZ0IiB3aWR0aD0iMTAwJSIKICAgICAgICBib3JkZXI9IjAiPgogICAgICAg
IDx0Ym9keT4KICAgICAgICAgIDx0cj4KICAgICAgICAgICAgPHRkIGNlbGxwYWRkaW5nPSI3cHgg
MnB4IDdweCAycHgiIHN0eWxlPSJwYWRkaW5nOjdweCAycHggN3B4CiAgICAgICAgICAgICAgMnB4
O2JhY2tncm91bmQtY29sb3I6IzkxMEExOTt2YWxpZ246bWlkZGxlIgogICAgICAgICAgICAgIHZh
bGlnbj0ibWlkZGxlIiBiZ2NvbG9yPSIjOTEwQTE5IiB3aWR0aD0iMXB4Ij4KICAgICAgICAgICAg
ICA8YnI+CiAgICAgICAgICAgIDwvdGQ+CiAgICAgICAgICAgIDx0ZCBjZWxscGFkZGluZz0iN3B4
IDVweCA3cHggMTVweCIgY29sb3I9IiMyMTIxMjEiCiAgICAgICAgICAgICAgc3R5bGU9IndpZHRo
OjEwMCU7YmFja2dyb3VuZC1jb2xvcjojRkRGMkY0O3BhZGRpbmc6N3B4IDVweAogICAgICAgICAg
ICAgIDdweCAxNXB4O2ZvbnQtZmFtaWx5OndmX3NlZ29lLXVpX25vcm1hbCxTZWdvZSBVSSxTZWdv
ZQogICAgICAgICAgICAgIFdQLFRhaG9tYSxBcmlhbCwKc2Fucy1zZXJpZjtmb250LXNpemU6MTJw
eDtmb250LXdlaWdodDpub3JtYWw7Y29sb3I6IzIxMjEyMTt0ZXh0LWFsaWduOmxlZnQ7d29yZC13
cmFwOmJyZWFrLXdvcmQ7IgogICAgICAgICAgICAgIHZhbGlnbj0ibWlkZGxlIiBiZ2NvbG9yPSIj
RkRGMkY0IiB3aWR0aD0iMTAwJSI+CiAgICAgICAgICAgICAgPGRpdj5UZW7CoG5hZGF3Y2HCoG5p
ZcKgcHJ6ZXN6ZWTFgsKgdGVzdMOzd8Kgd3lrcnl3YWrEhWN5Y2jCoG9zenVzdHdhwqBpwqBtb8W8
ZcKgbmllwqBiecSHwqBvc29ixIUswqBrdMOzcsSFwqB3eWRhamXCoHNpxJnCoGJ5xIcuwqBEb3dp
ZWR6wqBzacSZwqB3acSZY2VqwqBvwqA8YQogICAgICAgICAgICAgICAgICBocmVmPSJodHRwOi8v
YWthLm1zL0xlYXJuQWJvdXRTcG9vZmluZyIKICAgICAgICAgICAgICAgICAgbW96LWRvLW5vdC1z
ZW5kPSJ0cnVlIj5wb2Rzenl3YW5pdcKgc2nEmTwvYT48L2Rpdj4KICAgICAgICAgICAgPC90ZD4K
ICAgICAgICAgICAgPHRkIGNlbGxwYWRkaW5nPSI3cHggNXB4IDdweCA1cHgiIGNvbG9yPSIjMjEy
MTIxIgogICAgICAgICAgICAgIHN0eWxlPSJ3aWR0aDo3NXB4O2JhY2tncm91bmQtY29sb3I6I0ZE
RjJGNDtwYWRkaW5nOjdweCA1cHgKICAgICAgICAgICAgICA3cHggNXB4O2ZvbnQtZmFtaWx5Ondm
X3NlZ29lLXVpX25vcm1hbCxTZWdvZSBVSSxTZWdvZQogICAgICAgICAgICAgIFdQLFRhaG9tYSxB
cmlhbCwKc2Fucy1zZXJpZjtmb250LXNpemU6MTJweDtmb250LXdlaWdodDpub3JtYWw7Y29sb3I6
IzIxMjEyMTt0ZXh0LWFsaWduOmxlZnQ7d29yZC13cmFwOmJyZWFrLXdvcmQ7YWxpZ246bGVmdCIK
ICAgICAgICAgICAgICB2YWxpZ249Im1pZGRsZSIgYmdjb2xvcj0iI0ZERjJGNCIgYWxpZ249Imxl
ZnQiCiAgICAgICAgICAgICAgd2lkdGg9Ijc1cHgiPgogICAgICAgICAgICAgIDxhIGhyZWY9Imh0
dHA6Ly9ha2EubXMvU2FmZXR5VGlwc0ZlZWRiYWNrIgogICAgICAgICAgICAgICAgbW96LWRvLW5v
dC1zZW5kPSJ0cnVlIj5PcGluaWE8L2E+PC90ZD4KICAgICAgICAgIDwvdHI+CiAgICAgICAgPC90
Ym9keT4KICAgICAgPC90YWJsZT4KICAgICAgPGRpdj5IaSw8YnI+CiAgICAgICAgPGJyPgogICAg
ICAgIEkgd2FudCB0byBzdG9yZSBhYm91dCAxNiBSU0EgMjA0OCBiaXRzIGtleXMgdXNlZCB0byBU
TFMKICAgICAgICBwcm90b2NvbC48YnI+CiAgICAgICAgSSBoYXZlIEluZmluZW9uIFNMQiA5Njcw
IFRQTTIuMCBjaGlwLjxicj4KICAgICAgICBJIHdvbmRlciBpZiBJIGNhbiBzdG9yZSB0aGVtIGlu
c2lkZSBUUE0gZGV2aWNlIChhcyBwZXJzaXN0YW50KQogICAgICAgIG9yIEkgbmVlZCB0byBzdG9y
ZSBrZXlzIG91dHNpZGUgY2hpcCBhbmQgbG9hZCB0aGVtIHRvIHRoZSBkZXZpY2UKICAgICAgICB3
aGVuIG5lZWRlZCA/PGJyPgogICAgICAgIFdoYXQgaXMgdGhlIHJlYWwgY2FwYWNpdHkgb2YgdGhp
cyBkZXZpY2UgPzxicj4KICAgICAgICA8YnI+CiAgICAgICAgPGJyPgogICAgICAgIDxiPlNMQiA5
NjcwIFRDRyBGYW1pbHkgMiBMZXZlbCAwMCBSZXYuIDAxLjE2IERhdGEgU2hlZXQgc2F5czo8L2I+
PGJyPgogICAgICAgIDxicj4KICAgICAgICDigKIgVXAgdG8gMyBsb2FkZWQgc2Vzc2lvbnMgKFRQ
TV9QVF9IUl9MT0FERURfTUlOKTxicj4KICAgICAgICDigKIgVXAgdG8gNjQgYWN0aXZlIHNlc3Np
b25zIChUUE1fUFRfQUNUSVZFX1NFU1NJT05TX01BWCk8YnI+CiAgICAgICAg4oCiIFVwIHRvIDMg
bG9hZGVkIHRyYW5zaWVudCBPYmplY3RzIChUUE1fUFRfSFJfVFJBTlNJRU5UX01JTik8YnI+CiAg
ICAgICAgPGI+4oCiIFVwIHRvIDcgbG9hZGVkIHBlcnNpc3RlbnQgT2JqZWN0cwogICAgICAgICAg
KFRQTV9QVF9IUl9QRVJTSVNURU5UX01JTik8L2I+PGJyPgogICAgICAgIOKAoiBVcCB0byA4IE5W
IGNvdW50ZXJzPGJyPgogICAgICAgIOKAoiBVcCB0byAxIGtCeXRlIGZvciBjb21tYW5kIHBhcmFt
ZXRlcnMgYW5kIHJlc3BvbnNlIHBhcmFtZXRlcnM8YnI+CiAgICAgICAg4oCiIFVwIHRvIDc2OCBC
eXRlIGZvciBOViByZWFkIG9yIE5WIHdyaXRlPGJyPgogICAgICAgIDxicj4KICAgICAgICA8YnI+
CiAgICAgICAgPGI+dHBtMi10c3MtMS40LjBcaW5jbHVkZVxzYXBpXHRzczJfdHBtMl90eXBlcy5o
IHNheXM6PC9iPjxicj4KICAgICAgICA8YnI+CiAgICAgICAgI2RlZmluZcKgwqDCoCBUUE1fUFRf
SFJfUEVSU0lTVEVOVF9NSU7CoMKgwqAgKFBUX0ZJWEVEICsgMTUgKcKgwqDCoCDCoC8qCiAgICAg
ICAgdGhlIG1pbmltdW0gbnVtYmVyIG9mIHBlcnNpc3RlbnQgb2JqZWN0cyB0aGF0IGNhbiBiZSBo
ZWxkIGluIFRQTQogICAgICAgIE5WIG1lbW9yeU5PVEXCoMKgwqAgVGhpcyBtaW5pbXVtIHNoYWxs
IGJlIG5vIGxlc3MgdGhhbiB0aGUgbWluaW11bQogICAgICAgIHZhbHVlIHJlcXVpcmVkIGJ5IHRo
ZSBwbGF0Zm9ybXNwZWNpZmljIHNwZWNpZmljYXRpb24gdG8gd2hpY2gKICAgICAgICB0aGUgVFBN
IGlzIGJ1aWx0LsKgICovPGJyPgogICAgICAgIDxicj4KICAgICAgICBJIGRvbid0IHVkZXJzdGFu
ZC4gU28gd2hhdCBpcyBtYXggY2FwYWNpdHkgb2YgdGhpcyBkZXZpY2UgPzxicj4KICAgICAgICA8
ZGl2IGNsYXNzPSJtb3otc2lnbmF0dXJlIj48Yj48YnI+CiAgICAgICAgICAgIFVwIHRvIDcgbG9h
ZGVkIHBlcnNpc3RlbnQgT2JqZWN0czwvYj48Yj4gPC9iPmZvciBteQogICAgICAgICAgdW5kZXJz
dGFuZGlnIGl0J3MgbWF4IGNhcGFjaXR5LiBCdXQgd2h5IHRoaXMgcGFyYW1ldGVyIGlzCiAgICAg
ICAgICBjYWxsZWQKICAgICAgICAgIDxiPlRQTV9QVF9IUl9QRVJTSVNURU5UX01JTjwvYj4gPzxi
cj4KICAgICAgICAgIHZzIDxicj4KICAgICAgICAgICJ0aGUgbWluaW11bSBudW1iZXIgb2YgcGVy
c2lzdGVudCBvYmplY3RzIHRoYXQgY2FuIGJlIGhlbGQgaW4KICAgICAgICAgIFRQTSBOViBtZW1v
cnkiPGJyPgogICAgICAgICAgPGJyPgogICAgICAgICAgU28gaXMgaXQgbWluIG9yIG1heCA/PGJy
PgogICAgICAgICAgPGJyPgogICAgICAgICAgV2hhdCBkb2VzICdsb2FkZWQgcGVyc2lzdGVudCcg
bWVhbsKgID8gQXMgSSBrbm93IHBlcnNpc3RlbnQga2V5CiAgICAgICAgICBpcyBhbHdheXMgbG9h
ZGVkLjxicj4KICAgICAgICAgIFdoZW4gSSB3YW50IHRvIHVzZSBwZXJzaXN0ZW50IGtleSBJIGRv
bid0IG5lZWQgbG9hZCBpdC48YnI+CiAgICAgICAgICA8YnI+CiAgICAgICAgICBmcm9tIG15IFRQ
TSBkZXZpY2U6PGJyPgogICAgICAgICAgLi90cG0yX2dldGNhcCAtYyBwcm9wZXJ0aWVzLWZpeGVk
PGJyPgogICAgICAgICAgV0FSTjogTW9yZSBkYXRhIHRvIGJlIHF1ZXJpZWQ6IGNhcGFiaWxpdHk6
IDB4NiwgcHJvcGVydHk6CiAgICAgICAgICAweDEwMDxicj4KICAgICAgICAgIDxicj4KICAgICAg
ICAgIFRQTV9QVF9GQU1JTFlfSU5ESUNBVE9SOjxicj4KICAgICAgICAgIMKgIGFzIFVJTlQzMjrC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgwODMyMmUzMDAwPGJyPgogICAgICAgICAg
wqAgYXMgc3RyaW5nOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiMi4wIjxicj4KICAg
ICAgICAgIFRQTV9QVF9MRVZFTDrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDA8YnI+CiAg
ICAgICAgICBUUE1fUFRfUkVWSVNJT046wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxLjE2PGJyPgog
ICAgICAgICAgVFBNX1BUX0RBWV9PRl9ZRUFSOsKgwqDCoMKgwqDCoMKgwqAgMHgwMDAwMDAwZjxi
cj4KICAgICAgICAgIFRQTV9QVF9ZRUFSOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAw
eDAwMDAwN2UwPGJyPgogICAgICAgICAgVFBNX1BUX01BTlVGQUNUVVJFUjrCoMKgwqDCoMKgwqDC
oCAweDQ5NDY1ODAwPGJyPgogICAgICAgICAgVFBNX1BUX1ZFTkRPUl9TVFJJTkdfMTo8YnI+CiAg
ICAgICAgICDCoCBhcyBVSU5UMzI6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4NTM0
YzQyMzk8YnI+CiAgICAgICAgICDCoCBhcyBzdHJpbmc6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICJTTEI5Ijxicj4KICAgICAgICAgIFRQTV9QVF9WRU5ET1JfU1RSSU5HXzI6PGJyPgog
ICAgICAgICAgwqAgYXMgVUlOVDMyOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDM2
MzczMDAwPGJyPgogICAgICAgICAgwqAgYXMgc3RyaW5nOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAiNjcwIjxicj4KICAgICAgICAgIFRQTV9QVF9WRU5ET1JfU1RSSU5HXzM6PGJyPgog
ICAgICAgICAgwqAgYXMgVUlOVDMyOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDAw
MDAwMDAwPGJyPgogICAgICAgICAgwqAgYXMgc3RyaW5nOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAiIjxicj4KICAgICAgICAgIFRQTV9QVF9WRU5ET1JfU1RSSU5HXzQ6PGJyPgogICAg
ICAgICAgwqAgYXMgVUlOVDMyOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDAwMDAw
MDAwPGJyPgogICAgICAgICAgwqAgYXMgc3RyaW5nOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAiIjxicj4KICAgICAgICAgIFRQTV9QVF9WRU5ET1JfVFBNX1RZUEU6wqDCoMKgwqAgMHgw
MDAwMDAwMDxicj4KICAgICAgICAgIFRQTV9QVF9GSVJNV0FSRV9WRVJTSU9OXzE6wqAgMHgwMDA3
MDAzZDxicj4KICAgICAgICAgIFRQTV9QVF9GSVJNV0FSRV9WRVJTSU9OXzI6wqAgMHgwMDBhZTEw
MDxicj4KICAgICAgICAgIFRQTV9QVF9JTlBVVF9CVUZGRVI6wqDCoMKgwqDCoMKgwqAgMHgwMDAw
MDQwMDxicj4KICAgICAgICAgIFRQTV9QVF9IUl9UUkFOU0lFTlRfTUlOOsKgwqDCoCAweDAwMDAw
MDAzPGJyPgogICAgICAgICAgPGI+VFBNX1BUX0hSX1BFUlNJU1RFTlRfTUlOOsKgwqAgMHgwMDAw
MDAwNzwvYj48YnI+CiAgICAgICAgICBUUE1fUFRfSFJfTE9BREVEX01JTjrCoMKgwqDCoMKgwqAg
MHgwMDAwMDAwMzxicj4KICAgICAgICAgIFRQTV9QVF9BQ1RJVkVfU0VTU0lPTlNfTUFYOiAweDAw
MDAwMDQwPGJyPgogICAgICAgICAgVFBNX1BUX1BDUl9DT1VOVDrCoMKgwqDCoMKgwqDCoMKgwqDC
oCAweDAwMDAwMDE4PGJyPgogICAgICAgICAgVFBNX1BUX1BDUl9TRUxFQ1RfTUlOOsKgwqDCoMKg
wqAgMHgwMDAwMDAwMzxicj4KICAgICAgICAgIFRQTV9QVF9DT05URVhUX0dBUF9NQVg6wqDCoMKg
wqAgMHgwMDAwZmZmZjxicj4KICAgICAgICAgIFRQTV9QVF9OVl9DT1VOVEVSU19NQVg6wqDCoMKg
wqAgMHgwMDAwMDAwODxicj4KICAgICAgICAgIFRQTV9QVF9OVl9JTkRFWF9NQVg6wqDCoMKgwqDC
oMKgwqAgMHgwMDAwMDY4MDxicj4KICAgICAgICAgIFRQTV9QVF9NRU1PUlk6wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgMHgwMDAwMDAwNjxicj4KICAgICAgICAgIFRQTV9QVF9DTE9DS19VUERB
VEU6wqDCoMKgwqDCoMKgwqAgMHgwMDA4MDAwMDxicj4KICAgICAgICAgIFRQTV9QVF9DT05URVhU
X0hBU0g6wqDCoMKgwqDCoMKgwqAgMHgwMDAwMDAwYjxicj4KICAgICAgICAgIFRQTV9QVF9DT05U
RVhUX1NZTTrCoMKgwqDCoMKgwqDCoMKgIDB4MDAwMDAwMDY8YnI+CiAgICAgICAgICBUUE1fUFRf
Q09OVEVYVF9TWU1fU0laRTrCoMKgwqAgMHgwMDAwMDA4MDxicj4KICAgICAgICAgIFRQTV9QVF9P
UkRFUkxZX0NPVU5UOsKgwqDCoMKgwqDCoCAweDAwMDAwMGZmPGJyPgogICAgICAgICAgVFBNX1BU
X01BWF9DT01NQU5EX1NJWkU6wqDCoMKgIDB4MDAwMDA1MDA8YnI+CiAgICAgICAgICBUUE1fUFRf
TUFYX1JFU1BPTlNFX1NJWkU6wqDCoCAweDAwMDAwNTAwPGJyPgogICAgICAgICAgVFBNX1BUX01B
WF9ESUdFU1Q6wqDCoMKgwqDCoMKgwqDCoMKgIDB4MDAwMDAwMjA8YnI+CiAgICAgICAgICBUUE1f
UFRfTUFYX09CSkVDVF9DT05URVhUOsKgIDB4MDAwMDAzYjg8YnI+CiAgICAgICAgICBUUE1fUFRf
TUFYX1NFU1NJT05fQ09OVEVYVDogMHgwMDAwMDBlYjxicj4KICAgICAgICAgIFRQTV9QVF9QU19G
QU1JTFlfSU5ESUNBVE9SOiAweDAwMDAwMDAxPGJyPgogICAgICAgICAgVFBNX1BUX1BTX0xFVkVM
OsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgwMDAwMDAwMDxicj4KICAgICAgICAgIFRQTV9QVF9Q
U19SRVZJU0lPTjrCoMKgwqDCoMKgwqDCoMKgIDB4MDAwMDAxMDA8YnI+CiAgICAgICAgICBUUE1f
UFRfUFNfREFZX09GX1lFQVI6wqDCoMKgwqDCoCAweDAwMDAwMDAwPGJyPgogICAgICAgICAgVFBN
X1BUX1BTX1lFQVI6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MDAwMDAwMDA8YnI+CiAgICAg
ICAgICBUUE1fUFRfU1BMSVRfTUFYOsKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MDAwMDAwODA8YnI+
CiAgICAgICAgICBUUE1fUFRfVE9UQUxfQ09NTUFORFM6wqDCoMKgwqDCoCAweDAwMDAwMDVhPGJy
PgogICAgICAgICAgVFBNX1BUX0xJQlJBUllfQ09NTUFORFM6wqDCoMKgIDB4MDAwMDAwNTk8YnI+
CiAgICAgICAgICBUUE1fUFRfVkVORE9SX0NPTU1BTkRTOsKgwqDCoMKgIDB4MDAwMDAwMDE8YnI+
CiAgICAgICAgICBUUE1fUFRfTlZfQlVGRkVSX01BWDrCoMKgwqDCoMKgwqAgMHgwMDAwMDMwMDxi
cj4KICAgICAgICAgIDxicj4KICAgICAgICAgIEF0IHRoaXMgbW9tZW50IEkgY2FuIHN0b3JlIGFu
ZCB1c2UgMTggUlNBIGtleXPCoCBpbnNpZGUgVFBNIGFzCiAgICAgICAgICBwZXJzaXN0ZW50IGtl
eXMgYW5kIEkgdGhpbmsgSSBjYW4gc3RvcmUgbW9yZS48YnI+CiAgICAgICAgICA8YnI+CiAgICAg
ICAgICAuL3RwbTJfbGlzdHBlcnNpc3RlbnQ8YnI+CiAgICAgICAgICBwZXJzaXN0ZW50LWhhbmRs
ZVswXToweDgxMDEwMDAxIGtleS1hbGc6cnNhIGhhc2gtYWxnOnNoYTI1NgpvYmplY3QtYXR0cjpm
aXhlZHRwbXxmaXhlZHBhcmVudHxzZW5zaXRpdmVkYXRhb3JpZ2lufHVzZXJ3aXRoYXV0aHxyZXN0
cmljdGVkfGRlY3J5cHQ8YnI+CiAgICAgICAgICBwZXJzaXN0ZW50LWhhbmRsZVsxXToweDgxMDEw
MDAyIGtleS1hbGc6cnNhIGhhc2gtYWxnOnNoYTI1NgpvYmplY3QtYXR0cjpmaXhlZHRwbXxmaXhl
ZHBhcmVudHxzZW5zaXRpdmVkYXRhb3JpZ2lufHVzZXJ3aXRoYXV0aHxkZWNyeXB0fHNpZ248YnI+
CiAgICAgICAgICBwZXJzaXN0ZW50LWhhbmRsZVsyXToweDgxMDEwMDAzIGtleS1hbGc6cnNhIGhh
c2gtYWxnOnNoYTI1NgpvYmplY3QtYXR0cjpmaXhlZHRwbXxmaXhlZHBhcmVudHxzZW5zaXRpdmVk
YXRhb3JpZ2lufHVzZXJ3aXRoYXV0aHxyZXN0cmljdGVkfGRlY3J5cHQ8YnI+CiAgICAgICAgICBw
ZXJzaXN0ZW50LWhhbmRsZVszXToweDgxMDEwMDEwIGtleS1hbGc6cnNhIGhhc2gtYWxnOnNoYTI1
NgpvYmplY3QtYXR0cjpmaXhlZHRwbXxmaXhlZHBhcmVudHxzZW5zaXRpdmVkYXRhb3JpZ2lufHVz
ZXJ3aXRoYXV0aHxkZWNyeXB0fHNpZ248YnI+CiAgICAgICAgICBwZXJzaXN0ZW50LWhhbmRsZVs0
XToweDgxMDEwMDExIGtleS1hbGc6cnNhIGhhc2gtYWxnOnNoYTI1NgpvYmplY3QtYXR0cjpmaXhl
ZHRwbXxmaXhlZHBhcmVudHxzZW5zaXRpdmVkYXRhb3JpZ2lufHVzZXJ3aXRoYXV0aHxkZWNyeXB0
fHNpZ248YnI+CiAgICAgICAgICBwZXJzaXN0ZW50LWhhbmRsZVs1XToweDgxMDEwMDEyIGtleS1h
bGc6cnNhIGhhc2gtYWxnOnNoYTI1NgpvYmplY3QtYXR0cjpmaXhlZHRwbXxmaXhlZHBhcmVudHxz
ZW5zaXRpdmVkYXRhb3JpZ2lufHVzZXJ3aXRoYXV0aHxkZWNyeXB0fHNpZ248YnI+CiAgICAgICAg
ICBwZXJzaXN0ZW50LWhhbmRsZVs2XToweDgxMDEwMDEzIGtleS1hbGc6cnNhIGhhc2gtYWxnOnNo
YTI1NgpvYmplY3QtYXR0cjpmaXhlZHRwbXxmaXhlZHBhcmVudHxzZW5zaXRpdmVkYXRhb3JpZ2lu
fHVzZXJ3aXRoYXV0aHxkZWNyeXB0fHNpZ248YnI+CiAgICAgICAgICBwZXJzaXN0ZW50LWhhbmRs
ZVs3XToweDgxMDEwMDE0IGtleS1hbGc6cnNhIGhhc2gtYWxnOnNoYTI1NgpvYmplY3QtYXR0cjpm
aXhlZHRwbXxmaXhlZHBhcmVudHxzZW5zaXRpdmVkYXRhb3JpZ2lufHVzZXJ3aXRoYXV0aHxkZWNy
eXB0fHNpZ248YnI+CiAgICAgICAgICBwZXJzaXN0ZW50LWhhbmRsZVs4XToweDgxMDEwMDE1IGtl
eS1hbGc6cnNhIGhhc2gtYWxnOnNoYTI1NgpvYmplY3QtYXR0cjpmaXhlZHRwbXxmaXhlZHBhcmVu
dHxzZW5zaXRpdmVkYXRhb3JpZ2lufHVzZXJ3aXRoYXV0aHxkZWNyeXB0fHNpZ248YnI+CiAgICAg
ICAgICBwZXJzaXN0ZW50LWhhbmRsZVs5XToweDgxMDEwMDE2IGtleS1hbGc6cnNhIGhhc2gtYWxn
OnNoYTI1NgpvYmplY3QtYXR0cjpmaXhlZHRwbXxmaXhlZHBhcmVudHxzZW5zaXRpdmVkYXRhb3Jp
Z2lufHVzZXJ3aXRoYXV0aHxkZWNyeXB0fHNpZ248YnI+CiAgICAgICAgICBwZXJzaXN0ZW50LWhh
bmRsZVsxMF06MHg4MTAxMDAxNyBrZXktYWxnOnJzYSBoYXNoLWFsZzpzaGEyNTYKb2JqZWN0LWF0
dHI6Zml4ZWR0cG18Zml4ZWRwYXJlbnR8c2Vuc2l0aXZlZGF0YW9yaWdpbnx1c2Vyd2l0aGF1dGh8
ZGVjcnlwdHxzaWduPGJyPgogICAgICAgICAgcGVyc2lzdGVudC1oYW5kbGVbMTFdOjB4ODEwMTAw
MjAga2V5LWFsZzpyc2EgaGFzaC1hbGc6c2hhMjU2Cm9iamVjdC1hdHRyOmZpeGVkdHBtfGZpeGVk
cGFyZW50fHNlbnNpdGl2ZWRhdGFvcmlnaW58dXNlcndpdGhhdXRofGRlY3J5cHR8c2lnbjxicj4K
ICAgICAgICAgIHBlcnNpc3RlbnQtaGFuZGxlWzEyXToweDgxMDEwMDIxIGtleS1hbGc6cnNhIGhh
c2gtYWxnOnNoYTI1NgpvYmplY3QtYXR0cjpmaXhlZHRwbXxmaXhlZHBhcmVudHxzZW5zaXRpdmVk
YXRhb3JpZ2lufHVzZXJ3aXRoYXV0aHxkZWNyeXB0fHNpZ248YnI+CiAgICAgICAgICBwZXJzaXN0
ZW50LWhhbmRsZVsxM106MHg4MTAxMDAyMiBrZXktYWxnOnJzYSBoYXNoLWFsZzpzaGEyNTYKb2Jq
ZWN0LWF0dHI6Zml4ZWR0cG18Zml4ZWRwYXJlbnR8c2Vuc2l0aXZlZGF0YW9yaWdpbnx1c2Vyd2l0
aGF1dGh8ZGVjcnlwdHxzaWduPGJyPgogICAgICAgICAgcGVyc2lzdGVudC1oYW5kbGVbMTRdOjB4
ODEwMTAwMjMga2V5LWFsZzpyc2EgaGFzaC1hbGc6c2hhMjU2Cm9iamVjdC1hdHRyOmZpeGVkdHBt
fGZpeGVkcGFyZW50fHNlbnNpdGl2ZWRhdGFvcmlnaW58dXNlcndpdGhhdXRofGRlY3J5cHR8c2ln
bjxicj4KICAgICAgICAgIHBlcnNpc3RlbnQtaGFuZGxlWzE1XToweDgxMDEwMDMwIGtleS1hbGc6
cnNhIGhhc2gtYWxnOnNoYTI1NgpvYmplY3QtYXR0cjpmaXhlZHRwbXxmaXhlZHBhcmVudHxzZW5z
aXRpdmVkYXRhb3JpZ2lufHVzZXJ3aXRoYXV0aHxyZXN0cmljdGVkfGRlY3J5cHQ8YnI+CiAgICAg
ICAgICBwZXJzaXN0ZW50LWhhbmRsZVsxNl06MHg4MTAxMDAzMSBrZXktYWxnOnJzYSBoYXNoLWFs
ZzpzaGEyNTYKb2JqZWN0LWF0dHI6Zml4ZWR0cG18Zml4ZWRwYXJlbnR8c2Vuc2l0aXZlZGF0YW9y
aWdpbnx1c2Vyd2l0aGF1dGh8cmVzdHJpY3RlZHxkZWNyeXB0PGJyPgogICAgICAgICAgcGVyc2lz
dGVudC1oYW5kbGVbMTddOjB4ODEwMTAwMzIga2V5LWFsZzpyc2EgaGFzaC1hbGc6c2hhMjU2Cm9i
amVjdC1hdHRyOmZpeGVkdHBtfGZpeGVkcGFyZW50fHNlbnNpdGl2ZWRhdGFvcmlnaW58dXNlcndp
dGhhdXRofHJlc3RyaWN0ZWR8ZGVjcnlwdDxicj4KICAgICAgICAgIDxicj4KICAgICAgICAgIEkg
d2FudCB0byBrbm93IHRoZSBsaW1pdHMuIERvY3VtZW50ZWQgbGltaXRzLjxicj4KICAgICAgICAg
IDxicj4KICAgICAgICAgIFRoYW5rcyw8YnI+CiAgICAgICAgICBUb208YnI+CiAgICAgICAgICA8
YnI+CiAgICAgICAgPC9kaXY+CiAgICAgIDwvZGl2PgogICAgICA8YnI+CiAgICAgIDxmaWVsZHNl
dCBjbGFzcz0ibWltZUF0dGFjaG1lbnRIZWFkZXIiPjwvZmllbGRzZXQ+CiAgICAgIDxicj4KICAg
ICAgPHByZSB3cmFwPSIiPl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCnRwbTIgbWFpbGluZyBsaXN0CjxhIGNsYXNzPSJtb3otdHh0LWxpbmstYWJicmV2aWF0
ZWQiIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+
CjxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0dHBzOi8vbGlzdHMuMDEu
b3JnL21haWxtYW4vbGlzdGluZm8vdHBtMiI+aHR0cHM6Ly9saXN0cy4wMS5vcmcvbWFpbG1hbi9s
aXN0aW5mby90cG0yPC9hPgo8L3ByZT4KICAgIDwvYmxvY2txdW90ZT4KICAgIDxicj4KICA8L2Jv
ZHk+CjwvaHRtbD4K

--===============7409644786603546087==--

