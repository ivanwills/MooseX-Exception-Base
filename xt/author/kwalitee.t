#!/usr/bin/perl

use strict;
use warnings;

eval { require Test::Kwalitee; Test::Kwalitee->import() };

if ($@) {
    require Test::More;
    Test::More->import;
    plan( skip_all => 'Test::Kwalitee not installed; skipping' );
}
