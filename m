Content-Type: multipart/mixed; boundary="===============5663676081786969919=="
MIME-Version: 1.0
From: Peter Magnusson <blaufish.public.email at gmail.com>
Subject: Re: [tpm2] Failed to create connection with service: Timeout was
 reached
Date: Wed, 11 Apr 2018 12:47:59 +0200
Message-ID: <CANtcRX5sYR9wDVwZwWhFz05vjq6xce_faPWoTWhJyb0Ok5wjnQ@mail.gmail.com>
In-Reply-To: 1d97e031-3a7f-d8f8-9215-5c8189beefc3@twobit.us
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5663676081786969919==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks,

I updated the GitHub issue tracker in
https://github.com/tpm2-software/tpm2-abrmd/issues/422#issuecomment-3804058=
63

After the fix (and paranoia updated tpm2-abrmd and tpm2-tools due to
these issues),
I now have two different issues,
* tpm2_pcrlist error sys:Response is malformed when running tpm2-abrmd
from command line
* tpm2_pcrlist error/warning Failed to get client PID when running
tpm2-abrmd from systemd.

Let me know if you prefer a separate issue filed on any of the issues above.

$ tpm2_pcrlist
WARNING:marshal:src/tss2-mu/tpml-types.c:197:Tss2_MU_TPML_PCR_SELECTION_Unm=
arshal()
count too big
ERROR: Tss2_Sys_GetCapability(0x80011) - sys:Response is malformed
ERROR: Unable to run tpm2_pcrlist

$ tpm2_pcrlist

** (process:1837): WARNING **: Failed to create connection with
service: GDBus.Error:com.intel.tss2.Tabrmd.Error.Internal: Failed to
get client PID
ERROR: tcti init allocation routine failed for library: "tabrmd"
options: "(null)"
ERROR: Could not load tcti, got: "tabrmd"

When running tpm2-abrmd in console with debug, I get a lot of
interesting output, seemingly indicating that some cross component
functionality works,
e.g.

** (tpm2-abrmd:1962): DEBUG: reading 10 bytes socket 0x7f26b50515a0,
to 0x7f268c001300
** (tpm2-abrmd:1962): DEBUG: successfully read 10 bytes
** (tpm2-abrmd:1962): DEBUG:     80 01 00 00 00 16 00 00 01 7a
** (tpm2-abrmd:1962): DEBUG: reading 12 bytes socket 0x7f26b50515a0,
to 0x7f268c00130a
** (tpm2-abrmd:1962): DEBUG: successfully read 12 bytes
** (tpm2-abrmd:1962): DEBUG:     00 00 00 05 00 00 00 00 00 00 00 01
** (tpm2-abrmd:1962): DEBUG: read_tpm_buffer_alloc: read TPM buffer to
0x7f268c001300 of size: 22
** (tpm2-abrmd:1962): DEBUG:     80 01 00 00 00 16 00 00 01 7a 00 00 00 05 =
00 00
** (tpm2-abrmd:1962): DEBUG:     00 00 00 00 00 01

** (tpm2-abrmd:1962): DEBUG: Tpm2Command: 0x7f26ac006a80
** (tpm2-abrmd:1962): DEBUG:     80 01 00 00 00 16 00 00 01 7a 00 00 00 05 =
00 00
** (tpm2-abrmd:1962): DEBUG:     00 00 00 00 00 01
** (tpm2-abrmd:1962): DEBUG: TPMA_CC: 0x0000017a
** (tpm2-abrmd:1962): DEBUG:   commandIndex: 0x17a
** (tpm2-abrmd:1962): DEBUG:   reserved1:    0x0
** (tpm2-abrmd:1962): DEBUG:   nv:           clear
** (tpm2-abrmd:1962): DEBUG:   extensive:    clear
** (tpm2-abrmd:1962): DEBUG:   flushed:      clear
** (tpm2-abrmd:1962): DEBUG:   cHandles:     0x0
** (tpm2-abrmd:1962): DEBUG:   rHandle:      clear
** (tpm2-abrmd:1962): DEBUG:   V:            clear
** (tpm2-abrmd:1962): DEBUG:   Res:          0x0
** (tpm2-abrmd:1962): DEBUG: tpm2_command_get_handle_count

