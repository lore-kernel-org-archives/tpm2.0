Content-Type: multipart/mixed; boundary="===============8968148668527698594=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] Docker Images
Date: Fri, 30 Aug 2019 15:27:26 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649DEFE50@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CANKkrzGZeWWV=NkjSKwppzSJEnCmKt3RYd8iytLg02A8VW1yyA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8968148668527698594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Matthew Dempsky [mailto:matthew(a)dempsky.org]
> Sent: Thursday, August 29, 2019 12:39 PM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: tpm2(a)lists.01.org
> Subject: Re: [tpm2] Docker Images
> =

> On Thu, Aug 29, 2019 at 9:40 AM Roberts, William C <william.c.roberts(a)i=
ntel.com
> <mailto:william.c.roberts(a)intel.com> > wrote:
> =

> =

> 	But Dockerhub knows how to map branch/tag name to a docker image
> name.
> =

> =

> =

> Understood, but I believe this functionality is customizable. For example=
, see this
> Stack Overflow response:

Oh I see what you mean, I didn't even notice that it had the "Dockerfile lo=
cation"

The only thing that still sucks, is I can't seem to find the "# include" di=
rective to
Avoid repeating text blocks.

> =

> =

> 	https://stackoverflow.com/a/44796846
> 	https://i.stack.imgur.com/9GpzT.png
> =

> =

> What I understand is you're trying to use the Docker Hub's built-in Git B=
ranch =3D>
> Docker Tag mapping functionality.
> =

> I'm suggesting to instead configure multiple builds manually; e.g.,
> =

>     - Type "Branch", Name "master", Dockerfile Location "/ubuntu", Docker=
 Tag
> Name "ubuntu"
>     - Type "Branch", Name "master", Dockerfile Location "/fedora", Docker=
 Tag
> Name "fedora"
>     Etc.
> =

> Admittedly, this has the downside that to add/remove OSes, you'll need to
> update the Docker Hub configuration. But this is easily documented.
> =

> =

> 	And do to constraints I cannot control, I need to use dockerhub to build
> the images...
> =

> =

> =

> To clarify, I'm suggesting an alternative way to configure Docker Hub. I'=
m not
> suggesting to stop using Docker Hub.
> =

> =

> 	The other thing is that each distro is likely going to differences to the
> docker file anyways. Setup on
> 	Ubuntu will likely not be the same as fedora. Right now the updates are
> infrequent enough where
> 	It shouldn't really be that much of a burden, hopefully.
> =

> =

> I'm sure you have a better sense of the effort involved than I do, and yo=
u're
> going to be the one responsible for that work.
> =

> =

> I'm just cautioning that from personal experience with projects I've work=
ed on
> (e.g., Android, Chrome, Chrome OS), the "apply N patches to N repos/branc=
hes"
> model is workable but very tedious, error prone, and generally dispiritin=
g.

--===============8968148668527698594==--

