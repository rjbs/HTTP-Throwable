package HTTP::Throwable::Role::Status::RequestURITooLong;

use Moo::Role;

with(
    'HTTP::Throwable',
    'HTTP::Throwable::Role::BoringText',
);

sub default_status_code { 414 }
sub default_reason      { 'Request-URI Too Long' }

1;

__END__

# ABSTRACT: 414 Request-URI Too Long

=head1 DESCRIPTION

The server is refusing to service the request because the
Request-URI is longer than the server is willing to interpret.
This rare condition is only likely to occur when a client has
improperly converted a POST request to a GET request with long
query information, when the client has descended into a URI
"black hole" of redirection (e.g., a redirected URI prefix that
points to a suffix of itself), or when the server is under attack
by a client attempting to exploit security holes present in some
servers using fixed-length buffers for reading or manipulating
the Request-URI.

