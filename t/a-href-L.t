#!perl -T

use strict;

use Test::Builder::Tester tests => 2;
use Test::More;

BEGIN {
    use_ok( 'Test::Pod' );
}

my $file = 't/a-href-L.pod';
test_out( "not ok 1 - POD test for $file" );
pod_file_ok( $file );
test_fail(-1);
test_diag(
    "$file (9): L<text|scheme:...> is invalid according to perlpod",
);
test_test( "$file is bad" );
