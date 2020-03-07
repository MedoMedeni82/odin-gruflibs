package socket

/* Protocol families.  */
PF_UNSPEC     :: 0;
PF_LOCAL      :: 1;
PF_UNIX	      :: PF_LOCAL;
PF_FILE       :: PF_LOCAL;
PF_INET       :: 2;
PF_AX25       :: 3;
PF_IPX        :: 4;
PF_APPLETALK  :: 5;
PF_NETROM     :: 6;
PF_BRIDGE     :: 7;
PF_ATMPVC     :: 8;
PF_X25        :: 9;
PF_INET6      :: 10;
PF_ROSE       :: 11;
PF_DECNET     :: 12;
PF_NETBEUI    :: 13;
PF_SECURITY   :: 14;
PF_KEY        :: 15;
PF_NETLINK    :: 16;
PF_ROUTE      :: PF_NETLINK;
PF_PACKET     :: 17;
PF_ASH        :: 18;
PF_ECONET     :: 19;
PF_ATMSVC     :: 20;
PF_RDS        :: 21;
PF_SNA        :: 22;
PF_IRDA       :: 23;
PF_PPPOX      :: 24;
PF_WANPIPE    :: 25;
PF_LLC        :: 26;
PF_IB         :: 27;
PF_MPLS       :: 28;
PF_CAN        :: 29;
PF_TIPC       :: 30;
PF_BLUETOOTH  :: 31;
PF_IUCV       :: 32;
PF_RXRPC      :: 33;
PF_ISDN       :: 34;
PF_PHONET     :: 35;
PF_IEEE802154 :: 36;
PF_CAIF       :: 37;
PF_ALG        :: 38;
PF_NFC        :: 39;
PF_VSOCK      :: 40;
PF_KCM        :: 41;
PF_QIPCRTR    :: 42;
PF_SMC        :: 43;
PF_XDP        :: 44;
PF_MAX        :: 45;

/* Address families. */
AF_UNSPEC     :: 0;
AF_LOCAL      :: PF_LOCAL;
AF_UNIX       :: PF_UNIX;
AF_FILE       :: PF_FILE;
AF_INET       :: PF_INET;
AF_AX25       :: PF_AX25;
AF_IPX        :: PF_IPX;
AF_APPLETALK  :: PF_APPLETALK;
AF_NETROM     :: PF_NETROM;
AF_BRIDGE     :: PF_BRIDGE;
AF_ATMPVC     :: PF_ATMPVC;
AF_X25        :: PF_X25;
AF_INET6      :: PF_INET6;
AF_ROSE       :: PF_ROSE;
AF_DECNET     :: PF_DECNET;
AF_NETBEUI    :: PF_NETBEUI;
AF_SECURITY   :: PF_SECURITY;
AF_KEY        :: PF_KEY;
AF_NETLINK    :: PF_NETLINK;
AF_ROUTE      :: PF_ROUTE;
AF_PACKET     :: PF_PACKET;
AF_ASH        :: PF_ASH;
AF_ECONET     :: PF_ECONET;
AF_ATMSVC     :: PF_ATMSVC;
AF_RDS        :: PF_RDS;
AF_SNA        :: PF_SNA;
AF_IRDA       :: PF_IRDA;
AF_PPPOX      :: PF_PPPOX;
AF_WANPIPE    :: PF_WANPIPE;
AF_LLC        :: PF_LLC;
AF_IB         :: PF_IB;
AF_MPLS       :: PF_MPLS;
AF_CAN        :: PF_CAN;
AF_TIPC       :: PF_TIPC;
AF_BLUETOOTH  :: PF_BLUETOOTH;
AF_IUCV       :: PF_IUCV;
AF_RXRPC      :: PF_RXRPC;
AF_ISDN       :: PF_ISDN;
AF_PHONET     :: PF_PHONET;
AF_IEEE802154 :: PF_IEEE802154;;
AF_CAIF       :: PF_CAIF;
AF_ALG        :: PF_ALG;
AF_NFC        :: PF_NFC;
AF_VSOCK      :: PF_VSOCK;
AF_KCM        :: PF_KCM;
AF_QIPCRTR    :: PF_QIPCRTR;
AF_SMC        :: PF_SMC;
AF_XDP        :: PF_XDP;
AF_MAX        :: PF_MAX;

/* Socket level values.  Others are defined in the appropriate headers. */
SOL_RAW       :: 255;
SOL_DECNET    :: 261;
SOL_X25       :: 262;
SOL_PACKET    :: 263;
SOL_ATM       :: 264;
SOL_AAL       :: 265;
SOL_IRDA      :: 266;
SOL_NETBEUI   :: 267;
SOL_LLC       :: 268;
SOL_DCCP      :: 269;
SOL_NETLINK   :: 270;
SOL_TIPC      :: 271;
SOL_RXRPC     :: 272;
SOL_PPPOL2TP  :: 273;
SOL_BLUETOOTH :: 274;
SOL_PNPIPE    :: 275;
SOL_RDS       :: 276;
SOL_IUCV      :: 277;
SOL_CAIF      :: 278;
SOL_ALG       :: 279;
SOL_NFC       :: 280;
SOL_KCM       :: 281;
SOL_TLS       :: 282;
SOL_XDP       :: 283;

/* Maximum queue length specifiable by listen */
SOMAXCONN :: 128;

