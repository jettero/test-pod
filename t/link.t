#!perl -T

use strict;
use warnings;

use Test::Builder::Tester tests => 2;
use Test::More;

BEGIN {
    use_ok( 'Test::Pod' );
}

my $file = 't/link.pod';
test_out( "not ok 1 - POD test for $file" );
pod_file_ok( $file );
test_fail(-1);
test_diag(
    "$file (14): L<text|scheme:...> is invalid according to perlpod",
);
test_test( "$file is bad" );
