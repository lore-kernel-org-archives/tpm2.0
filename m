Content-Type: multipart/mixed; boundary="===============4386090232933842508=="
MIME-Version: 1.0
From: Philip Tricca <flihp at twobit.org>
Subject: Re: [tpm2] [tpm2-abrmd] Resource manager reconnect.
Date: Sun, 10 Feb 2019 20:27:02 -0800
Message-ID: <7df248df-986f-ec9a-0c54-5dcb6847b1f7@twobit.org>
In-Reply-To: CAKrSGQS3JLDvhMjnVO_-aMEkH4JQM4LWc=u4+G9wK9OtE2j-mw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4386090232933842508==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Luke,

On 2/8/19 1:36 AM, Luke Hinds wrote:
> Not sure if this is an known issue, so thought I would float it here
> first before opening a github issue.
> =

> I observed the following when using tpm2-abrmd and the mssim (ibmtpm1119):
> =

> Preconditions:
> =

> running tpm_server
> active tpm-abrmd service
> =

> If you now kill / restat the tpm_server, the tpm-abrmd service fails,
> unless its also restarted.

https://github.com/tpm2-software/tpm2-abrmd/issues/385

We've had a general "make error handling better" issue opened for a while.

>  Let me demonstrate:
> [root(a)3896227cc7ee=C2=A0~]# tpm_server &
> [root(a)3896227cc7ee ~]# systemctl start tpm2-abrmd
> [root(a)3896227cc7ee ~]# tpm2_pcrlist=C2=A0
> sha1:
> =C2=A0 0 : 0x0000000000000000000000000000000000000003
> =C2=A0 1 : 0x0000000000000000000000000000000000000000
> <snip>
> =

> All good, lets kill and start the tpm_server again, while leaving the
> tpm2-abrmd service running:
> =

> [root(a)3896227cc7ee ~]# pkill tpm_server
> [root(a)3896227cc7ee ~]# tpm_server &
> [root(a)3896227cc7ee ~]# tpm2_pcrlist=C2=A0
> ERROR: Tss2_Sys_GetCapability(0xA000A) - tcti:IO failure
> ERROR: Unable to run tpm2_pcrlist
> =

> So let's restart the service as well:
> =

> [root(a)3896227cc7ee ~]# systemctl restart tpm2-abrmd
> [root(a)3896227cc7ee ~]# tpm2_pcrlist=C2=A0
> sha1:
> =C2=A0 0 : 0x0000000000000000000000000000000000000003
> =C2=A0 1 : 0x0000000000000000000000000000000000000000
> =

> I guess this may be a limitation / known issue when tpm2-abrmd is used
> with a swtpm. If so, nothing to see here. If not, let me know and I am
> happy to raise a GH issue.

Feel free to comment on the existing issue. What we can do in cases like
this w/r/t recovery are pretty limited but maybe we can come up with
something better.

Philip

--===============4386090232933842508==--

