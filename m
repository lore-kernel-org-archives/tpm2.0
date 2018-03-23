Content-Type: multipart/mixed; boundary="===============2192389622502624004=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] Problem with Infineon Iridium SLB 9670 TPM2.0
Date: Fri, 23 Mar 2018 19:58:40 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC563FF07CF2@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20180320191940.GB2354@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2192389622502624004==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Philip Tricca
> Sent: Tuesday, March 20, 2018 12:20 PM
> To: madprops(a)gmx.net
> Cc: tpm2(a)lists.01.org
> Subject: Re: [tpm2] Problem with Infineon Iridium SLB 9670 TPM2.0
> =

> Hey madprops,
> =

> Thanks for the additional data.
> =

> On Mon, Mar 19, 2018 at 09:17:33PM +0100, madprops(a)gmx.net wrote:
> > <html><head>
> > <meta http-equiv=3D"Content-Type" content=3D"text/html;
> > charset=3Dutf-8"></head><body><div style=3D"font-family:
> > Verdana;font-size: 12.0px;"><div> <div>Thank you, Philip! I meanwhile
> > noticed the tools work when I stop tpm2-abrmd and connect directly to
> > the TPM:&nbsp;</div>
> =

> Well this debunks my theory that your issue was down in the dev tree :)
> =

> > <div>&nbsp;</div>
> >
> > <div>pi(a)raspberrypi:~ $ sudo tpm2_pcrlist -T device:/dev/tpm0<br>
> > sha1 :<br>
> > &nbsp; 0&nbsp; : 0000000000000000000000000000000000000000<br>
> > &nbsp; 1&nbsp; : 0000000000000000000000000000000000000000<br>
> > [...]</div>
> >
> > <div>&nbsp;</div>
> >
> > <div>Please find below the information you asked for. While tpm2-abrmd
> > is running (as root) I still get this:</div>
> >
> > <div>&nbsp;</div>
> >
> > <div>pi(a)raspberrypi:~ $ tpm2_pcrlist<br>
> > ERROR: Failed to initialize tcti context: 0x1</div>
> =

> Seeing this error while the tabrmd is running, but having the tools execu=
te
> successfully with it stopped is a big hint. This indicates that the tools=
 are probably
> trying to connect to the /dev/tpm0 device node directly instead of using =
the
> tabrmd.
> =

> I've only see this happen if / when the tools are built in advance of bui=
lding *and*
> installing the tabrmd. This happens because the tools build looks for the=
 installed
> TCTI library for communicating with the daemon. If it doesn't find this l=
ibrary then
> the tools can't be linked against it and the build will fall back to usin=
g the device
> TCTI as the default. The `config.log` file in the tools build has the out=
put from the
> `configure` script and this will tell you which TCTI modules are enabled =
/ disabled.
> =

> Another way to check this theory is to take one of the tools executables =
and use
> `readelf` to dump information about the libraries that it links to. If th=
e tabrmd
> TCTI library isn't listed then something it up.

You can also specify -v to your tool commands option list to see what tcti'=
s it supports.
The first tcti in the string is the default IIC. I should have had an addit=
ional field
for default.

On master, we switched to dynamic TCTIs with abrmd always being the default.
I think the 4.0 release, I'm going to add a field to explicitly say what th=
e default
Is.

> =

> Everything else below looks right.
> =

> Regards,
> Philip
> =

