package HTTP::Throwable::Role::Status::BadGateway;

use Moo::Role;

with(
    'HTTP::Throwable',
    'HTTP::Throwable::Role::BoringText',
);

sub default_status_code { 502 }
sub default_reason      { 'Bad Gateway' }

1;

__END__

# ABSTRACT: 502 Bad Gateway

=head1 DESCRIPTION

The server, while acting as a gateway or proxy, received
an invalid response from the upstream server it accessed
in attempting to fulfill the request.


