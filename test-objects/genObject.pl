#!/usr/bin/perl
#
use strict;
use warnings;
use JSON;
 
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
# Obtain the class definition(s) from the JSON string.
#
my $classes = decode_json($str);

#
# Generate and print a random object per class.
#
for my $className (keys %{ $classes }) {
    my $definition = $classes->{$className};

    # Random object.
    my $obj = genObject($definition);

    # Print it in pretty JSON.
    printJSON($obj);
}

#
# Pretty JSON printer.
#
sub printJSON {
    my $obj = shift;

    my $json = JSON->new;
    $json    = $json->canonical([1]);

    print $json->pretty->encode($obj);
    print qq(\n);
}

#
# Creates a random object given the class definition.
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
# Generates a random value for any type.
#
sub genValue {
    my $type = shift;

    return genString()  if $type =~ m/string/;
    return genInteger() if $type =~ m/integer/;

    die qq(Unknown type `$type');
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