> > <div>&nbsp;</div>
> >
> > <div>pi(a)raspberrypi:~ $ export TPM2TOOLS_TCTI_NAME=3Dtabrmd<br>
> > pi(a)raspberrypi:~ $ tpm2_pcrlist<br>
> > ERROR: Unknown tcti, got: &quot;tabrmd&quot;</div>
> >
> > <div>&nbsp;</div>
> >
> > <div>=3D=3D=3D=3D=3D=3D=3D=3D Versions:</div>
> >
> > <div>tpm2-abrmd: 1.3.1_rc0<br>
> > tpm2-tools: 3.0.3<br>
> > tpm2-tss: 1.4.0</div>
> >
> > <div>&nbsp;</div>
> >
> > <div>=3D=3D=3D=3D=3D=3D=3D=3D /dev/tpm0</div>
> >
> > <div>pi(a)raspberrypi:~ $ ls -la /dev/tpm0<br>
> > crw------- 1 root root 10, 224 Mar 17 21:35 /dev/tpm0</div>
> >
> > <div>=3D=3D=3D=3D=3D=3D=3D=3D tpm2-abrmd LOG</div>
> >
> > <div>root(a)raspberrypi:/home/pi# tpm2-abrmd<br>
> > ** INFO: tabrmd startup<br>
> > ** (process:1852): DEBUG: tcti_factory_set_property<br>
> > ** (process:1852): DEBUG:&nbsp;&nbsp; PROP_TCTI_TYPE<br>
> > ** (process:1852): DEBUG:&nbsp;&nbsp; value: 0x1<br>
> > ** (process:1852): DEBUG: tcti_factory_set_property<br>
> > ** (process:1852): DEBUG: TctiFactory set device_name: /dev/tpm0<br>
> > ** (process:1852): DEBUG: tcti_factory_set_property<br>
> > ** (process:1852): DEBUG: TctiFactory set socket_address:
> > 127.0.0.1<br>
> > ** (process:1852): DEBUG: tcti_factory_set_property<br>
> > ** (process:1852): DEBUG: TctiFactory set socket_port: 2321<br>
> > ** INFO: logging to stdout<br>
> > ** (tpm2-abrmd:1852): DEBUG: tcti_factory_get_tcti<br>
> > ** (tpm2-abrmd:1852): DEBUG: TctiDevice set filename: /dev/tpm0<br>
> > ** INFO: entering g_main_loop<br>
> > ** INFO: init_thread_func start<br>
> > ** (tpm2-abrmd:1852): DEBUG: random_class_init<br>
> > ** (tpm2-abrmd:1852): DEBUG: opening entropy source: /dev/urandom<br>
> > ** (tpm2-abrmd:1852): DEBUG: reading from entropy source:
> > /dev/urandom<br>
> > ** (tpm2-abrmd:1852): DEBUG: seeding rand with -1263045295<br>
> > ** (tpm2-abrmd:1852): DEBUG: connection_manager_set_property:
> > 0x15c5ef0<br>
> > ** (tpm2-abrmd:1852): DEBUG:&nbsp;&nbsp; max_connections: 0x1b<br>
> > ** (tpm2-abrmd:1852): DEBUG: ConnectionManager: 0x15c5ef0<br>
> > ** (tpm2-abrmd:1852): DEBUG: IpcFrontendDbus set bus_name:
> > com.intel.tss2.Tabrmd<br>
> > ** (tpm2-abrmd:1852): DEBUG: ipc_frontend_connect: 0x75b01a08<br>
> > ** (tpm2-abrmd:1852): DEBUG: tcti_initialize: 0x15c5200<br>
> > ** (tpm2-abrmd:1852): DEBUG: sapi_context_init w/ Tcti: 0x15c5200<br>
> > ** (tpm2-abrmd:1852): DEBUG: tcti_peek_context: 0x15c5200<br>
> > ** (tpm2-abrmd:1852): DEBUG: Allocating 0x1040 bytes for SAPI
> > context<br>
> > ** (tpm2-abrmd:1852): DEBUG: access_broker_set_property:
> > 0x75b0b720<br>
> > ** (tpm2-abrmd:1852): DEBUG:&nbsp;&nbsp; sapi_context: 0x75b0a690<br>
> > ** (tpm2-abrmd:1852): DEBUG: access_broker_set_property:
> > 0x75b0b720<br>
> > ** (tpm2-abrmd:1852): DEBUG:&nbsp;&nbsp; tcti: 0x15c5200<br>
> > ** (tpm2-abrmd:1852): DEBUG: created AccessBroker: 0x75b0b720<br>
> > ** (tpm2-abrmd:1852): DEBUG: access_broker_init_tpm: 0x75b0b720<br>
> > ** INFO: on_bus_acquired: com.intel.tss2.Tabrmd<br>
> > ** INFO: on_name_acquired: com.intel.tss2.Tabrmd<br>
> > ** (tpm2-abrmd:1852): DEBUG: Got proxy object for DBus daemon.<br>
> > ** (tpm2-abrmd:1852): DEBUG:
> > access_broker_get_tpm_properties_fixed<br>
> > ** (tpm2-abrmd:1852): DEBUG: command_attrs_class_init<br>
> > ** (tpm2-abrmd:1852): DEBUG: created CommandAttrs: 0x75b01260<br>
> > ** (tpm2-abrmd:1852): DEBUG: GetCapabilty for 0x500 commands<br>
> > ** (tpm2-abrmd:1852): DEBUG: got attributes for 0x5a commands<br>
> > ** (tpm2-abrmd:1852): DEBUG: command_source_class_init<br>
> > ** (tpm2-abrmd:1852): DEBUG: command_source_set_properties:
> > 0x75b02c50<br>
> > ** (tpm2-abrmd:1852): DEBUG:&nbsp;&nbsp; command_attrs:
> 0x75b01260<br>
> > ** (tpm2-abrmd:1852): DEBUG: command_source_set_properties:
> > 0x75b02c50<br>
> > ** (tpm2-abrmd:1852): DEBUG: created command source: 0x75b02c50<br>
> > ** (tpm2-abrmd:1852): DEBUG: session_list_new with max-per-connection:
> > 0x4<br>
> > ** (tpm2-abrmd:1852): DEBUG: session_list_init<br>
> > ** (tpm2-abrmd:1852): DEBUG: session_list_set_property: 0x15c5fb0
> > max-per-connection: 4<br>
> > ** (tpm2-abrmd:1852): DEBUG: resource_manager_set_property:
> > 0x75b02ca0<br>
> > ** (tpm2-abrmd:1852): DEBUG:&nbsp;&nbsp; in_queue: 0x75b00f90<br>
> > ** (tpm2-abrmd:1852): DEBUG: resource_manager_set_property:
> > 0x75b02ca0<br>
> > ** (tpm2-abrmd:1852): DEBUG:&nbsp;&nbsp; access_broker: 0x75b0b720<br>
> > ** (tpm2-abrmd:1852): DEBUG: resource_manager_set_property:
> > 0x75b02ca0<br>
> > ** (tpm2-abrmd:1852): DEBUG: created ResourceManager: 0x75b02ca0<br>
> > ** (tpm2-abrmd:1852): DEBUG: response_sink_set_property<br>
> > ** (tpm2-abrmd:1852): DEBUG:&nbsp;&nbsp; setting PROP_IN_QUEUE<br>
> > ** (tpm2-abrmd:1852): DEBUG: created response source: 0x75b012a8<br>
> > ** (tpm2-abrmd:1852): DEBUG: source_add_sink<br>
> > ** (tpm2-abrmd:1852): DEBUG: command_soruce_add_sink: CommandSource:
> > 0x75b02c50 , Sink: 0x75b02ca0<br>
> > ** (tpm2-abrmd:1852): DEBUG: command_source_set_properties:
> > 0x75b02c50<br>
> > ** (tpm2-abrmd:1852): DEBUG:&nbsp;&nbsp; sink: 0x75b02ca0<br>
> > ** (tpm2-abrmd:1852): DEBUG: source_add_sink<br>
> > ** (tpm2-abrmd:1852): DEBUG: resource_manager_add_sink:
> > ResourceManager: 0x75b02ca0, Sink: 0x75b012a8<br>
> > ** (tpm2-abrmd:1852): DEBUG: resource_manager_set_property:
> > 0x75b02ca0<br>
> > ** (tpm2-abrmd:1852): DEBUG:&nbsp;&nbsp; sink: 0x75b012a8<br>
> > ** INFO: init_thread_func done<br>
> > ** (tpm2-abrmd:1852): DEBUG: resource_manager_thread start<br>
> > ** (tpm2-abrmd:1852): DEBUG: response_sink_thread blocking on input
> > queue: 0x75b00e50<br>
> > ** (tpm2-abrmd:1852): DEBUG: message_queue_dequeue 0x75b00e50<br>
> > ** (tpm2-abrmd:1852): DEBUG: message_queue_dequeue 0x75b00f90</div>
> >
> > <div>&nbsp;</div>
> >
> > <div>=3D=3D=3D=3D=3D=3D=3D=3D MISC</div>
> >
> > <div>pi(a)raspberrypi:~/TPM/tpm2-tss $ cat
> > /etc/dbus-1/system.d/tpm2-abrmd.conf<br>
> > &lt;!DOCTYPE busconfig PUBLIC &quot;-//freedesktop//DTD D-BUS Bus
> > Configuration 1.0//EN&quot;<br>
> > &nbsp;&quot;http://www.freedesktop.org/standards/dbus/1.0/busconfig.dt
> > d&quot;&gt;<br>
> > &lt;busconfig&gt;<br>
> > &nbsp; &lt;!-- ../system.conf have denied everything, so we just punch
> > some holes --&gt;<br> &nbsp; &lt;policy user=3D&quot;tss&quot;&gt;<br>
> > &nbsp;&nbsp;&nbsp; &lt;allow
> > own=3D&quot;com.intel.tss2.Tabrmd&quot;/&gt;<br>
> > &nbsp; &lt;/policy&gt;<br>
> > &nbsp; &lt;policy user=3D&quot;root&quot;&gt;<br> &nbsp;&nbsp;&nbsp;
> > &lt;allow own=3D&quot;com.intel.tss2.Tabrmd&quot;/&gt;<br>
> > &nbsp; &lt;/policy&gt;<br>
> > &nbsp; &lt;policy context=3D&quot;default&quot;&gt;<br>
> > &nbsp;&nbsp;&nbsp; &lt;allow
> > send_destination=3D&quot;com.intel.tss2.Tabrmd&quot;/&gt;<br>
> > &nbsp;&nbsp;&nbsp; &lt;allow
> > receive_sender=3D&quot;com.intel.tss2.Tabrmd&quot;/&gt;<br>
> > &nbsp; &lt;/policy&gt;<br>
> > &lt;/busconfig&gt;</div>
> >
> > <div>&nbsp;</div>
> >
> > <div>&nbsp;</div>
> >
> > <div>&nbsp;
> > <div name=3D"quote" style=3D"margin:10px 5px 5px 10px; padding: 10px 0
> > 10px 10px; border-left:2px solid #C3D9E5; word-wrap: break-word;
> > -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;">
> > <div style=3D"margin:0 0 10px 0;"><b>Gesendet:</b>&nbsp;Montag, 19. M=
=C3=A4rz
> > 2018 um 06:07 Uhr<br> <b>Von:</b>&nbsp;&quot;Philip Tricca&quot;
> > &lt;philip.b.tricca(a)intel.com&gt;<br>
> > <b>An:</b>&nbsp;madprops(a)gmx.net<br>
> > <b>Cc:</b>&nbsp;tpm2(a)lists.01.org<br>
> > <b>Betreff:</b>&nbsp;Re: [tpm2] Problem with Infineon Iridium SLB 9670
> > TPM2.0</div>
> >
> > <div name=3D"quoted-content">Hey there madprops,<br> <br> On Sun, Mar
> > 18, 2018 at 02:04:15PM &#43;0100, madprops(a)gmx.net wrote:<br> &gt;
> > &lt;html&gt;&lt;head&gt;<br> &gt; &lt;meta
> > http-equiv=3D&quot;Content-Type&quot; content=3D&quot;text/html;
> > charset=3Dutf-8&quot;&gt;&lt;/head&gt;&lt;body&gt;&lt;div
> > style=3D&quot;font-family: Verdana;font-size:
> > 12.0px;&quot;&gt;&lt;div&gt;<br> &gt; &lt;div
> > class=3D&quot;signature&quot;&gt;<br>
> > &gt; &lt;div class=3D&quot;signature&quot;&gt;<br>
> > &gt; &lt;div&gt;I'm trying to get an &amp;quot;Infineon Iridium SLB
> > 9670 TPM 2.0 SPI Board&amp;quot; run on my Raspberry Pi 3. I have
> > downloaded, compiled and installed the latest versions of tpm2-abrmd,
> > tpm2-tss and tpm2-tools. I started tpm2-abrmd as root, hoping that I
> > can then interact with the Infineon TPM using tpm2-tools.
> > &amp;quot;tpm2_pcrlist&amp;quot; and all other tpm2_* commands,
> > however, return error &amp;quot;ERROR: Failed to initialize tcti
> > context: 0x1&amp;quot;.&lt;/div&gt;<br> &gt;<br> <br> Can you please
> > provide some more info about your configuration?<br> Specifically:<br>
> > - the version of the TSS2 libraries you're using<br>
> > - the version of the tabrmd you're using<br>
> > - the configuration options you're passing to each<br> <br> A log file
> > from the tabrmd with logging dialed all the way up would be<br>
> > helpful. Since tabrmd uses glib and it's logging infrastructure you
> > dial<br> up the debug output all the way by setting
> > `G_MESSAGES_DEBUG=3Dall` in the<br> daemon's environment.<br> <br> &gt;
> > &lt;div&gt;&amp;nbsp;&lt;/div&gt;<br>
> > &gt;<br>
> > &gt; &lt;div&gt;Any ideas? Thanks!&lt;/div&gt;<br> <br> The most
> > common issue we've seen people run into when installing from<br>
> > source is that the default value for the `prefix` and some other<br>
> > installation directories aren't what most expect.<br> <br> Still, if
> > you're running the daemon as root you shouldn't have any<br> issues
> > w/r to permissions on the /dev/tpm0 device node so I wonder if<br>
> > this node even exists on your platform. You may want to check to see
> > if<br> `/dev/tpm0` is even present on your system. You're on an ARM
> > platform<br> which means the kernel will only be aware of the TPM2
> > device you've<br> added if you configure the device tree properly.<br>
> > <br> Regards,<br> Philip<br> <br> &gt;
> > &lt;div&gt;pi(a)raspberrypi:~/TPM/tpm2-abrmd $ uname -a&lt;br&gt;<br>
> > &gt; Linux raspberrypi 4.4.50-v7&amp;#43; #1 SMP Wed Mar 14 14:01:00
> > PDT 2018 armv7l GNU/Linux (&amp;lt;=3D=3D includes patch provided by
> > Infineon)&lt;/div&gt;<br> &gt;<br> &gt;
> > &lt;div&gt;&amp;nbsp;&lt;/div&gt;<br>
> > &gt;<br>
> > &gt; &lt;div&gt;pi(a)raspberrypi:~/TPM/tpm2-abrmd $ dmesg | grep
> > tpm&lt;br&gt;<br> &gt; [&amp;nbsp;&amp;nbsp;&amp;nbsp; 3.700384]
> > tpm_spi_tis spi0.1: 2.0 TPM (device-id 0xB6BC, rev-id
> > 16)&lt;/div&gt;<br> &gt;<br> &gt;
> > &lt;div&gt;&amp;nbsp;&lt;/div&gt;<br>
> > &gt;<br>
> > &gt; &lt;div&gt;pi(a)raspberrypi:/etc $ cat
> > /etc/os-release&lt;br&gt;<br> &gt; PRETTY_NAME=3D&amp;quot;Raspbian
> > GNU/Linux 9 (stretch)&amp;quot;&lt;br&gt;<br> &gt;
> > NAME=3D&amp;quot;Raspbian GNU/Linux&amp;quot;&lt;br&gt;<br> &gt;
> > VERSION_ID=3D&amp;quot;9&amp;quot;&lt;br&gt;<br>
> > &gt; VERSION=3D&amp;quot;9 (stretch)&amp;quot;&lt;br&gt;<br> &gt;
> > ID=3Draspbian&lt;br&gt;<br> &gt; ID_LIKE=3Ddebian&lt;br&gt;<br> &gt;
> > HOME_URL=3D&amp;quot;<a href=3D"http://www.raspbian.org/&amp;quot"
> > target=3D"_blank">http://www.raspbian.org/&amp;quot</a>;&lt;br&gt;<br>
> > &gt; SUPPORT_URL=3D&amp;quot;<a
> > href=3D"http://www.raspbian.org/RaspbianForums&amp;quot"
> > target=3D"_blank">http://www.raspbian.org/RaspbianForums&amp;quot</a>;&l
> > t;br&gt;<br> &gt; BUG_REPORT_URL=3D&amp;quot;<a
> > href=3D"http://www.raspbian.org/RaspbianBugs&amp;quot"
> > target=3D"_blank">http://www.raspbian.org/RaspbianBugs&amp;quot</a>;&lt;
> > /div&gt;<br>
> > &gt; &lt;/div&gt;<br>
> > &gt; &lt;/div&gt;<br>
> > &gt; &lt;/div&gt;&lt;/div&gt;&lt;/body&gt;&lt;/html&gt;<br>
> > <br>
> > &gt; _______________________________________________<br>
> > &gt; tpm2 mailing list<br>
> > &gt; tpm2(a)lists.01.org<br>
> > &gt; <a href=3D"https://lists.01.org/mailman/listinfo/tpm2"
> > target=3D"_blank">https://lists.01.org/mailman/listinfo/tpm2</a><br>
> > &nbsp;</div>
> > </div>
> > </div>
> > </div>
> >
> > <div>&nbsp;</div>
> >
> > <div class=3D"signature">&nbsp;</div></div></body></html>
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2

--===============2192389622502624004==--

