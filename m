Content-Type: multipart/mixed; boundary="===============8534512625108613524=="
MIME-Version: 1.0
From: Luke Hinds <lhinds at redhat.com>
Subject: Re: [tpm2] tpm2-abrmd in a container
Date: Tue, 05 Feb 2019 15:40:23 +0000
Message-ID: <CAKrSGQQuBEhFxNXvX_bEOzaG6YOKXVRQSLE5Nxvouqrf4vCZNQ@mail.gmail.com>
In-Reply-To: CAKrSGQQB1+L9EUSYkV2oHa8q_U8AjsmWF4=2=-1nd0wL-K8MxQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8534512625108613524==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 4, 2019 at 6:55 PM Luke Hinds <lhinds(a)redhat.com> wrote:

>
>
> On Mon, Feb 4, 2019 at 6:05 PM Andersen, John <john.s.andersen(a)intel.co=
m>
> wrote:
>
>> On Mon, Feb 04, 2019 at 04:57:12PM +0000, Luke Hinds wrote:
>> >    On Mon, Feb 4, 2019 at 4:12 PM Roberts, William C
>> >    <[1]william.c.roberts(a)intel.com> wrote:
>> >
>> >      I run it in our CI system which is using a docker container, not
>> >      sure if that helps
>> >      But you can look at our scripts for it.
>> >
>> >    Do you mean the following travis-ci file:
>> >    [2]
>> https://github.com/tpm2-software/tpm2-abrmd/blob/master/.travis.yml#
>> >    L2
>> >    I noticed this, but I think its a VM (unless I am mistaken):
>> >    [3]
>> https://docs.travis-ci.com/user/reference/overview/#virtualization-e
>> >    nvironments
>> >    Any pointers to files that reference your container use, would be
>> >    helpful.
>> >    Cheers,
>> >    Luke
>> >
>> >      > -----Original Message-----
>> >      > From: tpm2 [mailto:[4]tpm2-bounces(a)lists.01.org] On Behalf Of
>> Luke
>> >      Hinds
>> >      > Sent: Monday, February 4, 2019 7:47 AM
>> >      > To: [5]tpm2(a)lists.01.org
>> >      > Subject: [tpm2] tpm2-abrmd in a container
>> >      >
>> >      > Hello,
>> >      >
>> >      > I have been working on trying to get tpm2-abrmd running in a
>> >      container, but its
>> >      > proving problematic as there is a requirement on system-d and
>> >      dbus. This in turn
>> >      > requires running the container as privileged and mounting the
>> >      hosts cgroup (and
>> >      > adding cap sys-admin).
>> >      >
>> >      > My reason for using a container, is for CI / functional testing
>> of
>> >      a project that will
>> >      > use abrmd and having a lightweight means to test against the
>> >      resource manager
>> >      > running in a container.
>> >      >
>> >      > I am still early in looking at ways to achieve this, so I wanted
>> >      to ask if any others
>> >      > have snippets of previous attempts (successful or not) they cou=
ld
>> >      share?
>> >      >
>> >      > Thanks,
>> >      >
>> >      > Luke
>> >
>> >    --
>> > References
>> >
>> >    1. mailto:william.c.roberts(a)intel.com
>> >    2.
>> https://github.com/tpm2-software/tpm2-abrmd/blob/master/.travis.yml#L2
>> >    3.
>> https://docs.travis-ci.com/user/reference/overview/#virtualization-envir=
onments
>> >    4. mailto:tpm2-bounces(a)lists.01.org
>> >    5. mailto:tpm2(a)lists.01.org
>> >    6. mailto:lhinds(a)redhat.com
>>
>> Some dbus stuff happened in the tools repo recently. Not sure if this
>> would be
>> of help.
>>
>> https://github.com/tpm2-software/tpm2-tools/commit/9a6430ef293bc1a506224=
431af9370c7748f39b4
>>
>>
> That look's like just what I need, thanks!
>
>
>> > _______________________________________________
>> > tpm2 mailing list
>> > tpm2(a)lists.01.org
>> > https://lists.01.org/mailman/listinfo/tpm2
>>
>>
>
>
Almost have this working now or perhaps getting warmer. I am now looking
for some advice on what values and arguments I should be using to make sure
connectivity goes from tpm2-tools > tpm2-abrmd > tpm2 mssim

Within my container I run:

mkdir -p /var/run/dbus/
dbus-daemon --fork --system

start the simulator:

tpm_server &
[1] 24
[root(a)a2d41fb37bb3 src]# TPM command server listening on port 2321
Platform server listening on port 2322

If I now run:

[root(a)a2d41fb37bb3 src]# /usr/local/sbin/tpm2-abrmd --allow-root
--tcti=3Dmssim &

I can see an active bus:

[root(a)a2d41fb37bb3 src]# dbus-send --system --dest=3Dorg.freedesktop.DBus
--type=3Dmethod_call --print-reply /org/freedesktop/DBus
org.freedesktop.DBus.ListNames
method return time=3D1549380992.829764 sender=3Dorg.freedesktop.DBus ->
destination=3D:1.7 serial=3D3 reply_serial=3D2
   array [
      string "org.freedesktop.DBus"
      string ":1.7"
      string "com.intel.tss2.Tabrmd"
      string ":1.6"
   ]


[root(a)a2d41fb37bb3 src]# dbus-send --system --dest=3Dcom.intel.tss2.Tabrmd
--type=3Dmethod_call --print-reply /com/intel/tss2/Tabrmd/Tcti
org.freedesktop.DBus.Introspectable.Introspect
method return time=3D1549381010.989948 sender=3D:1.6 -> destination=3D:1.8
serial=3D7 reply_serial=3D2
   string "<!DOCTYPE node PUBLIC "-//freedesktop//DTD D-BUS Object
Introspection 1.0//EN"
                      "
