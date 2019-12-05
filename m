Content-Type: multipart/mixed; boundary="===============2401331272656190283=="
MIME-Version: 1.0
From: Frederick Gotham <cauldwell.thomas at gmail.com>
Subject: [tpm2] Fwd: How Is This Possible If There Are No Keys ? ? ?
Date: Thu, 05 Dec 2019 12:50:08 +0000
Message-ID: <CALtZhhNnL_MsU+OV_s7r4-kmRVRKDA3bvp1stJXxh5v=Z+X6fw@mail.gmail.com>
In-Reply-To: CALtZhhOg37eG_Dt3v4HF5083PjB2K9HHfOwpVV35r9Wy3Sw_Nw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2401331272656190283==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

---------- Forwarded message ----------
From: Frederick Gotham <cauldwell.thomas(a)gmail.com>
Date: Thu, 5 Dec 2019 12:48:46 +0000
Subject: Re: [tpm2] How Is This Possible If There Are No Keys ? ? ?
To: "Fuchs, Andreas" <andreas.fuchs(a)sit.fraunhofer.de>

On 12/5/19, Fuchs, Andreas <andreas.fuchs(a)sit.fraunhofer.de> wrote:

> Using tpm2_evictcontrol


In order to use tpm2_evictcontrol, one needs a handle to an object.

I am unable to get a handle to the object I loaded in, because
"tpm2_getcap" returns nothing when I give it any of [transient,
persistent, loaded_session, saved_session].
--===============2401331272656190283==--

