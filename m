Content-Type: multipart/mixed; boundary="===============1234041863929938000=="
MIME-Version: 1.0
From: sedigj at gmail.com
Subject: [tpm2] Re: Failed to initialize tcti context: 0x1
Date: Thu, 26 Mar 2020 22:39:40 +0000
Message-ID: <20200326223940.2692.93288@ml01.vlan13.01.org>
In-Reply-To: CAA3rH8YO-pha4Etyjx9iv7559ZDxOOQYfZwAXM=6fNQiivyp4Q@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1234041863929938000==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Have you got other tpm2_ commands to work?
If you are trying to interact with actual hardware (not emulator) like I wa=
s when I encountered this error I found I had to run commands like:

sudo tpm2_<command> -T device

and then things would work. On Ubuntu 18.04.
--===============1234041863929938000==--

