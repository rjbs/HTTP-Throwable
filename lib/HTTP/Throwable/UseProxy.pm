package HTTP::Throwable::UseProxy;
use Moose;

extends 'HTTP::Throwable';

has '+status_code' => ( default => 305 );
has '+reason'      => ( default => 'Use Proxy' );

has 'proxy_location' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

around 'build_headers' => sub {
    my $next    = shift;
    my $self    = shift;
    my $headers = $self->$next( @_ );
    push @$headers => ('Location' => $self->proxy_location);
    $headers;
};

__PACKAGE__->meta->make_immutable;

no Moose; 1;

__END__

# ABSTRACT: 305 Use Proxy

=head1 DESCRIPTION

The requested resource MUST be accessed through the proxy given
by the Location field. The Location field gives the URI of the
proxy. The recipient is expected to repeat this single request
via the proxy. 305 responses MUST only be generated by origin
servers.

=head1 ATTRIBUTES

=attr proxy_location

This is a required string, which will be used in the Location header
when creating a PSGI response.



