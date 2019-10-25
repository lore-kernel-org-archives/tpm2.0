Content-Type: multipart/mixed; boundary="===============7405792548164199948=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] sending commands to simulator
Date: Fri, 25 Oct 2019 19:19:10 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E2BA30@ORSMSX101.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7405792548164199948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Just thought this might be valuable to others. To be more thorough in a tes=
t, we needed a way to send platform commands to the simulator, ideally thro=
ugh bash so we don't need to carry any other C programs.
I threw this little bash function together and thought I would share it for=
 others.

mssim_command() {

  local raw=3D"no"
  local port=3D"2322"
  local ip=3D"127.0.0.1"
  =

  while getopts "a:p:rh" opt; do
    case ${opt} in
      h)
        echo "Send a command to the simulator"
        echo "mssim_command [option] <command>"
        echo "Valid commands are: "
        echo "  on, off, reset, phys_on, phys_off, nv_on, nv_off and failur=
e_mode"
        echo "Additionally any other string can be passed and is interprete=
d as is"
        echo ""
        echo "Valid Options are:"
        echo " -p: Setting port number, defaults to 2321"
        echo " -a: Setting the IP Address, defaults to 127.0.0.1"
        echo " -r: For raw mode, do not interpret the string as a 4 byte u3=
2 via xxd -p -r first"
 		echo " -h: Show this help message"
      ;;
      p )
        port=3D$OPTARG
      ;;
      a )
        ip=3D$OPTARG
      ;;
      r )
        raw=3D"yes"
      ;;
      \? )
        echo "Invalid option: $OPTARG" 1>&2
      ;;
      : )
        echo "Invalid option: $OPTARG requires an argument" 1>&2
      ;;
    esac
    shift
  done

  local arg1=3D"$1"
  if [ -z "$arg1" ]; then
    echo "Expected command as argument"
    return 1
  fi
  =

  local cmd;

  case "$arg1" in

    on)
      cmd=3D"0000001"
      ;;

    off)
      cmd=3D"0000002"
      ;;

    reset)
      cmd=3D"00000011"
      ;;
    =

    phys_on)
      cmd=3D"00000003"
      ;;

    phys_off)
      cmd=3D"00000004"
      ;;
    =

    cancel_on)
      cmd=3D"00000009"
      ;;

    cancel_off)
      cmd=3D"0000000a"
      ;;

    nv_on)
      cmd=3D"0000000b"
      ;;

    nv_off)
      cmd=3D"0000000c"
      ;;
    =

    failure_mode)
      cmd=3D"0000001e"
      ;;

    *)
      cmd=3D"$1"
      ;;
  esac

  if [ "$raw" =3D=3D "yes" ]; then
    echo -n "$cmd" | nc -N "$ip" "$port"
  else
    echo -n "$cmd" | xxd -p -r | nc -N "$ip" "$port"
  fi
}
--===============7405792548164199948==--

