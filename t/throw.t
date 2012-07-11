#!/usr/bin/perl

package MyException;
use Moose; extends 'MooseX::Exception::Base';
has code => ( is => 'rw', isa => 'Num' );

package MyComplex;
use Moose; extends 'MooseX::Exception::Base';
has complex => (
    is             => 'rw',
    isa            => 'Str',
    traits         => [qw{MooseX::Exception::Stringify}],
    stringify_pre  => 'pre : ',
    stringify_post => ' : post',
    stringify      => sub {return $_},
);

package main;

use strict;
use warnings;
use Test::More;

base();
my_exception();
complex();

done_testing();

sub base {
    eval { MooseX::Exception::Base->throw( error => 'test error' ) };
    my $e = $@;
    ok $e, 'Got an exception';
    is "$e", "test error", "Stringifys correctly";
    my $v = $e->verbose(2);
    ok $v, "get verbose message";
    ok length $v > length $e->verbose(1), "Less verbose message"
        or diag "default length = ".(length $v)."\nshort length = ".(length $e->verbose(1));
}

sub my_exception {
    eval { MyException->throw( error => 'test error', code => 123 ) };
    my $e = $@;
    ok $e, 'Got an exception';
    is "$e", "test error", "Stringifys correctly";
    is $e->code, 123, "Get the code back";
    my $v = $e->verbose(2);
    ok $v, "get verbose message";
    ok length $v > length $e->verbose(1), "Less verbose message";
}

sub complex {
    eval { MyComplex->throw( error => 'test error', complex => 'The complex result' ) };
    my $e = $@;
    ok $e, 'Got an exception';
    is "$e", "test error\npre : The complex result : post", "Stringifys correctly";
}


