use strict;
use warnings;
use utf8;
use Test::More;
use perl5::tokuhirom;

like do {
    local *STDERR;
    open STDERR, '>', \my $buf or die $!;
    my $x = {"OK" => "JOHN"};
    p($x);
    p($x);
    note $buf;
    $buf;
}, qr/OK/;

done_testing;

