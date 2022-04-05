Content-Type: multipart/mixed; boundary="===============7332604265585815005=="
MIME-Version: 1.0
From: Tadeusz Struk <tstruk at gmail.com>
Subject: [tpm2] Re: Installing on FreeBSD?
Date: Tue, 05 Apr 2022 11:20:31 -0700
Message-ID: <3454f652-d765-eeea-335b-97a875da6c6a@gmail.com>
In-Reply-To: 8f99596f-56bd-c34f-d9b2-ce0782c9f11b@skylon.me.uk
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7332604265585815005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 4/5/22 10:03, John Connett wrote:
> It's=C2=A0ths=C2=A0one!=C2=A0I=C2=A0added=C2=A0a=C2=A0printf=C2=A0to=C2=
=A0output=C2=A0the=C2=A0value=C2=A0of=C2=A0"timeout"=C2=A0at:
> https://github.com/freebsd/freebsd-src/blob/main/sys/dev/tpm/tpm_crb.c#L2=
59
> =

> It counts down until timeout <=3D 0 (in steps of 10000) then ENXIO is ret=
urned.
> =

> I've=C2=A0had=C2=A0a=C2=A0quick=C2=A0look=C2=A0at:
> https://trustedcomputinggroup.org/wp-content/uploads/Mobile-Command-Respo=
nse-Buffer-Interface-v2-r12-Specification_FINAL2.pdf =

> =

> =

> If polling isn't working perhaps interrupt control or some other form of =

> notification=C2=A0is=C2=A0required?

I don't think CRB interface requires irq, in my case no interrupt is regist=
ered:
$ vmstat -i
interrupt                          total       rate
irq1: atkbd0                           2          0
cpu0:timer                         17233         28
cpu1:timer                         11371         19
irq25: virtio_pci0                 13987         23
irq26: virtio_pci0                     1          0
irq27: hdac0                          58          0
irq29: virtio_pci2                  5550          9
irq31: virtio_pci1                     1          0
Total                              48203         79


> =

> Is there anything I could dig out of the control structures that would =

> help=C2=A0identify=C2=A0the=C2=A0problem?

Not sure, must be something specific to the windows hyper-V TPM.
I'm running freeBSD13.0 on top of Linux KVM and crb-tpm2.0 and it's working=
 fine.
You may want to compare the ACPI tables to see what's missing. Here what I =
have:

$ sudo acpidump -dt > dump.txt
$ cat dump.txt
....
/*
   TPM2: Length=3D76, Revision=3D4, Checksum=3D138,
	OEMID=3DBOCHS, OEM Table ID=3DBXPC, OEM Revision=3D0x1,
	Creator ID=3DBXPC, Creator Revision=3D0x1
		ControlArea=3Dfed40040
		StartMethod=3D7
  */
.....
/*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20201113 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
  * Disassembly of /tmp/acpidump.gpqkvY/acpdump.din, Tue Apr  5 11:02:38 20=
22
  *
  * Original Table Header:
  *     Signature        "DSDT"
  *     Length           0x0000190A (6410)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
  *     Checksum         0xBC
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
{
     ...
     Scope (\_SB)
     {
     ...
         Device (TPM)
         {
             Name (_HID, "MSFT0101" /* TPM 2.0 Security Device */)  // _HID=
: =

Hardware ID
             Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Set=
