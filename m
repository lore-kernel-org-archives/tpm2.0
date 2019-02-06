Content-Type: multipart/mixed; boundary="===============3425744138047886414=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] tpm2-abrmd in a container
Date: Wed, 06 Feb 2019 01:43:25 +0100
Message-ID: <82fd3a60-780f-ceaf-8ced-cd2b01f55b9e@redhat.com>
In-Reply-To: CAKrSGQQuBEhFxNXvX_bEOzaG6YOKXVRQSLE5Nxvouqrf4vCZNQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3425744138047886414==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Luke,

On 2/5/19 4:40 PM, Luke Hinds wrote:

[snip]

> Almost have this working now or perhaps getting warmer. I am now looking
> for some advice on what values and arguments I should be using to make su=
re
> connectivity goes from tpm2-tools > tpm2-abrmd > tpm2 mssim
> =

> Within my container I run:
> =

> mkdir -p /var/run/dbus/
> dbus-daemon --fork --system
> =

> start the simulator:
> =

> tpm_server &
> [1] 24
> [root(a)a2d41fb37bb3 src]# TPM command server listening on port 2321
> Platform server listening on port 2322
> =

> If I now run:
> =

> [root(a)a2d41fb37bb3 src]# /usr/local/sbin/tpm2-abrmd --allow-root
> --tcti=3Dmssim &
> =

> I can see an active bus:
> =

> [root(a)a2d41fb37bb3 src]# dbus-send --system --dest=3Dorg.freedesktop.DB=
us
> --type=3Dmethod_call --print-reply /org/freedesktop/DBus
> org.freedesktop.DBus.ListNames
> method return time=3D1549380992.829764 sender=3Dorg.freedesktop.DBus ->
> destination=3D:1.7 serial=3D3 reply_serial=3D2
>    array [
>       string "org.freedesktop.DBus"
>       string ":1.7"
>       string "com.intel.tss2.Tabrmd"
>       string ":1.6"
>    ]
> =

> =

> [root(a)a2d41fb37bb3 src]# dbus-send --system --dest=3Dcom.intel.tss2.Tab=
rmd
> --type=3Dmethod_call --print-reply /com/intel/tss2/Tabrmd/Tcti
> org.freedesktop.DBus.Introspectable.Introspect
> method return time=3D1549381010.989948 sender=3D:1.6 -> destination=3D:1.8
> serial=3D7 reply_serial=3D2
>    string "<!DOCTYPE node PUBLIC "-//freedesktop//DTD D-BUS Object
> Introspection 1.0//EN"
>                       "
> http://www.freedesktop.org/standards/dbus/1.0/introspect.dtd">
> <!-- GDBus 2.58.3 -->
> <node>
>   <interface name=3D"org.freedesktop.DBus.Properties">
>     <method name=3D"Get">
>       <arg type=3D"s" name=3D"interface_name" direction=3D"in"/>
>       <arg type=3D"s" name=3D"property_name" direction=3D"in"/>
>       <arg type=3D"v" name=3D"value" direction=3D"out"/>
>     </method>
>     <method name=3D"GetAll">
>       <arg type=3D"s" name=3D"interface_name" direction=3D"in"/>
>       <arg type=3D"a{sv}" name=3D"properties" direction=3D"out"/>
>     </method>
>     <method name=3D"Set">
>       <arg type=3D"s" name=3D"interface_name" direction=3D"in"/>
>       <arg type=3D"s" name=3D"property_name" direction=3D"in"/>
>       <arg type=3D"v" name=3D"value" direction=3D"in"/>
>     </method>
>     <signal name=3D"PropertiesChanged">
>       <arg type=3D"s" name=3D"interface_name"/>
>       <arg type=3D"a{sv}" name=3D"changed_properties"/>
>       <arg type=3D"as" name=3D"invalidated_properties"/>
>     </signal>
>   </interface>
>   <interface name=3D"org.freedesktop.DBus.Introspectable">
>     <method name=3D"Introspect">
>       <arg type=3D"s" name=3D"xml_data" direction=3D"out"/>
>     </method>
>   </interface>
>   <interface name=3D"org.freedesktop.DBus.Peer">
>     <method name=3D"Ping"/>
>     <method name=3D"GetMachineId">
>       <arg type=3D"s" name=3D"machine_uuid" direction=3D"out"/>
>     </method>
>   </interface>
>   <interface name=3D"com.intel.tss2.TctiTabrmd">
>     <method name=3D"CreateConnection">
>       <arg type=3D"ah" name=3D"fds" direction=3D"out"/>
>       <arg type=3D"t" name=3D"id" direction=3D"out"/>
>     </method>
>     <method name=3D"Cancel">
>       <arg type=3D"t" name=3D"id" direction=3D"in"/>
>       <arg type=3D"u" name=3D"return_code" direction=3D"out"/>
>     </method>
>     <method name=3D"SetLocality">
>       <arg type=3D"t" name=3D"id" direction=3D"in"/>
>       <arg type=3D"y" name=3D"locality" direction=3D"in"/>
>       <arg type=3D"u" name=3D"return_code" direction=3D"out"/>
>     </method>
>   </interface>
> </node>
>

