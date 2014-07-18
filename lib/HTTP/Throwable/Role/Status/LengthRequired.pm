package HTTP::Throwable::Role::Status::LengthRequired;

use Moo::Role;

with(
    'HTTP::Throwable',
    'HTTP::Throwable::Role::BoringText',
);

sub default_status_code { 411 }
sub default_reason      { 'Length Required' }

1;

__END__

# ABSTRACT: 411 Length Required

=head1 DESCRIPTION

The server refuses to accept the request without a defined
Content-Length. The client MAY repeat the request if it
adds a valid Content-Length header field containing the
length of the message-body in the request message.