/* Socket options */
SOL_SOCKET    :: 1;
SO_DEBUG      :: 1;
SO_REUSEADDR  :: 2;
SO_TYPE       :: 3;
SO_ERROR      :: 4;
SO_DONTROUTE  :: 5;
SO_BROADCAST  :: 6;
SO_SNDBUF     :: 7;
SO_RCVBUF     :: 8;
SO_KEEPALIVE  :: 9;
SO_OOBINLINE  :: 10;
SO_NO_CHECK   :: 11;
SO_PRIORITY   :: 12;
SO_LINGER     :: 13;
SO_BSDCOMPAT  :: 14;
SO_REUSEPORT  :: 15;

// Differences for powerpc here?
SO_PASSCRED   :: 16;
SO_PEERCRED   :: 17;
SO_RCVLOWAT   :: 18;
SO_SNDLOWAT   :: 19;
SO_RCVTIMEO   :: 20;
SO_SNDTIMEO   :: 21;
//

// Security levels, as per NRL IPv6, don't actually do anything
SO_SECURITY_AUTHENTICATION       :: 22;
SO_SECURITY_ENCRYPTION_TRANSPORT :: 23;
SO_SECURITY_ENCRYPTION_NETWORK   :: 24;

SO_BINDTODEVICE  :: 25;

// Socket filtering
SO_ATTACH_FILTER :: 26;
SO_DETACH_FILTER :: 27;
SO_GET_FILTER    :: SO_ATTACH_FILTER;

SO_PEERNAME      :: 28;
SO_TIMESTAMP     :: 29;
SCM_TIMESTAMP    :: SO_TIMESTAMP; // part of SCM enum?

SO_ACCEPTCONN    :: 30;

SO_PEERSEC       :: 31;
SO_PASSSEC       :: 34;
SO_TIMESTAMPNS   :: 35;
SCM_TIMESTAMPNS  :: SO_TIMESTAMPNS; // part of SCM enum?

SO_MARK          :: 36;

SO_TIMESTAMPING  :: 37;
SCM_TIMESTAMPING :: SO_TIMESTAMPING; // SCM enum?

SO_PROTOCOL      :: 38;
SO_DOMAIN        :: 39;

SO_RXQ_OVFL      :: 40;

SO_WIFI_STATUS   :: 41;
SCM_WIFI_STATUS  :: SO_WIFI_STATUS; // SCM enum?
SO_PEEK_OFF      :: 42;

// Instruct lower device to use last 4-bytes of socket buffer data as frame check sequence
SO_NOFCS            :: 43;

SO_LOCK_FILTER      :: 44;
SO_SELECT_ERR_QUEUE :: 45;
SO_BUSY_POLL        :: 46;
SO_MAX_PACING_RATE  :: 47;
SO_BPF_EXTENSIONS   :: 48;
SO_INCOMING_CPU     :: 49;

SO_ATTACH_BPF       :: 50;
SO_DETACH_BPF       :: SO_ATTACH_BPF;

SO_ATTACH_REUSEPORT_CBPF :: 51;
SO_ATTACH_REUSEPORT_EBPF :: 52;

SO_CNX_ADVICE       :: 53;
SCM_TIMESTAMPING_OPT_STATS :: 54;
SO_MEMINFO          :: 55;
SO_INCOMING_NAPI_ID :: 56;
SO_COOKIE           :: 57;
SCM_TIMESTAMPING_PKTINFO :: 58;
SO_PEERGROUPS       :: 59;
SO_ZEROCOPY         :: 60;
SO_TXTIME           :: 61;
SCM_TXTIME          :: 62;

/* Socket-level IO control calls */
FIOSETOWN    :: 0x8901;
SIOCSPGRP    :: 0x8902;
FIOGETOWN    :: 0x8903;
SIOCGPGRP    :: 0x8904;
SIOCATMARK   :: 0x8905;
SIOCGSTAMP   :: 0x8906; // get stamp (timeval)
SIOCGSTAMPNS :: 0x8907; // get stamp (timespec)

/* Socket types */
SOCK :: enum {
    STREAM    = 1,
    DGRAM     = 2,
    RAW       = 3,
    RDM       = 4,
    SEQPACKET = 5,
    DCCP      = 6,
    PACKET    = 10,
    CLOEXEC   = 02000000,
    NONBLOCK  = 00004000,
}

/* Socket level message types */
SCM :: enum {
    RIGHTS = 0x01,
    CREDENTIALS = 0x02,
}

/* Send, receive flags */
MSG :: enum {
    OOB          = 0x01,
    PEEK         = 0x02,
    DONTROUTE    = 0x04,
    TRYHARD      = DONTROUTE,
    CTRUNC       = 0x08,
    PROXY        = 0x10,
    TRUNC        = 0x20,
    DONTWAIT     = 0x40,
    EOR          = 0x80,
    WAITALL      = 0x100,
    FIN          = 0x200,
    SYN          = 0x400,
    CONFIRM      = 0x800,
    RST          = 0x1000,
    ERRQUEUE     = 0x2000,
    NOSIGNAL     = 0x4000,
    MORE         = 0x8000,
    WAITFORONE   = 0x10000,
    BATCH        = 0x40000,
    ZEROCOPY     = 0x4000000,
    FASTOPEN     = 0x20000000,
    CMSG_CLOEXEC = 0x40000000,
}

/* Shutdown options */
SHUTDOWN :: enum {
    RD = 0,
    WR = 1,
    RDWR = 2,
}