#!/usr/bin/perl

use strict;
use warnings;
use Test::More;

# check that Test::Spelling is installed
eval { require Test::Spelling; Test::Spelling->import() };
plan skip_all => "Test::Spelling required for testing POD spelling" if $@;

add_stopwords(qw/
    NSW
    Hornsby
    Stringifys
    MERCHANTABILITY
/);
all_pod_files_spelling_ok();