** (tpm2-abrmd:1962): DEBUG: Tpm2Response: 0x7f26ac006440
** (tpm2-abrmd:1962): DEBUG:     80 01 00 00 00 2b 00 00 00 00 00 00 00 00 =
05 00
** (tpm2-abrmd:1962): DEBUG:     00 00 04 00 04 03 ff ff ff 00 0b 03 ff ff =
ff 00
** (tpm2-abrmd:1962): DEBUG:     0c 03 ff ff ff 00 0d 03 ff ff ff
** (tpm2-abrmd:1962): DEBUG: TPMA_CC: 0x0000017a
** (tpm2-abrmd:1962): DEBUG:   commandIndex: 0x17a
** (tpm2-abrmd:1962): DEBUG:   reserved1:    0x0
** (tpm2-abrmd:1962): DEBUG:   nv:           clear
** (tpm2-abrmd:1962): DEBUG:   extensive:    clear
** (tpm2-abrmd:1962): DEBUG:   flushed:      clear
** (tpm2-abrmd:1962): DEBUG:   cHandles:     0x0
** (tpm2-abrmd:1962): DEBUG:   rHandle:      clear
** (tpm2-abrmd:1962): DEBUG:   V:            clear
** (tpm2-abrmd:1962): DEBUG:   Res:          0x0
** (tpm2-abrmd:1962): DEBUG: resource_manager_create_context_mapping

** (tpm2-abrmd:1962): DEBUG:   writing 0x2b bytes
** (tpm2-abrmd:1962): DEBUG:     80 01 00 00 00 2b 00 00 00 00 00 00 00 00 =
05 00
** (tpm2-abrmd:1962): DEBUG:     00 00 04 00 04 03 ff ff ff 00 0b 03 ff ff =
ff 00
** (tpm2-abrmd:1962): DEBUG:     0c 03 ff ff ff 00 0d 03 ff ff ff



