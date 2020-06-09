Content-Type: multipart/mixed; boundary="===============8675001979979779389=="
MIME-Version: 1.0
From: nicolasoliver03 at gmail.com
Subject: [tpm2] Re: IMA determinism
Date: Tue, 09 Jun 2020 20:02:44 +0000
Message-ID: <20200609200244.2851.404@ml01.vlan13.01.org>
In-Reply-To: 20200609193608.2851.57936@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8675001979979779389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Sure. I agree with you.
> =

> =

> My main goal is to attest the state of a VM. I was thinking in booting a =
fresh installed
> Ubuntu, and add some application to run after boot. I am trying to prove =
this application
> runs in an incorrupt VM.
> =

> At first, I would get the digest of PCR10, and would consider this hash a=
s the unique
> acceptable hash for considering my VM healthy. I would use this value for=
 remote
> attestation purposes. But, as you mentioned, the indeterminism of program=
s' execution
> order makes this strategy unfeasible.
> =

> I'm considering only PCR10 because I know that PCRs 0-7 are hashed to a b=
oot agregate,
> which is the first line of the measurements file. Thus, somehow, PCRs 0-7=
 are directly
> bound to PCR10.

I would add here that It is still important to quote and verify the PCR 0-7=
 first directly from the TPM.
Otherwise, how do you know that the boot_aggregate in the IMA Measurement L=
og is trustworthy?

I think the process should be (more or less, simplified):

1. Create Endorsement and Attestation Keys created in the TPM, and enrolled=
 in the attestation server
2. Do a Remote Attestation to the PCR 0 to 10 using those keys, using a non=
ce for data qualification. The nonce is generated in the server, encrypted =
with TPM_MakeCredential using EK and AK of the target client. Client uses T=
PM_ActivateCredential for getting the nonce, and use that nonce to generate=
 the quote
3. Send the IMA Measurement Log with the PCR Quote to the server
4. In the server, validate the Quote Signature and qualification data. =

5. If 4) is correct, validate the TPM PCR 0 to 9 values (8 and 9 may be not=
 populated in Ubuntu) with the "Golden Image Digests"
6. Reconstruct the expected boot aggregate using the TPM PCR 0 to 7, and co=
mpare that with the boot_aggregate reported on the IMA Measurement Log.
7. If 6) is correct, calculate the aggregated PCR 10 digest using the IMA M=
easurement Logs. Compare that to the quoted PCR 10 value.
8. If 7) is correct, validate the entries of the IMA Measurement Log with t=
he "Golden Image Digests"
9. If all this is correct, maybe your VM is not corrupted :)

Some comments I can give you based on this list:

a. for 3), the IMA Measurement Log have all the software running in the VM,=
 privacy should be taken into account, encryption could be the answer. If t=
he VM is yours, maybe you can ignore that
b. for 3), you need to assure that the IMA Measurement Log is not modified =
on transit. Signature could be the answer here?
c. Creating and maintaining the Golden Image Digests is tricky. =

d. for 7) the final digest could not match. This is because of the asynchro=
nous nature of the OS as well. A simple explanation is: you take the TPM Qu=
ote a time t1,  save the copy of the IMA Measurement Log at time t2. If som=
e asynchronous process caused an IMA Measure between t1 and t2, you would g=
et an additional measurement in the log that is not extended in the already=
 created quote. Something worst can happens if you take the snapshot of the=
 log and then do the quote (it will be impossible to reconstruct the PCR 10=
 value with that log). The "solution" is to check if the resulting aggregat=
ed digest from the log matches the quote, and if that fails, check if the q=
uote PCR 10 value is present in some of the last files in the log. =


Hope this table helps:

PCR 10 VALUE: 5

FILE                     DIGEST    AGGREGATED DIGEST
boot_aggregate   0                0
A                         1                 1
B                         2                 2
C                         3                 5 <- Quoted Value
D                         4                 6
E                         5                 7

Files D and E were measured after the Quote was taken. The aggregated diges=
t will not match the quote
But C, which is more or less at the end of the log, matches the aggregated =
digest, so the quote is good, and D + E will be tpm quoted in the next atte=
station

> =

> As you said, reducing the IMA Measurement policy to measure less files re=
duces the
> security surface. I won't follow this path.
> =

> So, I think your idea would be sending the IMA Measurement Log along with=
 the quote. If
> the quote is can be verified and matches with IMA digest, then, the secon=
d step would be
> to check the hashes of each file separately. If all files have the expect=
ed hash, then I
> have a healthy state...
> =

> Did I get it right?
> =

> Thanks, Nicolas, for your comments.

Did you already looked at Keylime? :)
--===============8675001979979779389==--