I believe the tpm2-abmrd + MSFT simulator part is correct.
 =

> The part I am now not sure of, is how to configure TPM2TOOLS_TCTI and what
> args should be used for the RM.
> =

> As it is, its expected with TPM2TOOLS_TCTI undeclared  :
> =

> [root(a)a2d41fb37bb3 src]# tpm2_pcrlist
> ERROR:tcti:src/tss2-tcti/tcti-device.c:399:Tss2_Tcti_Device_Init() Failed
> to open device file /dev/tpm0: No such file or directory
> ERROR: tcti init allocation routine failed for library: "device" options:
> "(null)"
> ERROR: Could not load tcti, got: "device"
> =

> I have then tried different variations:
> =

> export TPM2TOOLS_TCTI=3D"mssim:host=3Dlocalhost,port=3D2321"
> export TPM2TOOLS_TCTI=3D"mssim:port=3D2321"
> export TPM2TOOLS_TCTI=3D"mssim:tcp://127.0.0.1:2321"
>
> I am guessing this would be wrong though? I don't want the tools connecti=
ng
> to the mssim, I want them connecting to the resource manager.
>

That's correct. You have to use the abrmd TCTI since the tools don't care t=
hat
the abrmd is talking to the simulator instead of a TPM device.

> I should also mention, none of the above work - running `tpm2_pcrlist` ju=
st
> results in the command hanging and needing a ctrl c to break out.
> =

> [root(a)a2d41fb37bb3 src]# export
> TPM2TOOLS_TCTI=3D"tabrmd:bus_name=3Dcom.intel.tss2.Tabrmd,tabrmd:bus_type=
=3Dsession"
> [root(a)a2d41fb37bb3 src]# tpm2_pcrlist
> ERROR: Could not dlopen library: "tabrmd"
> ERROR: Could not load tcti, got: "tabrmd"
> =

> So I then tried try this:
> =

> [root(a)a2d41fb37bb3 src]# /usr/local/sbin/tpm2-abrmd --allow-root
> --tcti=3Dlibtss2-tcti-mssim.so &
> [root(a)a2d41fb37bb3 src]# export TPM2TOOLS_TCTI=3D"mssim:port=3D2321"
> [root(a)a2d41fb37bb3 src]# tpm2_pcrlist
> =

> Unfortunately the command just hangs, needing a ctrl-c to break the sessi=
on.
> =

> I am aware I may be "making a pigs ear" of this, if so excuse my
> green'ness.
> =

> If anyone can point me towards what args I should be using for the
> connectivity flow I outlined towards the start of this email, that would =
be
> great!
>

What's your exact version of the tpm2-abrmd, tpm2-tss and tpm2-tools? Can y=
ou
do "export TSS2_LOG=3Dall+TRACE" before executing tpm2_pcrlist to see where=
 the
libraries are hanging?

> Thanks,
> =

> Luke
> =


Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============3425744138047886414==--

