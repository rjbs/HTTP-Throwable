package HTTP::Throwable::Role::Status::NotImplemented;

use Moo::Role;

with(
    'HTTP::Throwable',
    'HTTP::Throwable::Role::BoringText',
);

sub default_status_code { 501 }
sub default_reason      { 'Not Implemented' }

1;

__END__

# ABSTRACT: 501 Not Implemented

=head1 DESCRIPTION

The server does not support the functionality required to
fulfill the request. This is the appropriate response when
the server does not recognize the request method and is
not capable of supporting it for any resource.


