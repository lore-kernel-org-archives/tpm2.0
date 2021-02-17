Content-Type: multipart/mixed; boundary="===============4561567106121554501=="
MIME-Version: 1.0
From: narcis2004 at yahoo.com
Subject: [tpm2] policies in conjunctive normal form
Date: Wed, 17 Feb 2021 20:36:16 +0000
Message-ID: <20210217203616.2937.51368@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4561567106121554501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Question: is it possible to structure a policy using tpm2-tools in the foll=
owing form?
  policy =3D (a OR b) AND (c OR d)
  - where a, b, c, d are simple pcr policies.

I tried this, and apparently creating an *AND* of policy *OR* did not work =
as i thought. "and.policy" will contain the hash of the second tpm2_policyo=
r instead of generating a new hash
  tpm2_startauthsession --session session.ctx
  tpm2_policyor --session session.ctx sha256:a.policy,b.policy
  tpm2_policyor --session session.ctx sha256:c.policy,d.policy --policy and=
.policy
  tpm2_flushcontext session.ctx


Plan B would be to structure the policy in the equivalent disjunctive norma=
l form, which works but is less scalable. i.e.:
  policy =3D (a AND c) OR (a AND d) OR (b AND c) OR (b AND d)

Thanks,
Narcis
--===============4561567106121554501==--