On Tue, Apr 10, 2018 at 5:35 PM, Philip Tricca <flihp(a)twobit.us> wrote:
> Hi Peter,
>
> On 04/10/2018 12:53 AM, Peter Magnusson wrote:
>> Hi,
>>
>> Error when running e.g. tpm2_pcrlist
>> ** (process:8120): WARNING **: Failed to create connection with
>> service: Timeout was reached
>> ERROR: tcti init allocation routine failed for library: "tabrmd"
>> options: "(null)"
>> ERROR: Could not load tcti, got: "tabrmd"
>>
>> Target system is Ubuntu Linux latest stable (4.13.0-38-generic
>> #43~16.04.1-Ubuntu) running under VMWare Fusion (very old version of
>> tpm2-tools from ubuntu apt install tested OK previously.) Source code
>> revision is head of tpm2-tss, tpm2-abrmd, tpm2-tools as of now.
>>
>> Problem occurs both if tpm2-armbd is running from systemd or is
>> executed from command line.
>>
>> When running from command line with debug, tpm2-abrmd emits the followin=
g:
>> sudo -u tss G_MESSAGES_DEBUG=3Dall tpm2-abrmd
>> ** INFO: tabrmd startup
>> ** INFO: logging to stdout
>> ** (tpm2-abrmd:2060): DEBUG: tcti_conf_parse
>> ** (tpm2-abrmd:2060): DEBUG: tcti_conf_parse: combined conf is null
>> ** (tpm2-abrmd:2060): DEBUG: tcti_dynamic_set_property: TctiDynamic
>> 0xc8d800 set filename: libtss2-tcti-device.so
>> ** (tpm2-abrmd:2060): DEBUG: tcti_dynamic_set_property: TctiDynamic
>> 0xc8d800 PROP_CONF_STR set to: (null)
>> ** INFO: entering g_main_loop
>> ** INFO: init_thread_func start
>> ** (tpm2-abrmd:2060): DEBUG: random_class_init
>> ** (tpm2-abrmd:2060): DEBUG: opening entropy source: /dev/urandom
>> ** (tpm2-abrmd:2060): DEBUG: reading from entropy source: /dev/urandom
>> ** (tpm2-abrmd:2060): DEBUG: seeding rand with -2303404397750689299
>> ** (tpm2-abrmd:2060): DEBUG: connection_manager_set_property: 0xc80700
>> ** (tpm2-abrmd:2060): DEBUG:   max_connections: 0x1b
>> ** (tpm2-abrmd:2060): DEBUG: ConnectionManager: 0xc80700
>> ** (tpm2-abrmd:2060): DEBUG: IpcFrontendDbus set bus_name: com.intel.tss=
2.Tabrmd
>> ** (tpm2-abrmd:2060): DEBUG: ipc_frontend_connect: 0x7f8744002060
>> ** (tpm2-abrmd:2060): DEBUG: tcti_initialize: 0xc8d800
>> ** (tpm2-abrmd:2060): DEBUG: tcti_dynamic_initialize: TctiDynamic 0xc8d8=
00
>> ** (tpm2-abrmd:2060): DEBUG: tcti_util_discover_info
>> ** (tpm2-abrmd:2060): DEBUG: tcti_util_dynamic_init
>> ** (tpm2-abrmd:2060): DEBUG: sapi_context_init w/ Tcti: 0xc8d800
>> ** (tpm2-abrmd:2060): DEBUG: tcti_peek_context: 0xc8d800
>> ** (tpm2-abrmd:2060): DEBUG: Allocating 0x1048 bytes for SAPI context
>> ** (tpm2-abrmd:2060): DEBUG: access_broker_set_property: 0x7f874400f030
>> ** (tpm2-abrmd:2060): DEBUG:   sapi_context: 0x7f874400dec0
>> ** (tpm2-abrmd:2060): DEBUG: access_broker_set_property: 0x7f874400f030
>> ** (tpm2-abrmd:2060): DEBUG:   tcti: 0xc8d800
>> ** (tpm2-abrmd:2060): DEBUG: created AccessBroker: 0x7f874400f030
>> ** (tpm2-abrmd:2060): DEBUG: access_broker_init_tpm: 0x7f874400f030
>> ** (tpm2-abrmd:2060): DEBUG: access_broker_get_tpm_properties_fixed
>> ** INFO: on_bus_acquired: com.intel.tss2.Tabrmd
>> ** INFO: on_name_acquired: com.intel.tss2.Tabrmd
>> ** (tpm2-abrmd:2060): DEBUG: Got proxy object for DBus daemon.
>
> This behavior is indicative of a bug we squashed in the core tpm2-tss
> libraries (really the device TCTI library) the other day:
> https://github.com/tpm2-software/tpm2-tss/pull/949
>
> What's happening above is the tpm2-abrmd is trying to make a call to the
> TPM2 device to query for some capabilities and it's getting stuck. So
> when you try to execute one of the tools the tpm2-abrmd isn't responding.
>
> Try pulling down the latest from tpm2-tss master branch and run the
> tpm2-abrmd again. You shouldn't need to recompile the daemon, just the
> tpm2-tss libraries.
>
> Philip
>
>> The following build, install and post-install steps has been executed,
>>
>> cd tpm2-abrmd
>> sudo useradd --system --user-group tss
>> ./bootstrap
>> ./configure --with-dbuspolicydir=3D/etc/dbus-1/system.d
>> --with-udevrulesdir=3D/etc/udev/rules.d/
>> --with-systemdsystemunitdir=3D/lib/systemd/system/
>> --with-systemdpresetdir=3D/lib/systemd/system-preset/
>> make
>> sudo make install
>> sudo mv /usr/local/share/dbus-1/system-services/com.intel.tss2.Tabrmd.se=
rvice
>> /usr/share/dbus-1/system-services/
>> cd dist
>> sudo udevadm control --reload-rules && sudo udevadm trigger
>> sudo mkdir -p /var/lib/tpm
>> sudo userdel tss
>> sudo groupadd tss && sudo useradd -M -d /var/lib/tpm -s /bin/false -g ts=
s tss
>> sudo pkill -HUP dbus-daemon
>> sudo chown tss:tss /dev/tpm0
>> cd ../..
>>
>> Also filed under https://github.com/tpm2-software/tpm2-abrmd/issues/422
>>
>> Best Regards
>> //Peter
>> _______________________________________________
>> tpm2 mailing list
>> tpm2(a)lists.01.org
>> https://lists.01.org/mailman/listinfo/tpm2
>>
>

--===============5663676081786969919==--

