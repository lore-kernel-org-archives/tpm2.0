Return-Path: <benzwt@gmail.com>
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C04B941FD1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54C7341FD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686842716; x=1689434716;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=o2PhIIgYXUZAlzRiuwYv7trZHbXLHfrCnW2zqE2TIm4=;
 b=BrVirCCppMFytkRVDCROL+oBgIwOsC7dT9Zy6V7Xjwt6B9iOpg9RKBbDJhpIddqBvE
 1bqA9ixpGtOoc5xxNFHQyhZz3Bx0+dhtBie64t9USINCEKHE8tTSN4O8x550bT05DoRX
 B4P4p8jhDrB37pY6MEwtSCkylrUzAayBxc+rqHRLWIj0ZYNFyjC6z4Q/ZVTV5+wR+18h
 H6QYWIy8ntNVoV6AxQqLdHSGqia3cDMdgU5vwtc+wbpVLPLdP23bLXxdQLXz9h8UtVh1
 86z649DhtTfP/JwD8vud7305WarRQ/f5tLIM/TGrI+R30b6xBoZ3fV2z9J4zZUOjR1xy
 R+5g==
MIME-Version: 1.0
From: benzwt benzwt <benzwt@gmail.com>
Date: Thu, 15 Jun 2023 23:25:04 +0800
Message-ID: <CAKzn3wwOu60Ndn8K_JxwL4eH5vwTPwyyQJB5b_Sp6r92hhKffg@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e0b6e505fe2cac3c"
Subject: [Tpm2] is it possible to create a child public that can be use to
 encrypt data externally ?
List-Id: The tpm2 userspace mailing list <tpm2.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/tpm2/>
List-Post: <mailto:tpm2@lists.linuxfoundation.org>
List-Help: <mailto:tpm2-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/tpm2>,
 <mailto:tpm2-request@lists.linuxfoundation.org?subject=subscribe>
To: tpm2@lists.linuxfoundation.org

--000000000000e0b6e505fe2cac3c
Content-Type: text/plain; charset="UTF-8"

Hi Folks,

I am new to tpm2.
I would to create a child key from a primary key.
I need to encrypt my data with the child public key externally.
After that, this encrypted data will be sent to the TPM for decryption.
Provided that, the TPM with only perform the decryption if the encrypted
data was encrypted by a public key cat be linked back to primary key; in
other words, the TPM will not perform decryption if the public key does not
come from itself.
It is possible to do that ? Are there any work around ?

BTW,  I tried to miss-use the endorsement key, makecrendential and
active-crential to do the job I have mentioned above. But I failed, because
the size of encrypted blob must be less than or equal to 64 bytes which is
why too small for my data.

Best regards,
benzwt

--000000000000e0b6e505fe2cac3c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Folks,</div><div><br></div><div>I am new to tpm2.<=
/div><div>I would to create a child key from a primary key.<br></div><div>I=
 need to encrypt my data with the child public key externally.</div><div>Af=
ter that, this encrypted data will be sent to the TPM for decryption.</div>=
<div>Provided that, the TPM with only perform the decryption if the encrypt=
ed data was encrypted by a public key cat be linked back to primary key; in=
 other words, the TPM will not perform decryption if the public key does no=
t come from itself.</div><div>It is possible to do that ? Are there any wor=
k around ?<br></div><div><br></div><div>BTW,=C2=A0 I tried to miss-use the =
endorsement key, makecrendential and active-crential to do the job I have m=
entioned above. But I failed, because the size of encrypted blob must be le=
ss than or equal to 64 bytes which is why too small for my data.<br></div><=
div><br></div><div>Best regards,</div><div>benzwt<br></div></div>

--000000000000e0b6e505fe2cac3c--