tings
             {
                 Memory32Fixed (ReadWrite,
                     0xFED40000,         // Address Base
                     0x00001000,         // Address Length
                     )
             })
             Name (_STA, 0x0F)  // _STA: Status
             OperationRegion (TPP2, SystemMemory, 0xFED45100, 0x5A)
             Field (TPP2, AnyAcc, NoLock, Preserve)
             {
                 PPIN,   8,
                 PPIP,   32,
                 PPRP,   32,
                 PPRQ,   32,
                 PPRM,   32,
                 LPPR,   32
             }

             OperationRegion (TPP3, SystemMemory, 0xFED4515A, One)
             Field (TPP3, ByteAcc, NoLock, Preserve)
             {
                 MOVV,   8
             }

             Method (TPFN, 1, Serialized)
             {
                 If ((Arg0 >=3D 0x0100))
                 {
                     Return (Zero)
                 }

                 OperationRegion (TPP1, SystemMemory, (0xFED45000 + Arg0), =
One)
                 Field (TPP1, ByteAcc, NoLock, Preserve)
                 {
                     TPPF,   8
                 }

                 Return (TPPF) /* \_SB_.TPM_.TPFN.TPPF */
             }

             Name (TPM2, Package (0x02)
             {
                 Zero,
                 Zero
             })
             Name (TPM3, Package (0x03)
             {
                 Zero,
                 Zero,
                 Zero
             })
             Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
             {
                 If ((Arg0 =3D=3D ToUUID ("3dddfaa6-361b-4eb4-a424-8d10089d=
1653") /* =

Physical Presence Interface */))
                 {
                     If ((Arg2 =3D=3D Zero))
                     {
                         Return (Buffer (0x02)
                         {
                              0xFF, 0x01                                   =
    // ..
                         })
                     }

                     If ((Arg2 =3D=3D One))
                     {
                         Return ("1.3")
                     }

                     If ((Arg2 =3D=3D 0x02))
                     {
                         Local0 =3D DerefOf (Arg3 [Zero])
                         Local1 =3D TPFN (Local0)
                         If (((Local1 & 0x07) =3D=3D Zero))
                         {
                             Return (One)
                         }

                         PPRQ =3D Local0
                         PPRM =3D Zero
                         Return (Zero)
                     }

                     If ((Arg2 =3D=3D 0x03))
                     {
                         If ((Arg1 =3D=3D One))
                         {
                             TPM2 [One] =3D PPRQ /* \_SB_.TPM_.PPRQ */
                             Return (TPM2) /* \_SB_.TPM_.TPM2 */
                         }

                         If ((Arg1 =3D=3D 0x02))
                         {
                             TPM3 [One] =3D PPRQ /* \_SB_.TPM_.PPRQ */
                             TPM3 [0x02] =3D PPRM /* \_SB_.TPM_.PPRM */
                             Return (TPM3) /* \_SB_.TPM_.TPM3 */
                         }
                     }

                     If ((Arg2 =3D=3D 0x04))
                     {
                         Return (0x02)
                     }

                     If ((Arg2 =3D=3D 0x05))
                     {
                         TPM3 [One] =3D LPPR /* \_SB_.TPM_.LPPR */
                         TPM3 [0x02] =3D PPRP /* \_SB_.TPM_.PPRP */
                         Return (TPM3) /* \_SB_.TPM_.TPM3 */
                     }

                     If ((Arg2 =3D=3D 0x06))
                     {
                         Return (0x03)
                     }

                     If ((Arg2 =3D=3D 0x07))
                     {
                         Local0 =3D DerefOf (Arg3 [Zero])
                         Local1 =3D TPFN (Local0)
                         If (((Local1 & 0x07) =3D=3D Zero))
                         {
                             Return (One)
                         }

                         If (((Local1 & 0x07) =3D=3D 0x02))
                         {
                             Return (0x03)
                         }

                         If ((Arg1 =3D=3D One))
                         {
                             PPRQ =3D Local0
                             PPRM =3D Zero
                         }

                         If ((Arg1 =3D=3D 0x02))
                         {
                             PPRQ =3D Local0
                             PPRM =3D DerefOf (Arg3 [One])
                         }

                         Return (Zero)
                     }

                     If ((Arg2 =3D=3D 0x08))
                     {
                         Local0 =3D DerefOf (Arg3 [Zero])
                         Local1 =3D TPFN (Local0)
                         Return ((Local1 & 0x07))
                     }

                     Return (Buffer (One)
                     {
                          0x00                                             =
// .
                     })
                 }

                 If ((Arg0 =3D=3D ToUUID ("376054ed-cc13-4675-901c-4756d7f2=
d45d") /* =

Unknown UUID */))
                 {
                     If ((Arg2 =3D=3D Zero))
                     {
                         Return (Buffer (One)
                         {
                              0x03                                         =
    // .
                         })
                     }

                     If ((Arg2 =3D=3D One))
                     {
                         Local0 =3D DerefOf (Arg3 [Zero])
                         MOVV =3D Local0
                         Return (Zero)
                     }
                 }
             }
         }
     }
}



--===============7332604265585815005==--

