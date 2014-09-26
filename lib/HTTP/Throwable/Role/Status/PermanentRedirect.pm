package HTTP::Throwable::Role::Status::PermanentRedirect;

use Moose::Role;

with(
    'HTTP::Throwable',
    'HTTP::Throwable::Role::BoringText',
    'HTTP::Throwable::Role::Redirect',
);

sub default_status_code { 308 }
sub default_reason      { 'Permanent Redirect' }

no Moose::Role; 1;

__END__

# ABSTRACT: 308 Permanent Redirect

=head1 DESCRIPTION

This status code is defined in L<RFC 7238|http://tools.ietf.org/html/rfc7238>.

The 308 (Permanent Redirect) status code indicates that the target resource has
been assigned a new permanent URI and any future references to this resource
ought to use one of the enclosed URIs.

The server SHOULD generate a Location header field ([RFC7231], Section 7.1.2)
in the response containing a preferred URI reference for the new permanent URI.
The user agent MAY use the Location field value for automatic redirection.  The
server's response payload usually contains a short hypertext note with a
hyperlink to the new URI(s).

