package HTTP::Throwable::Role::Status::TooManyRequests;

use Moo::Role;

with(
    'HTTP::Throwable',
    'HTTP::Throwable::Role::BoringText',
);

sub default_status_code { 429 }
sub default_reason      { 'Too Many Requests' }

no Moo::Role; 1;

__END__

# ABSTRACT: 429 Too Many Requests

=head1 DESCRIPTION

The 429 status code indicates that the user has sent too many
requests in a given amount of time ("rate limiting"). The response
representations SHOULD include details explaining the condition,
and MAY include a Retry-After header indicating how to wait before
making a new request.

