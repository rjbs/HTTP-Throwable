package HTTP::Throwable::Role::Status::MethodNotAllowed;

use Type::Utils qw(subtype as where enum);
use Types::Standard qw(ArrayRef);
use List::Util 1.45 qw[ uniq ];

use Moo::Role;

with(
    'HTTP::Throwable',
    'HTTP::Throwable::Role::BoringText',
);

my $method_enum_type = enum "HttpThrowableTypeMethod" => [ qw[
    OPTIONS GET HEAD
    POST PUT DELETE
    TRACE CONNECT
] ];

# TODO: Consider adding a coersion to upper-case lower-cased strings and to
# uniq the given input.  -- rjbs, 2011-02-21
my $method_list_type = subtype "HttpThrowableTypeMethodList",
    as ArrayRef[ $method_enum_type ],
    where { (scalar uniq @{$_}) == (scalar @{$_}) };

sub default_status_code { 405 }
sub default_reason      { 'Method Not Allowed' }

has 'allow' => (
    is       => 'ro',
    isa      => $method_list_type,
    required => 1
);

around 'build_headers' => sub {
    my $next    = shift;
    my $self    = shift;
    my $headers = $self->$next( @_ );
    push @$headers => ('Allow' => join "," => @{ $self->allow });
    $headers;
};


no Moo::Role; 1;
__END__

# ABSTRACT: 405 Method Not Allowed

=head1 DESCRIPTION

The method specified in the Request-Line is not allowed for the
resource identified by the Request-URI. The response MUST include
an Allow header containing a list of valid methods for the requested
resource.

=attr allow

This is an ArrayRef of HTTP methods, it is required and the HTTP
methods will be type checked to ensure validity and uniqueness.

=head1 SEE ALSO

HTTP Methods - L<http://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html>


