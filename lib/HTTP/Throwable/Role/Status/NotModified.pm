package HTTP::Throwable::Role::Status::NotModified;

use Moo::Role;

use Plack::Util ();

with(
    'HTTP::Throwable',
    'HTTP::Throwable::Role::Redirect',
    'HTTP::Throwable::Role::BoringText',
);

sub default_status_code { 304 }
sub default_reason      { 'Not Modified' }

around 'as_psgi' => sub {
    my $next = shift;
    my $self = shift;
    my $psgi = $self->$next();

    # MUST NOT have a message body, see below
    Plack::Util::header_set( $psgi->[1], 'Content-Length' => 0 );
    Plack::Util::header_remove( $psgi->[1], 'Content-Type');

    $psgi->[2] = [];

    $psgi;
};

1;

__END__

# ABSTRACT: 304 Not Modified

=head1 DESCRIPTION

If the client has performed a conditional GET request and access
is allowed, but the document has not been modified, the server
SHOULD respond with this status code. The 304 response MUST NOT
contain a message-body, and thus is always terminated by the
first empty line after the header fields.

The response MUST include the following header fields:

=begin :list

= Date, unless its omission is required by section 14.18.1

If a clockless origin server obeys these rules, and proxies and
clients add their own Date to any response received without one
(as already specified by [RFC 2068], section 14.19), caches will
operate correctly.

= ETag and/or Content-Location, if the header would have been sent in a 200 response to the same request

= Expires, Cache-Control, and/or Vary, if the field-value might differ from that sent in any previous response for the same variant

=end :list

If the conditional GET used a strong cache validator, the response
SHOULD NOT include other entity-headers. Otherwise (i.e., the conditional
GET used a weak validator), the response MUST NOT include other
entity-headers; this prevents inconsistencies between cached
entity-bodies and updated headers.

If a 304 response indicates an entity not currently cached, then
the cache MUST disregard the response and repeat the request without
the conditional.

If a cache uses a received 304 response to update a cache entry,
the cache MUST update the entry to reflect any new field values
given in the response.

