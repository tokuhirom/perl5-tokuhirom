package perl5::tokuhirom;
use strict;
use warnings;
use 5.010001;
our $VERSION = '0.01';
use mro ();
use feature ();
use indirect;
use autovivification ();
use bareword::filehandles ();

use IO::Handle;

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
    *{"$caller\::p"} = sub (\[@$%&];%) { # lazy load
        eval { require Data::Printer }
          or die "Cannot load Data::Printer for using 'p' function: $@";
        no warnings 'redefine';
        *{"$caller\::p"} = \&Data::Printer::p;
        goto \&Data::Printer::p;
    };
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