http://www.freedesktop.org/standards/dbus/1.0/introspect.dtd">
<!-- GDBus 2.58.3 -->
<node>
  <interface name=3D"org.freedesktop.DBus.Properties">
    <method name=3D"Get">
      <arg type=3D"s" name=3D"interface_name" direction=3D"in"/>
      <arg type=3D"s" name=3D"property_name" direction=3D"in"/>
      <arg type=3D"v" name=3D"value" direction=3D"out"/>
    </method>
    <method name=3D"GetAll">
      <arg type=3D"s" name=3D"interface_name" direction=3D"in"/>
      <arg type=3D"a{sv}" name=3D"properties" direction=3D"out"/>
    </method>
    <method name=3D"Set">
      <arg type=3D"s" name=3D"interface_name" direction=3D"in"/>
      <arg type=3D"s" name=3D"property_name" direction=3D"in"/>
      <arg type=3D"v" name=3D"value" direction=3D"in"/>
    </method>
    <signal name=3D"PropertiesChanged">
      <arg type=3D"s" name=3D"interface_name"/>
      <arg type=3D"a{sv}" name=3D"changed_properties"/>
      <arg type=3D"as" name=3D"invalidated_properties"/>
    </signal>
  </interface>
  <interface name=3D"org.freedesktop.DBus.Introspectable">
    <method name=3D"Introspect">
      <arg type=3D"s" name=3D"xml_data" direction=3D"out"/>
    </method>
  </interface>
  <interface name=3D"org.freedesktop.DBus.Peer">
    <method name=3D"Ping"/>
    <method name=3D"GetMachineId">
      <arg type=3D"s" name=3D"machine_uuid" direction=3D"out"/>
    </method>
  </interface>
  <interface name=3D"com.intel.tss2.TctiTabrmd">
    <method name=3D"CreateConnection">
      <arg type=3D"ah" name=3D"fds" direction=3D"out"/>
      <arg type=3D"t" name=3D"id" direction=3D"out"/>
    </method>
    <method name=3D"Cancel">
      <arg type=3D"t" name=3D"id" direction=3D"in"/>
      <arg type=3D"u" name=3D"return_code" direction=3D"out"/>
    </method>
    <method name=3D"SetLocality">
      <arg type=3D"t" name=3D"id" direction=3D"in"/>
      <arg type=3D"y" name=3D"locality" direction=3D"in"/>
      <arg type=3D"u" name=3D"return_code" direction=3D"out"/>
    </method>
  </interface>
</node>

The part I am now not sure of, is how to configure TPM2TOOLS_TCTI and what
args should be used for the RM.

As it is, its expected with TPM2TOOLS_TCTI undeclared  :

[root(a)a2d41fb37bb3 src]# tpm2_pcrlist
ERROR:tcti:src/tss2-tcti/tcti-device.c:399:Tss2_Tcti_Device_Init() Failed
to open device file /dev/tpm0: No such file or directory
ERROR: tcti init allocation routine failed for library: "device" options:
"(null)"
ERROR: Could not load tcti, got: "device"

I have then tried different variations:

export TPM2TOOLS_TCTI=3D"mssim:host=3Dlocalhost,port=3D2321"
export TPM2TOOLS_TCTI=3D"mssim:port=3D2321"
export TPM2TOOLS_TCTI=3D"mssim:tcp://127.0.0.1:2321"

I am guessing this would be wrong though? I don't want the tools connecting
to the mssim, I want them connecting to the resource manager.

I should also mention, none of the above work - running `tpm2_pcrlist` just
results in the command hanging and needing a ctrl c to break out.

[root(a)a2d41fb37bb3 src]# export
TPM2TOOLS_TCTI=3D"tabrmd:bus_name=3Dcom.intel.tss2.Tabrmd,tabrmd:bus_type=
=3Dsession"
[root(a)a2d41fb37bb3 src]# tpm2_pcrlist
ERROR: Could not dlopen library: "tabrmd"
ERROR: Could not load tcti, got: "tabrmd"

So I then tried try this:

[root(a)a2d41fb37bb3 src]# /usr/local/sbin/tpm2-abrmd --allow-root
--tcti=3Dlibtss2-tcti-mssim.so &
[root(a)a2d41fb37bb3 src]# export TPM2TOOLS_TCTI=3D"mssim:port=3D2321"
[root(a)a2d41fb37bb3 src]# tpm2_pcrlist

Unfortunately the command just hangs, needing a ctrl-c to break the session.

I am aware I may be "making a pigs ear" of this, if so excuse my
green'ness.

If anyone can point me towards what args I should be using for the
connectivity flow I outlined towards the start of this email, that would be
great!

Thanks,

Luke

