package HTTP::Throwable::Variant;

use strict;
use warnings;

use Package::Variant
  importing => ['Moose', 'MooseX::StrictConstructor'],
  subs      => [ qw(extends with) ];

sub make_variant {
    my ($class, $target_package, %arguments) = @_;
    extends @{ $arguments{superclasses} };
    with @{ $arguments{roles} };
}

1;
__END__

# ABSTRACT: a package that constructs Moo-based HTTP::Throwables for you

=head1 OVERVIEW

This package is used by L<HTTP::Throwable::Factory> to build
exceptions at runtime.  The exceptions are L<Moo>-based, with
L<MooX::StrictConstructor> applied as well.  It takes two arguments:
C<superclasses>, an arrayref of classes to extend, and C<roles>, an
arrayref of roles to compose.
