package HTTP::Throwable::Role::Status::Forbidden;

use Moo::Role;

with(
    'HTTP::Throwable',
    'HTTP::Throwable::Role::BoringText',
);

sub default_status_code { 403 }
sub default_reason      { 'Forbidden' }

1;

__END__

# ABSTRACT: 403 Forbidden

=head1 DESCRIPTION

The server understood the request, but is refusing to fulfill it.
Authorization will not help and the request SHOULD NOT be repeated.
If the request method was not HEAD and the server wishes to make
public why the request has not been fulfilled, it SHOULD describe
the reason for the refusal in the entity. If the server does not
wish to make this information available to the client, the status
code 404 (Not Found) can be used instead.


