package bluetooth

import _c "core:c"
import _bt "../../bindtools"

BTPROTO_L2CAP  :: 0;
BTPROTO_HCI    :: 1;
BTPROTO_SCO    :: 2;
BTPROTO_RFCOMM :: 3;
BTPROTO_BNEP   :: 4;
BTPROTO_CMTP   :: 5;
BTPROTO_HIDP   :: 6;
BTPROTO_AVDTP  :: 7;

SOL_HCI       :: 0;
SOL_L2CAP     :: 6;
SOL_SCO       :: 17;
SOL_RFCOMM    :: 18;
SOL_BLUETOOTH :: 274;

BT_SECURITY_SDP    :: 0;
BT_SECURITY_LOW    :: 1;
BT_SECURITY_MEDIUM :: 2;
BT_SECURITY_HIGH   :: 3;
BT_SECURITY_FIPS   :: 4;

BT_DEFER_SETUP :: 7;

BT_FLUSHABLE     :: 8;
BT_FLUSHABLE_OFF :: 0;
BT_FLUSHABLE_ON  :: 1;

BT_POWER                  :: 9;
BT_POWER_FORCE_ACTIVE_OFF :: 0;
BT_POWER_FORCE_ACTIVE_ON  :: 1;

BT_CHANNEL_POLICY                 :: 10;
BT_CHANNEL_POLICY_BREDR_ONLY      :: 0;
BT_CHANELL_POLICY_BREDR_PREFERRED :: 1;
BT_CHANNEL_POLICY_AMP_PREFERRED   :: 2;

BT_VOICE             :: 11;
BT_VOICE_TRANSPARENT :: 0x0003;
BT_VOICE_CVSD_16BIT  :: 0x0060;

BT_SNDMTU :: 12;
BT_RCVMTU :: 13;

/* Connection & socket states */
BT_CONNECTED :: 1;
BT_OPEN      :: 2;
BT_BOUND     :: 3;
BT_LISTEN    :: 4;
BT_CONNECT   :: 5;
BT_CONNECT2  :: 6;
BT_CONFIG    :: 7;
BT_DISCONN   :: 8;
BT_CLOSED    :: 9;

/* BD Address types */
BDADDR_BREDR     :: 0x00;
BDADDR_LE_PUBLIC :: 0x01;
BDADDR_LE_RANDOM :: 0x02;

BDADDR_BREDR     :: &BdAddr{ {0,    0,    0,    0,    0,    0   } };
BDADDR_LE_PUBLIC :: &BdAddr{ {0xff, 0xff, 0xff, 0xff, 0xff, 0xff} };
BDADDR_LE_RANDOM :: &BdAddr{ {0,    0,    0,    0xff, 0xff, 0xff} };
