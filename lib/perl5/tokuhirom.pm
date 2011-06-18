package perl5::tokuhirom;
use strict;
use warnings;
use 5.010001;
our $VERSION = '0.01';
use Exporter;
use File::stat;
use Data::Printer;
use Time::Piece;
use indirect;
use IO::Handle;
use mro ();
use feature ();
use bareword::filehandles ();

sub import {
    my $caller = caller(0);

    strict->import;
    warnings->import;
    utf8->import;
    indirect->unimport;
    autovivification->unimport;
    feature->import( ':5.10' );
    mro::set_mro( $caller, 'c3' );
    bareword::filehandles->import();

    no strict 'refs';
    *{"$caller\::stat"}  = *{"File::stat::stat"};
    *{"$caller\::lstat"} = *{"File::stat::lstat"};
    *{"$caller\::p"}     = *{"Data::Printer::p"};
}

1;
__END__

=encoding utf8

=head1 NAME

perl5::tokuhirom -

=head1 SYNOPSIS

  use perl5::tokuhirom;

=head1 DESCRIPTION

perl5::tokuhirom is

=head1 TODO

    method signature things.
    better internal iterator
    autodie

=head1 AUTHOR

Tokuhiro Matsuno E<lt>tokuhirom AAJKLFJEF GMAIL COME<gt>

=head1 SEE ALSO

=head1 LICENSE

Copyright (C) Tokuhiro Matsuno

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
