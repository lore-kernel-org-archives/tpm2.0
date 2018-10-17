Content-Type: multipart/mixed; boundary="===============1486706373916711621=="
MIME-Version: 1.0
From: Philip Tricca <philip.b.tricca at intel.com>
Subject: Re: [tpm2] TPM questions
Date: Wed, 17 Oct 2018 10:26:47 -0700
Message-ID: <20181017172647.e2qtikozurmlftgh@jake>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D0147344314@exch2010c.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1486706373916711621==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

With regard to the UEFI TCTI this may be useful:
https://github.com/flihp/tpm2-uefi

Also see the last slide from our LSS talk:
https://events.linuxfoundation.org/wp-content/uploads/2017/11/Getting-Start=
ed-with-the-TPM2-Software-Stack-TSS2-Philip-Tricca-Intel-1.pdf

Finding a way to work this back into the tpm2-software GH org is in my
work queue. Feedback would be appreciated.

Philip

On Thu, Oct 11, 2018 at 07:56:11AM +0000, Fuchs, Andreas wrote:
> Some quick answers to parts of your questions:
> =

> a) you don't require the simulator. It's just for development
> c) export TSS2_LOG=3Dtcti+debug
> d) use cgdb to step through the code: libtool --mode=3Dexecute cgdb --arg=
s tpm2_xxx ... or something like this
> e) you can use libtss2-sys.a directly. Thing you need is to implement a n=
ew tcti that corresponds to your environment.
> =

> Cheers,
> Andreas
> =

> ________________________________
> From: tpm2 [tpm2-bounces(a)lists.01.org] on behalf of Alok Pant [alokpant=
(a)hotmail.com]
> Sent: Wednesday, October 10, 2018 21:39
> To: tpm2(a)lists.01.org; Alok Pant
> Subject: [tpm2] TPM questions
> =

> =

> Hi TPM Experts,
> =

>   I come from computer firmware (UEF aka BIOSI) background and have basis=
 understanding of TPM. My goal is to implement the advance TPM capabilities=
 (ex-policy based operation) in PreOS space in firmware/BIOS. With various =
reverse engineering method I now have  basic understanding of Auth/Handle a=
nd basic commands such as seal/unseal etc. I am still lost while reading  v=
arious spec/books and was searching for reference code and sandbox area to =
better understand the spec/implementation. I came across this wiki - https:=
//github.com/tpm2-software/tpm2-tools/blob/master/INSTALL.md and tried to p=
lay with tpm2-tss and tpm2-tools under Ubuntu. This seems helpful but still=
 lot to digest for new-bee like meI need some help as below
> =

> =

> =

> a) I can compile tpm2_tss and tpm2_tools but I get build errors on TPM si=
mulator similar to reported here (https://sourceforge.net/p/ibmswtpm2/discu=
ssion/general/thread/8a4aac81/?limit=3D25) I tried various OpenSSL revision=
 and no luck. Do I need TPM simulator to work and if so how do I fix it
> =

> =

> b) I can now run various tpm_tools as root (i.e. sudo tpm2_getrandom, sud=
o get_capabilities -c algorithms) etc so at least I have a good baseline fo=
r tpmtools
> =

> c) I am interested to print the low level packet that is sent to TPM (req=
uest/response buffer). How can I do this? Is there verbose/build time optio=
ns to print the actual request/response packet send to/from TPM
> =

> d) Is there a way to debug (i.e. step through the code) so I can follow t=
he code path and look various variable to better understand the code flow
> =

> e) What afford is needed to port this stack in UEFI EDKII and where shoul=
d I look to start some investigation
> =

> =

> It seems there are subset of people (you) who understand it very well but=
 there are insufficient books/document for new-comers(me)  to get up to spe=
ed.  I apologize if this is too basic/broad question . Any help/pointers wi=
ll be greatly appreciated
> =

> =

> Thanks again for offering help
> =

> -Alok
> =

> =


> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2


--===============1486706373916711621==--

