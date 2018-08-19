#!/usr/bin/perl

use strict;
use warnings;
use JSON;

my $class = {
    'Person' => {
        'firstName' => q(string),
        'lastName'  => q(string),
        'age'       => q(integer),
        'salary'    => q(integer),
    }
};

#
# Print it out in pretty JSON.
#
my $json = JSON->new;
$json    = $json->canonical([1]);
my $str  = $json->pretty->encode($class);

print $str . qq(\n);
