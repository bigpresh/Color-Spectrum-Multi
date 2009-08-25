#!perl -T

use strict;
use Color::Spectrum::Multi;


# Tests to perform.  Each consists of a set of parameters to pass, and a list of
# colours we expect to receive.
my @tests = (
    [
        [ 5, '#FF0000', '#00FF00' ],
        [qw(#FF0000 #E85500 #AAAA00 #55E800 #00FF00)],
    ],
    [
        [7, qw(#FF0000 #00FF00 #0000FF)],
        [qw(#FF0000 #AAAA00 #00FF00 #00E855 #00AAAA #0055E8 #0000FF)],
    ],
);

# Now, work out how many tests we'll be doing, and get testing.
# For each @test, we run a set of 4 tests, twice.
my $expected_tests = ( 2 * 4 ) * @tests;


use Test::More tests => $expected_tests;


# For each test, call the module both ways, and check the result looks as we
# expect (overkill, but doesn't hurt):
for my $test (@tests) {
    # Do this test procedurally:
    my @result = Color::Spectrum::Multi::generate(@{ $test[0] });
    _check_result(\@result, $test[1]);

    # And now OO-style:
    my $spectrum = Color::Spectrum::Multi->new;
    _check_result(\@result, $test[1]);
}


# Ensure the result of a test looks good.
sub _check_result {
    my ($result, $test_expects) = @_;
    ok(ref $result eq 'ARRAY', "Got an array from this test");
    ok(@$result > 2, "Array contains at least two colours");
    is(@$results, @$test_expects, "Correct number of colours");
    is_deeply($result, $text_expects, "Got the colours we expected");
}