--===============8534512625108613524==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0
ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9
Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBk
aXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRp
diBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+
PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0
ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2
Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWls
X2F0dHIiPk9uIE1vbiwgRmViIDQsIDIwMTkgYXQgNjo1NSBQTSBMdWtlIEhpbmRzICZsdDs8YSBo
cmVmPSJtYWlsdG86bGhpbmRzQHJlZGhhdC5jb20iIHRhcmdldD0iX2JsYW5rIj5saGluZHNAcmVk
aGF0LmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxf
cXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNv
bGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+PGRpdiBkaXI9Imx0ciI+PGRp
diBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBk
aXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIE1vbiwgRmViIDQsIDIwMTkgYXQgNjowNSBQ
TSBBbmRlcnNlbiwgSm9obiAmbHQ7PGEgaHJlZj0ibWFpbHRvOmpvaG4ucy5hbmRlcnNlbkBpbnRl
bC5jb20iIHRhcmdldD0iX2JsYW5rIj5qb2huLnMuYW5kZXJzZW5AaW50ZWwuY29tPC9hPiZndDsg
d3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1h
cmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQs
MjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij5PbiBNb24sIEZlYiAwNCwgMjAxOSBhdCAwNDo1NzoxMlBN
ICswMDAwLCBMdWtlIEhpbmRzIHdyb3RlOjxicj4KJmd0O8KgIMKgIE9uIE1vbiwgRmViIDQsIDIw
MTkgYXQgNDoxMiBQTSBSb2JlcnRzLCBXaWxsaWFtIEM8YnI+CiZndDvCoCDCoCAmbHQ7WzFdPGEg
aHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsi
PndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj4KJmd0OyA8YnI+
CiZndDvCoCDCoCDCoCBJIHJ1biBpdCBpbiBvdXIgQ0kgc3lzdGVtIHdoaWNoIGlzIHVzaW5nIGEg
ZG9ja2VyIGNvbnRhaW5lciwgbm90PGJyPgomZ3Q7wqAgwqAgwqAgc3VyZSBpZiB0aGF0IGhlbHBz
PGJyPgomZ3Q7wqAgwqAgwqAgQnV0IHlvdSBjYW4gbG9vayBhdCBvdXIgc2NyaXB0cyBmb3IgaXQu
PGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKgIERvIHlvdSBtZWFuIHRoZSBmb2xsb3dpbmcgdHJhdmlz
LWNpIGZpbGU6PGJyPgomZ3Q7wqAgwqAgWzJdPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3Rw
bTItc29mdHdhcmUvdHBtMi1hYnJtZC9ibG9iL21hc3Rlci8udHJhdmlzLnltbCMiIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJl
L3RwbTItYWJybWQvYmxvYi9tYXN0ZXIvLnRyYXZpcy55bWwjPC9hPjxicj4KJmd0O8KgIMKgIEwy
PGJyPgomZ3Q7wqAgwqAgSSBub3RpY2VkIHRoaXMsIGJ1dCBJIHRoaW5rIGl0cyBhIFZNICh1bmxl
c3MgSSBhbSBtaXN0YWtlbik6PGJyPgomZ3Q7wqAgwqAgWzNdPGEgaHJlZj0iaHR0cHM6Ly9kb2Nz
LnRyYXZpcy1jaS5jb20vdXNlci9yZWZlcmVuY2Uvb3ZlcnZpZXcvI3ZpcnR1YWxpemF0aW9uLWUi
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZG9jcy50cmF2aXMtY2ku
Y29tL3VzZXIvcmVmZXJlbmNlL292ZXJ2aWV3LyN2aXJ0dWFsaXphdGlvbi1lPC9hPjxicj4KJmd0
O8KgIMKgIG52aXJvbm1lbnRzPGJyPgomZ3Q7wqAgwqAgQW55IHBvaW50ZXJzIHRvIGZpbGVzIHRo
YXQgcmVmZXJlbmNlIHlvdXIgY29udGFpbmVyIHVzZSwgd291bGQgYmU8YnI+CiZndDvCoCDCoCBo
ZWxwZnVsLjxicj4KJmd0O8KgIMKgIENoZWVycyw8YnI+CiZndDvCoCDCoCBMdWtlPGJyPgomZ3Q7
IDxicj4KJmd0O8KgIMKgIMKgICZndDsgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS08YnI+CiZn
dDvCoCDCoCDCoCAmZ3Q7IEZyb206IHRwbTIgW21haWx0bzpbNF08YSBocmVmPSJtYWlsdG86dHBt
Mi1ib3VuY2VzQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItYm91bmNlc0BsaXN0
cy4wMS5vcmc8L2E+XSBPbiBCZWhhbGYgT2YgTHVrZTxicj4KJmd0O8KgIMKgIMKgIEhpbmRzPGJy
PgomZ3Q7wqAgwqAgwqAgJmd0OyBTZW50OiBNb25kYXksIEZlYnJ1YXJ5IDQsIDIwMTkgNzo0NyBB
TTxicj4KJmd0O8KgIMKgIMKgICZndDsgVG86IFs1XTxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3Rz
LjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4KJmd0O8Kg
IMKgIMKgICZndDsgU3ViamVjdDogW3RwbTJdIHRwbTItYWJybWQgaW4gYSBjb250YWluZXI8YnI+
CiZndDvCoCDCoCDCoCAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgJmd0OyBIZWxsbyw8YnI+CiZndDvC
oCDCoCDCoCAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgJmd0OyBJIGhhdmUgYmVlbiB3b3JraW5nIG9u
IHRyeWluZyB0byBnZXQgdHBtMi1hYnJtZCBydW5uaW5nIGluIGE8YnI+CiZndDvCoCDCoCDCoCBj
b250YWluZXIsIGJ1dCBpdHM8YnI+CiZndDvCoCDCoCDCoCAmZ3Q7IHByb3ZpbmcgcHJvYmxlbWF0
aWMgYXMgdGhlcmUgaXMgYSByZXF1aXJlbWVudCBvbiBzeXN0ZW0tZCBhbmQ8YnI+CiZndDvCoCDC
oCDCoCBkYnVzLiBUaGlzIGluIHR1cm48YnI+CiZndDvCoCDCoCDCoCAmZ3Q7IHJlcXVpcmVzIHJ1
bm5pbmcgdGhlIGNvbnRhaW5lciBhcyBwcml2aWxlZ2VkIGFuZCBtb3VudGluZyB0aGU8YnI+CiZn
dDvCoCDCoCDCoCBob3N0cyBjZ3JvdXAgKGFuZDxicj4KJmd0O8KgIMKgIMKgICZndDsgYWRkaW5n
IGNhcCBzeXMtYWRtaW4pLjxicj4KJmd0O8KgIMKgIMKgICZndDs8YnI+CiZndDvCoCDCoCDCoCAm
Z3Q7IE15IHJlYXNvbiBmb3IgdXNpbmcgYSBjb250YWluZXIsIGlzIGZvciBDSSAvIGZ1bmN0aW9u
YWwgdGVzdGluZyBvZjxicj4KJmd0O8KgIMKgIMKgIGEgcHJvamVjdCB0aGF0IHdpbGw8YnI+CiZn
dDvCoCDCoCDCoCAmZ3Q7IHVzZSBhYnJtZCBhbmQgaGF2aW5nIGEgbGlnaHR3ZWlnaHQgbWVhbnMg
dG8gdGVzdCBhZ2FpbnN0IHRoZTxicj4KJmd0O8KgIMKgIMKgIHJlc291cmNlIG1hbmFnZXI8YnI+
CiZndDvCoCDCoCDCoCAmZ3Q7IHJ1bm5pbmcgaW4gYSBjb250YWluZXIuPGJyPgomZ3Q7wqAgwqAg
wqAgJmd0Ozxicj4KJmd0O8KgIMKgIMKgICZndDsgSSBhbSBzdGlsbCBlYXJseSBpbiBsb29raW5n
IGF0IHdheXMgdG8gYWNoaWV2ZSB0aGlzLCBzbyBJIHdhbnRlZDxicj4KJmd0O8KgIMKgIMKgIHRv
IGFzayBpZiBhbnkgb3RoZXJzPGJyPgomZ3Q7wqAgwqAgwqAgJmd0OyBoYXZlIHNuaXBwZXRzIG9m
IHByZXZpb3VzIGF0dGVtcHRzIChzdWNjZXNzZnVsIG9yIG5vdCkgdGhleSBjb3VsZDxicj4KJmd0
O8KgIMKgIMKgIHNoYXJlPzxicj4KJmd0O8KgIMKgIMKgICZndDs8YnI+CiZndDvCoCDCoCDCoCAm
Z3Q7IFRoYW5rcyw8YnI+CiZndDvCoCDCoCDCoCAmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAgJmd0OyBM
dWtlPGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKgIC0tPGJyPgomZ3Q7IFJlZmVyZW5jZXM8YnI+CiZn
dDsgPGJyPgomZ3Q7wqAgwqAgMS4gbWFpbHRvOjxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9i
ZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5j
b208L2E+PGJyPgomZ3Q7wqAgwqAgMi4gPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTIt
c29mdHdhcmUvdHBtMi1hYnJtZC9ibG9iL21hc3Rlci8udHJhdmlzLnltbCNMMiIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUv
dHBtMi1hYnJtZC9ibG9iL21hc3Rlci8udHJhdmlzLnltbCNMMjwvYT48YnI+CiZndDvCoCDCoCAz
LiA8YSBocmVmPSJodHRwczovL2RvY3MudHJhdmlzLWNpLmNvbS91c2VyL3JlZmVyZW5jZS9vdmVy
dmlldy8jdmlydHVhbGl6YXRpb24tZW52aXJvbm1lbnRzIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5odHRwczovL2RvY3MudHJhdmlzLWNpLmNvbS91c2VyL3JlZmVyZW5jZS9vdmVy
dmlldy8jdmlydHVhbGl6YXRpb24tZW52aXJvbm1lbnRzPC9hPjxicj4KJmd0O8KgIMKgIDQuIG1h
aWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMi1ib3VuY2VzQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJf
YmxhbmsiPnRwbTItYm91bmNlc0BsaXN0cy4wMS5vcmc8L2E+PGJyPgomZ3Q7wqAgwqAgNS4gbWFp
bHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRw
bTJAbGlzdHMuMDEub3JnPC9hPjxicj4KJmd0O8KgIMKgIDYuIG1haWx0bzo8YSBocmVmPSJtYWls
dG86bGhpbmRzQHJlZGhhdC5jb20iIHRhcmdldD0iX2JsYW5rIj5saGluZHNAcmVkaGF0LmNvbTwv
YT48YnI+Cjxicj4KU29tZSBkYnVzIHN0dWZmIGhhcHBlbmVkIGluIHRoZSB0b29scyByZXBvIHJl
Y2VudGx5LiBOb3Qgc3VyZSBpZiB0aGlzIHdvdWxkIGJlPGJyPgpvZiBoZWxwLjxicj4KPGEgaHJl
Zj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10b29scy9jb21taXQvOWE2
NDMwZWYyOTNiYzFhNTA2MjI0NDMxYWY5MzcwYzc3NDhmMzliNCIgcmVsPSJub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10b29s
cy9jb21taXQvOWE2NDMwZWYyOTNiYzFhNTA2MjI0NDMxYWY5MzcwYzc3NDhmMzliNDwvYT48YnI+
Cjxicj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGF0IGxvb2smIzM5O3MgbGlr
ZSBqdXN0IHdoYXQgSSBuZWVkLCB0aGFua3MhPC9kaXY+PGRpdj7CoDwvZGl2PjxibG9ja3F1b3Rl
IGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3Jk
ZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4KJmd0
OyBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXzxicj4KJmd0
OyB0cG0yIG1haWxpbmcgbGlzdDxicj4KJmd0OyA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4w
MS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT48YnI+CiZndDsgPGEg
aHJlZj0iaHR0cHM6Ly9saXN0cy4wMS5vcmcvbWFpbG1hbi9saXN0aW5mby90cG0yIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xpc3RzLjAxLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3RwbTI8L2E+PGJyPgo8YnI+CjwvYmxvY2txdW90ZT48L2Rpdj48YnIgY2xlYXI9ImFs
bCI+PGRpdj48YnI+PC9kaXY+PC9kaXY+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+
QWxtb3N0IGhhdmUgdGhpcyB3b3JraW5nIG5vdyBvciBwZXJoYXBzIGdldHRpbmcgd2FybWVyLiBJ
IGFtIG5vdyBsb29raW5nIGZvciBzb21lIGFkdmljZSBvbiB3aGF0IHZhbHVlcyBhbmQgYXJndW1l
bnRzIEkgc2hvdWxkIGJlIHVzaW5nIHRvIG1ha2Ugc3VyZSBjb25uZWN0aXZpdHkgZ29lcyBmcm9t
IHRwbTItdG9vbHMgJmd0OyB0cG0yLWFicm1kICZndDsgdHBtMiBtc3NpbTwvZGl2PjxkaXY+PGJy
PjwvZGl2PjxkaXY+V2l0aGluIG15IGNvbnRhaW5lciBJIHJ1bjo8YnI+PC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdj5ta2RpciAtcCAvdmFyL3J1bi9kYnVzLzxicj48L2Rpdj48ZGl2PmRidXMtZGFl
bW9uIC0tZm9yayAtLXN5c3RlbTxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PnN0YXJ0IHRo
ZSBzaW11bGF0b3I6PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48ZGl2PnRwbV9zZXJ2ZXIgJmFt
cDs8L2Rpdj48ZGl2PlsxXSAyNDwvZGl2PjxkaXY+W3Jvb3RAYTJkNDFmYjM3YmIzIHNyY10jIFRQ
TSBjb21tYW5kIHNlcnZlciBsaXN0ZW5pbmcgb24gcG9ydCAyMzIxPC9kaXY+PGRpdj5QbGF0Zm9y
bSBzZXJ2ZXIgbGlzdGVuaW5nIG9uIHBvcnQgMjMyMjwvZGl2PjwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+SWYgSSBub3cgcnVuOjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+W3Jvb3RAYTJkNDFm
YjM3YmIzIHNyY10jIC91c3IvbG9jYWwvc2Jpbi90cG0yLWFicm1kIC0tYWxsb3ctcm9vdCAtLXRj
dGk9bXNzaW0gJmFtcDs8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JIGNhbiBzZWUgYW4g
YWN0aXZlIGJ1czo8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxkaXY+W3Jvb3RAYTJkNDFmYjM3
YmIzIHNyY10jIGRidXMtc2VuZCAtLXN5c3RlbSAtLWRlc3Q9b3JnLmZyZWVkZXNrdG9wLkRCdXMg
LS10eXBlPW1ldGhvZF9jYWxsIC0tcHJpbnQtcmVwbHkgL29yZy9mcmVlZGVza3RvcC9EQnVzIG9y
Zy5mcmVlZGVza3RvcC5EQnVzLkxpc3ROYW1lczwvZGl2PjxkaXY+bWV0aG9kIHJldHVybiB0aW1l
PTE1NDkzODA5OTIuODI5NzY0IHNlbmRlcj1vcmcuZnJlZWRlc2t0b3AuREJ1cyAtJmd0OyBkZXN0
aW5hdGlvbj06MS43IHNlcmlhbD0zIHJlcGx5X3NlcmlhbD0yPC9kaXY+PGRpdj7CoCDCoGFycmF5
IFs8L2Rpdj48ZGl2PsKgIMKgIMKgIHN0cmluZyAmcXVvdDtvcmcuZnJlZWRlc2t0b3AuREJ1cyZx
dW90OzwvZGl2PjxkaXY+wqAgwqAgwqAgc3RyaW5nICZxdW90OzoxLjcmcXVvdDs8L2Rpdj48ZGl2
PsKgIMKgIMKgIHN0cmluZyAmcXVvdDtjb20uaW50ZWwudHNzMi5UYWJybWQmcXVvdDs8L2Rpdj48
ZGl2PsKgIMKgIMKgIHN0cmluZyAmcXVvdDs6MS42JnF1b3Q7PC9kaXY+PGRpdj7CoCDCoF08L2Rp
dj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxkaXY+W3Jvb3RAYTJk
NDFmYjM3YmIzIHNyY10jIGRidXMtc2VuZCAtLXN5c3RlbSAtLWRlc3Q9Y29tLmludGVsLnRzczIu
VGFicm1kIC0tdHlwZT1tZXRob2RfY2FsbCAtLXByaW50LXJlcGx5IC9jb20vaW50ZWwvdHNzMi9U
YWJybWQvVGN0aSBvcmcuZnJlZWRlc2t0b3AuREJ1cy5JbnRyb3NwZWN0YWJsZS5JbnRyb3NwZWN0
PC9kaXY+PGRpdj5tZXRob2QgcmV0dXJuIHRpbWU9MTU0OTM4MTAxMC45ODk5NDggc2VuZGVyPTox
LjYgLSZndDsgZGVzdGluYXRpb249OjEuOCBzZXJpYWw9NyByZXBseV9zZXJpYWw9MjwvZGl2Pjxk
aXY+wqAgwqBzdHJpbmcgJnF1b3Q7Jmx0OyFET0NUWVBFIG5vZGUgUFVCTElDICZxdW90Oy0vL2Zy
ZWVkZXNrdG9wLy9EVEQgRC1CVVMgT2JqZWN0IEludHJvc3BlY3Rpb24gMS4wLy9FTiZxdW90Ozwv
ZGl2PjxkaXY+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJnF1b3Q7PGEgaHJlZj0i
aHR0cDovL3d3dy5mcmVlZGVza3RvcC5vcmcvc3RhbmRhcmRzL2RidXMvMS4wL2ludHJvc3BlY3Qu
ZHRkIj5odHRwOi8vd3d3LmZyZWVkZXNrdG9wLm9yZy9zdGFuZGFyZHMvZGJ1cy8xLjAvaW50cm9z
cGVjdC5kdGQ8L2E+JnF1b3Q7Jmd0OzwvZGl2PjxkaXY+Jmx0OyEtLSBHREJ1cyAyLjU4LjMgLS0m
Z3Q7PC9kaXY+PGRpdj4mbHQ7bm9kZSZndDs8L2Rpdj48ZGl2PsKgICZsdDtpbnRlcmZhY2UgbmFt
ZT0mcXVvdDtvcmcuZnJlZWRlc2t0b3AuREJ1cy5Qcm9wZXJ0aWVzJnF1b3Q7Jmd0OzwvZGl2Pjxk
aXY+wqAgwqAgJmx0O21ldGhvZCBuYW1lPSZxdW90O0dldCZxdW90OyZndDs8L2Rpdj48ZGl2PsKg
IMKgIMKgICZsdDthcmcgdHlwZT0mcXVvdDtzJnF1b3Q7IG5hbWU9JnF1b3Q7aW50ZXJmYWNlX25h
bWUmcXVvdDsgZGlyZWN0aW9uPSZxdW90O2luJnF1b3Q7LyZndDs8L2Rpdj48ZGl2PsKgIMKgIMKg
ICZsdDthcmcgdHlwZT0mcXVvdDtzJnF1b3Q7IG5hbWU9JnF1b3Q7cHJvcGVydHlfbmFtZSZxdW90
OyBkaXJlY3Rpb249JnF1b3Q7aW4mcXVvdDsvJmd0OzwvZGl2PjxkaXY+wqAgwqAgwqAgJmx0O2Fy
ZyB0eXBlPSZxdW90O3YmcXVvdDsgbmFtZT0mcXVvdDt2YWx1ZSZxdW90OyBkaXJlY3Rpb249JnF1
b3Q7b3V0JnF1b3Q7LyZndDs8L2Rpdj48ZGl2PsKgIMKgICZsdDsvbWV0aG9kJmd0OzwvZGl2Pjxk
aXY+wqAgwqAgJmx0O21ldGhvZCBuYW1lPSZxdW90O0dldEFsbCZxdW90OyZndDs8L2Rpdj48ZGl2
PsKgIMKgIMKgICZsdDthcmcgdHlwZT0mcXVvdDtzJnF1b3Q7IG5hbWU9JnF1b3Q7aW50ZXJmYWNl
X25hbWUmcXVvdDsgZGlyZWN0aW9uPSZxdW90O2luJnF1b3Q7LyZndDs8L2Rpdj48ZGl2PsKgIMKg
IMKgICZsdDthcmcgdHlwZT0mcXVvdDthe3N2fSZxdW90OyBuYW1lPSZxdW90O3Byb3BlcnRpZXMm
cXVvdDsgZGlyZWN0aW9uPSZxdW90O291dCZxdW90Oy8mZ3Q7PC9kaXY+PGRpdj7CoCDCoCAmbHQ7
L21ldGhvZCZndDs8L2Rpdj48ZGl2PsKgIMKgICZsdDttZXRob2QgbmFtZT0mcXVvdDtTZXQmcXVv
dDsmZ3Q7PC9kaXY+PGRpdj7CoCDCoCDCoCAmbHQ7YXJnIHR5cGU9JnF1b3Q7cyZxdW90OyBuYW1l
PSZxdW90O2ludGVyZmFjZV9uYW1lJnF1b3Q7IGRpcmVjdGlvbj0mcXVvdDtpbiZxdW90Oy8mZ3Q7
PC9kaXY+PGRpdj7CoCDCoCDCoCAmbHQ7YXJnIHR5cGU9JnF1b3Q7cyZxdW90OyBuYW1lPSZxdW90
O3Byb3BlcnR5X25hbWUmcXVvdDsgZGlyZWN0aW9uPSZxdW90O2luJnF1b3Q7LyZndDs8L2Rpdj48
ZGl2PsKgIMKgIMKgICZsdDthcmcgdHlwZT0mcXVvdDt2JnF1b3Q7IG5hbWU9JnF1b3Q7dmFsdWUm
cXVvdDsgZGlyZWN0aW9uPSZxdW90O2luJnF1b3Q7LyZndDs8L2Rpdj48ZGl2PsKgIMKgICZsdDsv
bWV0aG9kJmd0OzwvZGl2PjxkaXY+wqAgwqAgJmx0O3NpZ25hbCBuYW1lPSZxdW90O1Byb3BlcnRp
ZXNDaGFuZ2VkJnF1b3Q7Jmd0OzwvZGl2PjxkaXY+wqAgwqAgwqAgJmx0O2FyZyB0eXBlPSZxdW90
O3MmcXVvdDsgbmFtZT0mcXVvdDtpbnRlcmZhY2VfbmFtZSZxdW90Oy8mZ3Q7PC9kaXY+PGRpdj7C
oCDCoCDCoCAmbHQ7YXJnIHR5cGU9JnF1b3Q7YXtzdn0mcXVvdDsgbmFtZT0mcXVvdDtjaGFuZ2Vk
X3Byb3BlcnRpZXMmcXVvdDsvJmd0OzwvZGl2PjxkaXY+wqAgwqAgwqAgJmx0O2FyZyB0eXBlPSZx
dW90O2FzJnF1b3Q7IG5hbWU9JnF1b3Q7aW52YWxpZGF0ZWRfcHJvcGVydGllcyZxdW90Oy8mZ3Q7
PC9kaXY+PGRpdj7CoCDCoCAmbHQ7L3NpZ25hbCZndDs8L2Rpdj48ZGl2PsKgICZsdDsvaW50ZXJm
YWNlJmd0OzwvZGl2PjxkaXY+wqAgJmx0O2ludGVyZmFjZSBuYW1lPSZxdW90O29yZy5mcmVlZGVz
a3RvcC5EQnVzLkludHJvc3BlY3RhYmxlJnF1b3Q7Jmd0OzwvZGl2PjxkaXY+wqAgwqAgJmx0O21l
dGhvZCBuYW1lPSZxdW90O0ludHJvc3BlY3QmcXVvdDsmZ3Q7PC9kaXY+PGRpdj7CoCDCoCDCoCAm
bHQ7YXJnIHR5cGU9JnF1b3Q7cyZxdW90OyBuYW1lPSZxdW90O3htbF9kYXRhJnF1b3Q7IGRpcmVj
dGlvbj0mcXVvdDtvdXQmcXVvdDsvJmd0OzwvZGl2PjxkaXY+wqAgwqAgJmx0Oy9tZXRob2QmZ3Q7
PC9kaXY+PGRpdj7CoCAmbHQ7L2ludGVyZmFjZSZndDs8L2Rpdj48ZGl2PsKgICZsdDtpbnRlcmZh
Y2UgbmFtZT0mcXVvdDtvcmcuZnJlZWRlc2t0b3AuREJ1cy5QZWVyJnF1b3Q7Jmd0OzwvZGl2Pjxk
aXY+wqAgwqAgJmx0O21ldGhvZCBuYW1lPSZxdW90O1BpbmcmcXVvdDsvJmd0OzwvZGl2PjxkaXY+
wqAgwqAgJmx0O21ldGhvZCBuYW1lPSZxdW90O0dldE1hY2hpbmVJZCZxdW90OyZndDs8L2Rpdj48
ZGl2PsKgIMKgIMKgICZsdDthcmcgdHlwZT0mcXVvdDtzJnF1b3Q7IG5hbWU9JnF1b3Q7bWFjaGlu
ZV91dWlkJnF1b3Q7IGRpcmVjdGlvbj0mcXVvdDtvdXQmcXVvdDsvJmd0OzwvZGl2PjxkaXY+wqAg
wqAgJmx0Oy9tZXRob2QmZ3Q7PC9kaXY+PGRpdj7CoCAmbHQ7L2ludGVyZmFjZSZndDs8L2Rpdj48
ZGl2PsKgICZsdDtpbnRlcmZhY2UgbmFtZT0mcXVvdDtjb20uaW50ZWwudHNzMi5UY3RpVGFicm1k
JnF1b3Q7Jmd0OzwvZGl2PjxkaXY+wqAgwqAgJmx0O21ldGhvZCBuYW1lPSZxdW90O0NyZWF0ZUNv
bm5lY3Rpb24mcXVvdDsmZ3Q7PC9kaXY+PGRpdj7CoCDCoCDCoCAmbHQ7YXJnIHR5cGU9JnF1b3Q7
YWgmcXVvdDsgbmFtZT0mcXVvdDtmZHMmcXVvdDsgZGlyZWN0aW9uPSZxdW90O291dCZxdW90Oy8m
Z3Q7PC9kaXY+PGRpdj7CoCDCoCDCoCAmbHQ7YXJnIHR5cGU9JnF1b3Q7dCZxdW90OyBuYW1lPSZx
dW90O2lkJnF1b3Q7IGRpcmVjdGlvbj0mcXVvdDtvdXQmcXVvdDsvJmd0OzwvZGl2PjxkaXY+wqAg
wqAgJmx0Oy9tZXRob2QmZ3Q7PC9kaXY+PGRpdj7CoCDCoCAmbHQ7bWV0aG9kIG5hbWU9JnF1b3Q7
Q2FuY2VsJnF1b3Q7Jmd0OzwvZGl2PjxkaXY+wqAgwqAgwqAgJmx0O2FyZyB0eXBlPSZxdW90O3Qm
cXVvdDsgbmFtZT0mcXVvdDtpZCZxdW90OyBkaXJlY3Rpb249JnF1b3Q7aW4mcXVvdDsvJmd0Ozwv
ZGl2PjxkaXY+wqAgwqAgwqAgJmx0O2FyZyB0eXBlPSZxdW90O3UmcXVvdDsgbmFtZT0mcXVvdDty
ZXR1cm5fY29kZSZxdW90OyBkaXJlY3Rpb249JnF1b3Q7b3V0JnF1b3Q7LyZndDs8L2Rpdj48ZGl2
PsKgIMKgICZsdDsvbWV0aG9kJmd0OzwvZGl2PjxkaXY+wqAgwqAgJmx0O21ldGhvZCBuYW1lPSZx
dW90O1NldExvY2FsaXR5JnF1b3Q7Jmd0OzwvZGl2PjxkaXY+wqAgwqAgwqAgJmx0O2FyZyB0eXBl
PSZxdW90O3QmcXVvdDsgbmFtZT0mcXVvdDtpZCZxdW90OyBkaXJlY3Rpb249JnF1b3Q7aW4mcXVv
dDsvJmd0OzwvZGl2PjxkaXY+wqAgwqAgwqAgJmx0O2FyZyB0eXBlPSZxdW90O3kmcXVvdDsgbmFt
ZT0mcXVvdDtsb2NhbGl0eSZxdW90OyBkaXJlY3Rpb249JnF1b3Q7aW4mcXVvdDsvJmd0OzwvZGl2
PjxkaXY+wqAgwqAgwqAgJmx0O2FyZyB0eXBlPSZxdW90O3UmcXVvdDsgbmFtZT0mcXVvdDtyZXR1
cm5fY29kZSZxdW90OyBkaXJlY3Rpb249JnF1b3Q7b3V0JnF1b3Q7LyZndDs8L2Rpdj48ZGl2PsKg
IMKgICZsdDsvbWV0aG9kJmd0OzwvZGl2PjxkaXY+wqAgJmx0Oy9pbnRlcmZhY2UmZ3Q7PC9kaXY+
PGRpdj4mbHQ7L25vZGUmZ3Q7PC9kaXY+PGRpdj48YnI+PC9kaXY+PC9kaXY+PGRpdj5UaGUgcGFy
dCBJIGFtIG5vdyBub3Qgc3VyZSBvZiwgaXMgaG93IHRvIGNvbmZpZ3VyZcKgVFBNMlRPT0xTX1RD
VEkgYW5kIHdoYXQgYXJncyBzaG91bGQgYmUgdXNlZCBmb3IgdGhlIFJNLjwvZGl2PjxkaXY+PGJy
PjwvZGl2PjxkaXY+QXMgaXQgaXMsIGl0cyBleHBlY3RlZCB3aXRoIFRQTTJUT09MU19UQ1RJIHVu
ZGVjbGFyZWTCoCA6PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48ZGl2Pltyb290QGEyZDQxZmIz
N2JiMyBzcmNdIyB0cG0yX3Bjcmxpc3TCoDwvZGl2PjxkaXY+RVJST1I6dGN0aTpzcmMvdHNzMi10
Y3RpL3RjdGktZGV2aWNlLmM6Mzk5OlRzczJfVGN0aV9EZXZpY2VfSW5pdCgpIEZhaWxlZCB0byBv
cGVuIGRldmljZSBmaWxlIC9kZXYvdHBtMDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yecKgPC9k
aXY+PGRpdj5FUlJPUjogdGN0aSBpbml0IGFsbG9jYXRpb24gcm91dGluZSBmYWlsZWQgZm9yIGxp
YnJhcnk6ICZxdW90O2RldmljZSZxdW90OyBvcHRpb25zOiAmcXVvdDsobnVsbCkmcXVvdDs8L2Rp
dj48ZGl2PkVSUk9SOiBDb3VsZCBub3QgbG9hZCB0Y3RpLCBnb3Q6ICZxdW90O2RldmljZSZxdW90
OzwvZGl2PjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSBoYXZlIHRoZW4gdHJpZWQgZGlmZmVy
ZW50IHZhcmlhdGlvbnM6PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5leHBvcnQgVFBNMlRPT0xT
X1RDVEk9JnF1b3Q7bXNzaW06aG9zdD1sb2NhbGhvc3QscG9ydD0yMzIxJnF1b3Q7PGJyPjwvZGl2
PjxkaXY+ZXhwb3J0IFRQTTJUT09MU19UQ1RJPSZxdW90O21zc2ltOnBvcnQ9MjMyMSZxdW90Ozxi
cj48L2Rpdj48ZGl2PmV4cG9ydCBUUE0yVE9PTFNfVENUST0mcXVvdDttc3NpbTp0Y3A6Ly88YSBo
cmVmPSJodHRwOi8vMTI3LjAuMC4xOjIzMjEiPjEyNy4wLjAuMToyMzIxPC9hPiZxdW90Ozxicj48
L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkkgYW0gZ3Vlc3NpbmcgdGhpcyB3b3VsZCBiZSB3cm9u
ZyB0aG91Z2g/IEkgZG9uJiMzOTt0IHdhbnQgdGhlIHRvb2xzIGNvbm5lY3RpbmcgdG8gdGhlIG1z
c2ltLCBJIHdhbnQgdGhlbSBjb25uZWN0aW5nIHRvIHRoZSByZXNvdXJjZSBtYW5hZ2VyLjwvZGl2
PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSBzaG91bGQgYWxzbyBtZW50aW9uLCBub25lIG9mIHRoZSBh
Ym92ZSB3b3JrIC0gcnVubmluZyBgdHBtMl9wY3JsaXN0YCBqdXN0IHJlc3VsdHMgaW4gdGhlIGNv
bW1hbmQgaGFuZ2luZyBhbmQgbmVlZGluZyBhIGN0cmwgYyB0byBicmVhayBvdXQuPC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj48ZGl2Pltyb290QGEyZDQxZmIzN2JiMyBzcmNdIyBleHBvcnQgVFBN
MlRPT0xTX1RDVEk9JnF1b3Q7dGFicm1kOmJ1c19uYW1lPWNvbS5pbnRlbC50c3MyLlRhYnJtZCx0
YWJybWQ6YnVzX3R5cGU9c2Vzc2lvbiZxdW90OzwvZGl2PjxkaXY+W3Jvb3RAYTJkNDFmYjM3YmIz
IHNyY10jIHRwbTJfcGNybGlzdMKgPC9kaXY+PGRpdj5FUlJPUjogQ291bGQgbm90IGRsb3BlbiBs
aWJyYXJ5OiAmcXVvdDt0YWJybWQmcXVvdDs8L2Rpdj48ZGl2PkVSUk9SOiBDb3VsZCBub3QgbG9h
ZCB0Y3RpLCBnb3Q6ICZxdW90O3RhYnJtZCZxdW90OzwvZGl2PjwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+U28gSSB0aGVuIHRyaWVkIHRyeSB0aGlzOjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+
W3Jvb3RAYTJkNDFmYjM3YmIzIHNyY10jIC91c3IvbG9jYWwvc2Jpbi90cG0yLWFicm1kIC0tYWxs
b3ctcm9vdCAtLXRjdGk9bGlidHNzMi10Y3RpLW1zc2ltLnNvICZhbXA7PGJyPjwvZGl2PjxkaXY+
PGRpdj5bcm9vdEBhMmQ0MWZiMzdiYjMgc3JjXSMgZXhwb3J0IFRQTTJUT09MU19UQ1RJPSZxdW90
O21zc2ltOnBvcnQ9MjMyMSZxdW90OzwvZGl2PjxkaXY+W3Jvb3RAYTJkNDFmYjM3YmIzIHNyY10j
IHRwbTJfcGNybGlzdDwvZGl2PjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+VW5mb3J0dW5hdGVs
eSB0aGUgY29tbWFuZCBqdXN0IGhhbmdzLCBuZWVkaW5nIGEgY3RybC1jIHRvIGJyZWFrIHRoZSBz
ZXNzaW9uLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSBhbSBhd2FyZSBJIG1heSBiZSAmcXVv
dDttYWtpbmcgYSBwaWdzIGVhciZxdW90OyBvZiB0aGlzLCBpZiBzbyBleGN1c2UgbXkgZ3JlZW4m
IzM5O25lc3MuwqA8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PklmIGFueW9uZSBjYW4gcG9pbnQg
bWUgdG93YXJkcyB3aGF0IGFyZ3MgSSBzaG91bGQgYmUgdXNpbmcgZm9yIHRoZSBjb25uZWN0aXZp
dHkgZmxvdyBJIG91dGxpbmVkIHRvd2FyZHMgdGhlIHN0YXJ0IG9mIHRoaXMgZW1haWwsIHRoYXQg
d291bGQgYmUgZ3JlYXQhPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3MsPC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj5MdWtlPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+
PC9kaXY+PC9kaXY+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsLW1fNDQ1NzcwMTQ1NjY2MTk0
NzA2NmdtYWlsLW1fLTQ0ODgxNzA0MzE5NDA4Mzc1MzdnbWFpbF9zaWduYXR1cmUiPjxkaXYgZGly
PSJsdHIiPjxkaXY+PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2IGRpcj0ibHRyIj48YnIgc3R5bGU9
ImZvbnQtc2l6ZToxMi44cHgiPjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2Pjwv
ZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2
PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2Pjwv
ZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2Pgo=

--===============8534512625108613524==--

