#!/usr/bin/perl

use strict;
use warnings;

use Test::More;

BEGIN {
    use_ok('HTTP::Throwable');
    use_ok('MooseX::Role::WithOverloading');
    use_ok('MooseX::StrictConstructor');
    use_ok('Plack::Test');
    use_ok('Test::Moose');
}

done_testing;
