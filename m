Content-Type: multipart/mixed; boundary="===============4547252930062335712=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Re: Persisted primary key not usable, tpm2-tools 4.0.0
Date: Fri, 18 Oct 2019 15:43:11 -0700
Message-ID: <CAOCvsSkPHJkMNLm+_9DPqKo-Bwu14As9CH=4sdrd3moch6YoZA@mail.gmail.com>
In-Reply-To: ab0095c1-bf1b-61c0-0601-d531d8d1fe5f@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4547252930062335712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I checked the handles and it showed up as persistent and not as transient.
Then I deactivated the TABRMD and attempted access through the device TCTI
and it worked.  I won't be able to do much more for until the end of the
month but it looks like the problem is in the resource manager.

--===============4547252930062335712==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9ImF1dG8iPkkgY2hlY2tlZCB0aGUgaGFuZGxlcyBhbmQgaXQgc2hvd2VkIHVwIGFz
IHBlcnNpc3RlbnQgYW5kIG5vdCBhcyB0cmFuc2llbnQuwqAgVGhlbiBJIGRlYWN0aXZhdGVkIHRo
ZSBUQUJSTUQgYW5kIGF0dGVtcHRlZCBhY2Nlc3MgdGhyb3VnaCB0aGUgZGV2aWNlIFRDVEkgYW5k
IGl0IHdvcmtlZC7CoCBJIHdvbiYjMzk7dCBiZSBhYmxlIHRvIGRvIG11Y2ggbW9yZSBmb3IgdW50
aWwgdGhlIGVuZCBvZiB0aGUgbW9udGggYnV0IGl0IGxvb2tzIGxpa2UgdGhlIHByb2JsZW0gaXMg
aW4gdGhlIHJlc291cmNlIG1hbmFnZXIuPC9kaXY+Cg==

--===============4547252930062335712==--

