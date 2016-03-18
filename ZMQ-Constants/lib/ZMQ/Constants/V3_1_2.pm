package ZMQ::Constants::V3_1_2;
use strict;
use warnings;
use ZMQ::Constants ();
use Storable ();

my %not_in_v3 = map { ($_ => 1) } qw(
    ZMQ_MAX_VSM_SIZE
    ZMQ_DELIMITER
    ZMQ_VSM
    ZMQ_MSG_MORE
    ZMQ_MSG_SHARED
    ZMQ_MSG_MASK
    ZMQ_HWM
    ZMQ_SWAP
    ZMQ_RECOVERY_IVL_MSEC
    ZMQ_NOBLOCK
    ZMQ_ROUTER_RAW
    ZMQ_IPV6
    ZMQ_MECHANISM
    ZMQ_PLAIN_SERVER
    ZMQ_PLAIN_USERNAME
    ZMQ_PLAIN_PASSWORD
    ZMQ_CURVE_SERVER
    ZMQ_CURVE_PUBLICKEY
    ZMQ_CURVE_SECRETKEY
    ZMQ_CURVE_SERVERKEY
    ZMQ_PROBE_ROUTER
    ZMQ_REQ_CORRELATE
    ZMQ_REQ_RELAXED
    ZMQ_CONFLATE
    ZMQ_ZAP_DOMAIN
);

my $export_tags = Storable::dclone(\%ZMQ::Constants::EXPORT_TAGS);
$export_tags->{socket} = [ 
    'ZMQ_FAIL_UNROUTABLE',
    grep { ! $not_in_v3{$_} } @{ $export_tags->{socket} }
];
$export_tags->{message} = [ 
    grep { ! $not_in_v3{$_} } @{ $export_tags->{message} }
];

ZMQ::Constants::register_set(
    '3.1.2' => (
        tags => $export_tags,
    )
);

1;
