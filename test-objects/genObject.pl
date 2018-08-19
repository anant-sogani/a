#!/usr/bin/perl
# -----------------------------------------------------------------
# Program to print random objects in JSON, given the definition
# of their class.
# -----------------------------------------------------------------
#

use strict;
use warnings;
use JSON;

#
# -------------------------------------------------------------
# SECTION: Utilities
# -------------------------------------------------------------
# This section defines utility routines for the main logic of
# the program.
# 
# . genString
# . genInteger
# . genValue
# . genObject
#
# . printJSON
# -------------------------------------------------------------
#

#
# Generates a random string of length 5.
#
sub genString {
    my $strLen   = 5;
    my $alphabet = [ qw(A B C D E F G H I J
                        K L M N O P Q R S T
                        U V W X Y Z)
                   ];

    my $alphabetLen = @{ $alphabet };

    my $str;

    for (1 .. $strLen) {
        my $letterIndex = int(rand($alphabetLen));
        my $letter      = $alphabet->[$letterIndex];

        $str .= $letter;
    }

    return $str;
}

#
# Generates a random integer between 1 and 1000.
#
sub genInteger {
    my $start = 1;
    my $stop  = 1000;

    my $range = $stop - $start;

    return $start + int(rand(1 + $range));
}

#
# Generates a random value for any type.
#
sub genValue {
    my $type = shift;

    return genString()  if $type =~ m/string/;
    return genInteger() if $type =~ m/integer/;

    die qq(Unknown type `$type');
}

#
# Generates a random object given a class definition.
#
sub genObject {
    my $definition = shift;

    my %obj;

    #
    # Iterate over each attribute of the class, and
    # generate a random value for it.
    #
    for my $attribute (keys %{ $definition }) {

        # Type.
        my $type = $definition->{$attribute};

        # Value.
        $obj{$attribute} = genValue($type);
    }

    return \%obj;
}

#
# Pretty JSON printer.
#
sub printJSON {
    my $obj = shift;

    my $json = JSON->new;
    $json    = $json->canonical([1]);
    my $str  = $json->pretty->encode($obj);

    print $str . qq(\n);
}


#
# -------------------------------------------------------------
# SECTION: Main
# -------------------------------------------------------------
# This section contains the main logic of the program.
# -------------------------------------------------------------
#

#
# Read the input JSON file into a string.
#
my $str;

{
  local $/;
  open my $jsonf, q(<), $ARGV[0] or die $!;
  $str = <$jsonf>;
  close $jsonf;
}

#
# Covert the JSON string into a hash (aka dictionary).
#
my $classes = decode_json($str);

#
# For every defined class, generate and print a random object
# in JSON.
#
for my $className (keys %{ $classes }) {
    # Class definition.
    my $definition = $classes->{$className};

    # Random object.
    my $obj = genObject($definition);

    # Print pretty JSON.
    printJSON($obj);
}
