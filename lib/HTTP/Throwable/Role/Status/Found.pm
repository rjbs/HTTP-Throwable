package HTTP::Throwable::Role::Status::Found;

use Moo::Role;

with(
    'HTTP::Throwable',
    'HTTP::Throwable::Role::Redirect',
    'HTTP::Throwable::Role::BoringText',
);

sub default_status_code { 302 }
sub default_reason      { 'Found' }

1;

__END__

# ABSTRACT: 302 Found

=head1 DESCRIPTION

The requested resource resides temporarily under a different URI.
Since the redirection might be altered on occasion, the client
SHOULD continue to use the Request-URI for future requests. This
response is only cacheable if indicated by a Cache-Control or
Expires header field.

The temporary URI SHOULD be given by the Location field in the
response. Unless the request method was HEAD, the entity of the
response SHOULD contain a short hypertext note with a hyperlink
to the new URI(s).

=attr location

This is a required string, which will be used in the Location header
when creating a PSGI response.

